ValueType switchCase<KeyType, ValueType>(
  KeyType? selectedOption,
  Map<KeyType, ValueType> branches, {
  required ValueType defaultValue,
}) =>
    branches.containsKey(selectedOption)
        ? branches[selectedOption]!
        : defaultValue;
