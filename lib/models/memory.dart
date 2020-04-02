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
    _wipeValue = true; // to clear the previous typed values of the screen
  }

  _addDigit(String digit) {
    final isDot = digit == '.';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;

    final currentValue = wipeValue ? '' : _value;
    _value = currentValue + digit;
    _wipeValue = false;
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