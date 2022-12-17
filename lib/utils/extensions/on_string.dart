extension StringExtension on String {
  String toTitleCase() {
    String currentString = this;
    String firstAlphabet = currentString[0].toUpperCase();
    currentString = currentString.replaceRange(0, 1, firstAlphabet);
    return currentString;
  }
}
