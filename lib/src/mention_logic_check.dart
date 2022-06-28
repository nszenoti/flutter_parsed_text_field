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

  // /// Derive the RegExp for mentions with trigger [trgrsPat] S.T there is space before trigger
  // RegExp? _deriveTrailingMentionRegex(String trgrsPat) {
  //   if (trgrsPat.isEmpty) {
  //     return null;
  //   }
  //   //! May be Slower due to solely Regex Approach
  //   final mentionPat = '($trgrsPat)';
  //   return RegExp('(?<=^| )$mentionPat\$');
  // }

  // ///find last Index of [trgr] in [txt] (with space before [trgr])
  // int _findTrailingIndex({required String txt, RegExp? regex}) {
  //   if (regex != null) {
  //     var m = regex.firstMatch(txt);
  //     return m?.start ?? -1;
  //   }
  //   return -1;
  // }

  // ///  Takes the string typed by user after [trgr] symbol
  // String doTriggerCheckAndGetQuery(
  //   String text,
  //   List<String> _trgrs, {
  //   int maxChars = 12,
  // }) {
  //   String query = "";
  //   final _trgrsRegex = _trgrs.join('|');
  //   if (text.contains(_trgrsRegex)) {
  //     var providedSearchTxt = '';
  //     for (final t in _trgrs) {
  //       providedSearchTxt = subStringAfterLast(text, t);
  //       if (providedSearchTxt.isNotEmpty) break;
  //     }

  //     // Check if search txt is within {maxChar}
  //     if (providedSearchTxt.isNotEmpty &&
  //         providedSearchTxt.length <= maxChars &&
  //         beginsWithAlphaNumericCharacter(providedSearchTxt)) {
  //       final trgrPos = text.lastIndexOf(_trgrsRegex);
  //       // Check if there is space before
  //       if (trgrPos == 0 || text[trgrPos - 1].isBlank) {
  //         query = providedSearchTxt;
  //       }
  //     }
  //   }
  //   return query;
  // }


