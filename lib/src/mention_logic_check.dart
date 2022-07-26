part of flutter_parsed_text_field;

/// Takes the string ie [query] typed by user after trigger symbol & check for validity
bool isQueryValid(String query, int maxChars) {
  // 1. Blank or Empty
  if (query.isBlank) return false;
  // 2. Double Space to Exit in Query Mode
  if ((query.length - query.trimRight().length) > 2) return false;
  // 3. Max chars Cap
  if (query.length > maxChars) return false;

  return true;
}

/// Detect the Trailing Trigger Query (for trigger having space in front)
/// returns start index of detected query
int indexOfTrailingRegexWithSpaceBefore(String txt, RegExp trgr) {
  var idx = txt.lastIndexOf(trgr);
  if (idx <= 0) return idx; // ie idx can be either from {0, 1}
  return txt[idx - 1].isBlank ? idx : -1; // Check for whitespace in front
}
