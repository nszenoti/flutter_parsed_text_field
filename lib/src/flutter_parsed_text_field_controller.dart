part of flutter_parsed_text_field;

class FlutterParsedTextFieldController extends TextEditingController {
  /// The list of matchers that are to be recognized in this text field
  List<Matcher> _matchers = [];

  // TODO : Optimize this _combinedRegex thing
  // RegExp get _combinedRegex => RegExp(
  //     matchers.map((m) => m.regexPattern).where((e) => e.isNotEmpty).join('|'));
  RegExp _combinedRegex = RegExp('');

  RegExp get _combinedParseRegex =>
      RegExp(_matchers.map((m) => m.parseRegExp.pattern).join('|'));

  FlutterParsedTextFieldController() : super();

  set matchers(List<Matcher> ms) {
    _matchers = ms;
    // Update combined regex
    // NOTE Combined Regex will only changed when matchers/Suggestions list gets updated
    _combinedRegex = RegExp(_matchers
        .map((m) => m.regexPattern)
        .where((e) => e.isNotEmpty)
        .join('|'));
  }

  set textParsed(val) => text = parse(val);

  Set<String> _picked = <String>{}; // set of mentions which are picked from box

  /// Track the picked Suggestion from suggestion box
  void addPickup(String s) {
    _picked.add(s);
  }

  /// Return the parsed version of your text
  ///
  /// Eg "Hey [[@Ironman:uid3000]]" => "Hey @Ironman"
  String parse(String stringifiedText) {
    if (_combinedParseRegex.pattern.isEmpty) {
      return stringifiedText;
    }

    return stringifiedText.splitMapJoin(
      _combinedParseRegex,
      onMatch: (Match match) {
        final fullMatch = match[0]!;
        final matcher =
            _matchers.firstWhere((m) => m.parseRegExp.hasMatch(fullMatch));
        final parsedMatch = matcher.parse(matcher.parseRegExp, fullMatch);
        final suggestions = matcher.suggestions
            .where((s) => matcher.idProp(s) == matcher.idProp(parsedMatch))
            .toList();

        if (suggestions.isNotEmpty) {
          assert(suggestions.length == 1);
          return '${matcher.trigger}${matcher.displayProp(suggestions.first)}';
        }

        if (matcher.alwaysHighlight) {
          return '${matcher.trigger}${matcher.displayProp(parsedMatch)}';
        }

        // ! TODO: Check this below scenario
        return fullMatch;
        //throw '`suggestions` is empty and `alwaysHighlight` is false.';
      },
      onNonMatch: (String text) => text,
    );
  }

  /// Return the stringified version of your text
  ///
  /// Eg "Hey @Ironman" => "Hey [[@Ironman:uid3000]]"
  String stringify() {
    //TODO: Add check for combinedRegex
    if (_combinedRegex.pattern.isEmpty) {
      return text;
    }

    // TODO> Use splitApply() to optimize
    return text.splitMapJoin(
      _combinedRegex,
      onMatch: (Match match) {
        // TODO: Wrap with try catch
        final display = match[0]!; // text which will get displayed in TextField
        final matcher = _matchers.firstWhere((m) =>
            m.regexPattern.isNotEmpty &&
            RegExp(m.regexPattern).hasMatch(display));
        final suggestions = matcher.suggestions
            .where(
                (e) => '${matcher.trigger}${matcher.displayProp(e)}' == display)
            .toList();

        if (suggestions.isNotEmpty) {
          // TODO: This is hindering the Same Multi-Display Name
          //assert(suggestions.length == 1);
          // ! if suggestions length is more than 1 i.e that more than 1 suggestion have same display name
          if (matcher.needToPickFirstSuggestion) {
            if (_picked.contains(display)) {
              return matcher.stringify(matcher.trigger, suggestions.first);
            } else {
              return display;
            }
          } else {
            return matcher.stringify(matcher.trigger, suggestions.first);
          }
        } else {
          // No suggestion found (ie that any word with this trigger is allowed ie alwaysHighlight)
          if (!matcher.needToPickFirstSuggestion && matcher.alwaysHighlight) {
            return matcher.stringify(matcher.trigger, display);
          }
        }

        return display;
        //throw '`suggestions` is empty and `alwaysHighlight` is false.';
      },
      onNonMatch: (String text) => text,
    );
  }

  void updatePickedTags() {
    if (_picked.isEmpty) return;
    var present = <String>{};

    text.splitMapJoin(
      _combinedRegex,
      onMatch: (Match match) {
        var tag = match[0]!;
        if (_picked.contains(tag)) {
          present.add(tag);
        }
        return '';
      },
      onNonMatch: (String text) {
        return '';
      },
    );

    // Update the picked annotations set
    //var dropped = _picked.difference(present);

    //if (dropped.isNotEmpty) {
    _picked = _picked.intersection(present);
    //}

    // TODO: Add functionality for notifying Dropped Tags (ie Create Map of Tag -> Id)
    // // var dropped = _registry.intersection(anots);
    // if (dropped.isNotEmpty) {
    //   for (var d in dropped) {
    //     //_registry.removeAll(droppedOut);
    //     var annot = _mapping[d];
    //     var m = {'id': annot?.id, 'display': annot?.display};
    //     onMentionDrop?.call(m);
    //   }
    // }
  }

  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    if (_combinedRegex.pattern.isEmpty) {
      return TextSpan(
        text: text,
        style: style,
      );
    }

    var widgets = List<InlineSpan>.empty(growable: true);

    text.splitMapJoin(
      _combinedRegex,
      onMatch: (Match match) {
        final matcher = _matchers
            .firstWhere((m) => RegExp(m.regexPattern).hasMatch(match[0]!));

        final txt = match[0];
        final doAddCustomStyle =
            matcher.needToPickFirstSuggestion ? _picked.contains(txt) : true;
        if (doAddCustomStyle) {
          widgets.add(
            TextSpan(
              text: match[0],
              style: style!.merge(matcher.style),
            ),
          );
        } else {
          widgets.add(TextSpan(text: txt, style: style));
        }

        return '';
      },
      onNonMatch: (String text) {
        widgets.add(TextSpan(text: text, style: style));

        return '';
      },
    );

    return TextSpan(style: style, children: widgets);
  }
}
