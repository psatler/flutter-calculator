class Memory {
  // operations supported by the calculator
  static const operations = const ['%', '/', 'x', '-', '+', '='];

  // buffer to store the numbers typed by the user
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String operation;
  String _value = '0'; // private variable
  bool _wipeValue = false;

  // getter
  String get value {
    return _value;
  }

  _allClear() {
    _value = '0';
  }

  _setOperation(String newOperation) {
    // when you setting a operation, we clear the display
    _wipeValue = true;
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