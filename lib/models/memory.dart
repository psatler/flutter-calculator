class Memory {
  String _value = '0'; // private variable

  // getter
  String get value {
    return _value;
  }

  _allClear() {
    _value = '0';
  }

  void applyCommand(String command) {
    if(command == 'AC') {
      _allClear();
      return;
    }
    _value += command;
  }
}