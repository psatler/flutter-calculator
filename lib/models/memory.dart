class Memory {
  // operations supported by the calculator
  static const operations = const ['%', '/', 'x', '-', '+', '='];

  // buffer to store the numbers typed by the user
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String _operation;
  String _value = '0'; // private variable
  bool _wipeValue = false;

  // getter
  String get value {
    return _value;
  }

  _allClear() {
    _value = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operation = null;
    _wipeValue = false;
  }

  _calculate() {
    switch(_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0]; // in case the user continues pressing the equal sign
    }
  }

  _setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=';

    if(_bufferIndex == 0) {
      if(!isEqualSign) {
        _operation = newOperation;
        _bufferIndex = 1;

        // when you setting a operation, we clear the display
        _wipeValue = true;
      }
    } else {
      // the user is setting a third value, so we perform the operation set with the first two ones
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;
      _bufferIndex = 0;

      // display the calculated value on the display
      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;

      // if the user pressed the equal sign
      _operation = isEqualSign ? null : newOperation;
      _bufferIndex = isEqualSign ? 0 : 1;
    }
    _wipeValue = true; // !isEqualSign;
  }

  _addDigit(String digit) {
    final isDot = digit == '.';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;

    // check if we pressing a period more than one time at the current display
    if(isDot && _value.contains('.') && !wipeValue) {
      return;
    }

    // if wipeValue true, we setting a new operation
    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;

    // save the value inside the buffer
    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  void applyCommand(String command) {
    if(command == 'AC') {
      _allClear();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command); 
    }
  }
}