bool isPalindrome(String str) {
  String strRemovedWhiteSpace = removeWhiteSpaces(str).toLowerCase();
  String reversedStr =
      String.fromCharCodes(strRemovedWhiteSpace.codeUnits.reversed);
  return reversedStr == strRemovedWhiteSpace;
}

String removeWhiteSpaces(String str) {
  final regexPattern = RegExp('\\s+');
  return str.replaceAll(regexPattern, '');
}