part of flutter_parsed_text_field;

enum SuggestionPosition { above, below }

class FlutterParsedTextField extends StatefulWidget {
  /// Extension of [TextEditingController] which applies your styles to the parsed text.
  /// This also allows you to get the stringified value of your text.
  ///
  /// Eg "Hey @Ironman" => "Hey [[@Ironman:uid3000]]"
  final FlutterParsedTextFieldController? controller;

  /// A list of [Matcher]s that the widget will use to parse your text.
  final List<Matcher> matchers;

  /// Returns a list of the suggestions that match your current [Matcher].
  ///
  /// Eg "@I" would return "@Ironman" and "@BlackWidow"
  final Function(Matcher? matcher, List matches)? suggestionMatches;

  /// True if you don't want the built-in suggestion list to appear; false otherwise.
  final bool disableSuggestionOverlay;

  /// The max number of suggestions returned when matching
  final int? suggestionLimit;

  /// The position of the built-in suggestion popup; above or below the text field
  final SuggestionPosition? suggestionPosition;

  /// currently detected query (ie token after trigger) will be feeded to this callback
  final ValueChanged<String>? onQueryDetected;

  /// Maximum character for query (constraints)
  final int queryMaxChars;

  /// Height of Suggestion Box
  final double? overlayHeight;

  /// Width of Suggestion Box
  final double? overlayWidth;

  /****************************************************************
      FLUTTER TEXT FIELD PROPS
   ***************************************************************/

  /// {@macro flutter.widgets.editableText.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.editableText.decoration}
  final InputDecoration? decoration;

  /// {@macro flutter.widgets.editableText.keyboardType}
  final TextInputType? keyboardType;

  /// {@macro flutter.widgets.editableText.textInputAction}
  final TextInputAction? textInputAction;

  /// {@macro flutter.widgets.editableText.textCapitalization}
  final TextCapitalization textCapitalization;

  /// {@macro flutter.widgets.editableText.style}
  final TextStyle? style;

  /// {@macro flutter.widgets.editableText.strutStyle}
  final StrutStyle? strutStyle;

  /// {@macro flutter.widgets.editableText.textAlign}
  final TextAlign textAlign;

  /// {@macro flutter.widgets.editableText.textAlignVertical}
  final TextAlignVertical? textAlignVertical;

  /// {@macro flutter.widgets.editableText.textDirection}
  final TextDirection? textDirection;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.editableText.obscuringCharacter}
  final String obscuringCharacter;

  /// {@macro flutter.widgets.editableText.obscureText}
  final bool obscureText;

  /// {@macro flutter.widgets.editableText.autocorrect}
  final bool autocorrect;

  /// {@macro flutter.widgets.editableText.smartDashesType}
  final SmartDashesType? smartDashesType;

  /// {@macro flutter.widgets.editableText.smartQuotesType}
  final SmartQuotesType? smartQuotesType;

  /// {@macro flutter.widgets.editableText.enableSuggestions}
  final bool enableSuggestions;

  /// {@macro flutter.widgets.editableText.maxLines}
  final int? maxLines;

  /// {@macro flutter.widgets.editableText.minLines}
  final int? minLines;

  /// {@macro flutter.widgets.editableText.expands}
  final bool expands;

  /// {@macro flutter.widgets.editableText.readOnly}
  final bool readOnly;

  /// {@macro flutter.widgets.editableText.toolbarOptions}
  final ToolbarOptions? toolbarOptions;

  /// {@macro flutter.widgets.editableText.showCursor}
  final bool? showCursor;

  /// {@macro flutter.widgets.editableText.maxLength}
  final int? maxLength;

  /// {@macro flutter.widgets.editableText.maxLengthEnforcement}
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// {@macro flutter.widgets.editableText.onChanged}
  final ValueChanged<String>? onChanged;

  /// {@macro flutter.widgets.editableText.onEditingComplete}
  final VoidCallback? onEditingComplete;

  /// {@macro flutter.widgets.editableText.onSubmitted}
  final ValueChanged<String>? onSubmitted;

  /// {@macro flutter.widgets.editableText.onAppPrivateCommand}
  final AppPrivateCommandCallback? onAppPrivateCommand;

  /// {@macro flutter.widgets.editableText.inputFormatters}
  final List<TextInputFormatter>? inputFormatters;

  /// {@macro flutter.widgets.editableText.enabled}
  final bool? enabled;

  /// {@macro flutter.widgets.editableText.cursorWidth}
  final double cursorWidth;

  /// {@macro flutter.widgets.editableText.cursorHeight}
  final double? cursorHeight;

  /// {@macro flutter.widgets.editableText.cursorRadius}
  final Radius? cursorRadius;

  /// {@macro flutter.widgets.editableText.cursorColor}
  final Color? cursorColor;

  /// {@macro flutter.widgets.editableText.selectionHeightStyle}
  final ui.BoxHeightStyle selectionHeightStyle;

  /// {@macro flutter.widgets.editableText.selectionWidthStyle}
  final ui.BoxWidthStyle selectionWidthStyle;

  /// {@macro flutter.widgets.editableText.keyboardAppearance}
  final Brightness? keyboardAppearance;

  /// {@macro flutter.widgets.editableText.scrollPadding}
  final EdgeInsets scrollPadding;

  /// {@macro flutter.widgets.editableText.enableInteractiveSelection}
  final bool enableInteractiveSelection;

  /// {@macro flutter.widgets.editableText.selectionControls}
  final TextSelectionControls? selectionControls;

  /// {@macro flutter.widgets.editableText.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// {@macro flutter.widgets.editableText.onTap}
  final GestureTapCallback? onTap;

  /// {@macro flutter.widgets.editableText.mouseCursor}
  final MouseCursor? mouseCursor;

  /// {@macro flutter.widgets.editableText.buildCounter}
  final InputCounterWidgetBuilder? buildCounter;

  /// {@macro flutter.widgets.editableText.scrollPhysics}
  final ScrollPhysics? scrollPhysics;

  /// {@macro flutter.widgets.editableText.scrollController}
  final ScrollController? scrollController;

  /// {@macro flutter.widgets.editableText.autofillHints}
  final Iterable<String>? autofillHints;

  /// {@macro flutter.widgets.editableText.restorationId}
  final String? restorationId;

  /// {@macro flutter.widgets.editableText.enableIMEPersonalizedLearning}
  final bool enableIMEPersonalizedLearning;

  /// Show Indicator that Suggestions are being fetched
  final bool isLoading;

  // TODO: Accomodate this if needed advanced regex for identifying display name
  // TODO: When Some characters are only allowed in Display Name
  // /// Pattern that holds what characters are allowed in display name
  // /// default value :- '[a-zA-Z][a-zA-Z0-9 ]*'
  // /// NOTE: Display name will be start with alphanumeric character
  //final String displayNamePattern;

  const FlutterParsedTextField({
    Key? key,
    this.controller,
    required this.matchers,
    this.suggestionMatches,
    this.disableSuggestionOverlay = false,
    this.suggestionLimit,
    this.suggestionPosition = SuggestionPosition.below,
    // flutter text field props
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.onTap,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
    this.onQueryDetected,
    this.overlayHeight,
    this.overlayWidth,
    this.isLoading = false,
    //this.displayNamePattern = '[a-zA-Z][a-zA-Z0-9 ]*',
    this.queryMaxChars = 12,
  }) : super(key: key);

  @override
  FlutterParsedTextFieldState createState() => FlutterParsedTextFieldState();
}

class FlutterParsedTextFieldState extends State<FlutterParsedTextField> {
  late FlutterParsedTextFieldController _controller;

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _suggestionOverlay;

  String _triggerPattern = '';
  // TODO: advanced regex to find last index of mention when email is also included in searched query text
  //RegExp? _trailingMentionRegex;

  //bool _ignore = false;

  /// Apply the selected [suggestion] from the [matcher] to the text field.
  /// This will replace the partial text with the suggestion.
  ///
  /// Eg text field of "Hey @Ir", then applying will result in "Hey @Ironman"
  void applySuggestion<T>({
    required Matcher matcher,
    required T suggestion,
  }) {
    assert(matcher.indexOfMatch != null && matcher.lengthOfMatch != null);

    final tag = "${matcher.trigger}${matcher.displayProp(suggestion)}";
    final replacement = '$tag ';
    var newText = _controller.value.text.replaceRange(
      matcher.indexOfMatch!,
      matcher.indexOfMatch! + matcher.lengthOfMatch!,
      replacement,
    );

    var newSel = TextSelection.fromPosition(
        TextPosition(offset: matcher.indexOfMatch! + replacement.length));

    // Register the Tag/Suggestion Picked
    if (matcher.needToPickFirstSuggestion) {
      _controller.addPickup(tag);
    }

    //_ignore = true;
    // ! -> Only Listener will be Notified (not onChanged)
    _controller.value = _controller.value.copyWith(
      text: newText,
      selection: newSel,
    );

    if (matcher.onSuggestionAdded != null) {
      matcher.onSuggestionAdded!(matcher.trigger, suggestion);
    }
  }

  void _showSuggestionsOverlay<T>({
    required Matcher matcher,
    required List<T> suggestions,
  }) {
    final renderBox = context.findRenderObject() as RenderBox?;
    String notifyTxt = '';
    if (suggestions.isEmpty) {
      if (widget.isLoading) {
        // TODO: Take this notifyText to param level
        notifyTxt = 'Searching...';
      }
      // } else {
      //   notifyTxt = 'No results found !';
      // }
    }

    if (notifyTxt.isEmpty && suggestions.isEmpty) {
      _hideSuggestionOverlay();
      return;
    }

    if (renderBox != null) {
      _hideSuggestionOverlay();

      _suggestionOverlay = OverlayEntry(
        builder: (context) {
          if (!renderBox.attached) {
            return const SizedBox();
          }

          var globalOffset = renderBox.localToGlobal(Offset.zero);
          var size = renderBox.size;
          var spaceBelow = MediaQuery.of(context).size.height -
              MediaQuery.of(context).viewInsets.bottom -
              globalOffset.dy -
              size.height -
              16;
          var spaceAbove = globalOffset.dy -
              MediaQuery.of(context).padding.top -
              kToolbarHeight -
              16;

          var h = widget.suggestionPosition == SuggestionPosition.above
              ? spaceAbove
              : spaceBelow;
          h = min(h, widget.overlayHeight ?? double.infinity);
          var w = min(size.width, widget.overlayWidth ?? double.infinity);

          return Positioned(
            width: w,
            height: h,
            child: CompositedTransformFollower(
              link: _layerLink,
              followerAnchor:
                  widget.suggestionPosition == SuggestionPosition.above
                      ? Alignment.bottomLeft
                      : Alignment.topLeft,
              targetAnchor:
                  widget.suggestionPosition == SuggestionPosition.above
                      ? Alignment.topLeft
                      : Alignment.bottomLeft,
              showWhenUnlinked: false,
              offset: Offset(
                  0,
                  widget.suggestionPosition == SuggestionPosition.above
                      ? -8
                      : 8),
              child: Align(
                alignment: widget.suggestionPosition == SuggestionPosition.above
                    ? Alignment.bottomCenter
                    : Alignment.topCenter,
                child: Material(
                  elevation: 4,
                  child: notifyTxt.isNotEmpty
                      ? ListTile(title: Text(notifyTxt))
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: suggestions.length,
                          itemBuilder: (BuildContext context, int index) {
                            final suggestion = suggestions[index];

                            if (matcher.suggestionBuilder != null) {
                              return matcher.suggestionBuilder!(
                                matcher,
                                suggestion,
                              );
                            }

                            return ListTile(
                              title: Text('${matcher.displayProp(suggestion)}'),
                              onTap: () {
                                applySuggestion(
                                  matcher: matcher,
                                  suggestion: suggestion,
                                );
                                _hideSuggestionOverlay();
                              },
                            );
                          },
                        ),
                ),
              ),
            ),
          );
        },
      );

      Overlay.of(context)!.insert(_suggestionOverlay!);
    }
  }

  void _hideSuggestionOverlay() {
    _suggestionOverlay?.remove();
    _suggestionOverlay = null;
  }

  // void _suggestionListener() {
  //   final cursorPos = _controller.selection.baseOffset;

  //   if (cursorPos > 0) {
  //     final text = _controller.value.text;
  //     final lastIndexOfSpace = text.lastIndexOf(RegExp(r'\s'), cursorPos - 1);

  //     var indexOfMatch = lastIndexOfSpace + 1;

  //     final token = text.substring(indexOfMatch).split(RegExp(r'(\s)')).first;
  //     var lengthOfMatch = token.length;

  //     if (token.isNotEmpty) {
  //       final matchers =
  //           widget.matchers.where((matcher) => matcher.trigger == token[0]);

  //       if (matchers.length > 1) {
  //         throw 'Multiple matchers match $token';
  //       }

  //       if (matchers.length == 1) {
  //         final search = token.substring(1);
  //         final matcher = matchers.first;

  //         var matchedSuggestions = matcher.suggestions.where((e) {
  //           switch (matcher.searchStyle) {
  //             case MatcherSearchStyle.startsWith:
  //               return matcher.displayProp(e).startsWith(search);
  //             case MatcherSearchStyle.contains:
  //               return matcher.displayProp(e).contains(search);
  //             case MatcherSearchStyle.iStartsWith:
  //               return matcher
  //                   .displayProp(e)
  //                   .toLowerCase()
  //                   .startsWith(search.toLowerCase());
  //             case MatcherSearchStyle.iContains:
  //               return matcher
  //                   .displayProp(e)
  //                   .toLowerCase()
  //                   .contains(search.toLowerCase());
  //           }
  //         }).toList();

  //         if (matcher.resultSort != null) {
  //           matchedSuggestions
  //               .sort((a, b) => matcher.resultSort!(search, a, b));
  //         }

  //         if (widget.suggestionLimit != null) {
  //           matchedSuggestions =
  //               matchedSuggestions.take(widget.suggestionLimit!).toList();
  //         }

  //         if (matcher.finalResultSort != null) {
  //           matchedSuggestions
  //               .sort((a, b) => matcher.finalResultSort!(search, a, b));
  //         }

  //         matcher.indexOfMatch = indexOfMatch;
  //         matcher.lengthOfMatch = lengthOfMatch;

  //         if (widget.suggestionMatches != null) {
  //           widget.suggestionMatches!(matcher, matchedSuggestions);
  //         }

  //         if (!widget.disableSuggestionOverlay) {
  //           _showSuggestionsOverlay(
  //             matcher: matcher,
  //             suggestions: matchedSuggestions,
  //           );
  //         }

  //         return;
  //       }
  //     }
  //   }

  //   if (widget.suggestionMatches != null) {
  //     widget.suggestionMatches!(null, []);
  //   }

  //   _hideSuggestionOverlay();
  // }

  // TODO: Do make below changes if text length changes ! (not when cursor changes)
  void _suggestionListener2() {
    if (_triggerPattern.isEmpty) return;

    final cursorPos = _controller.selection.baseOffset;

    //* REMEMBER :_ CursorPos = #characters behind it
    if (cursorPos > 0) {
      final text = _controller.value.text;
      //final lastIndexOfSpace = text.lastIndexOf(RegExp(r'\s'), cursorPos - 1);

      final textBeforeCursor = text.substring(0, cursorPos);
      // TODO: improve below mwthod to detect the actual last idx for valid '@'
      // TODO: Inorder to facilitate the trigger with length more than 1 (Not needed at moment)

      // TODO: Improve finding last index for valid trigger (esp when email is included in query itself)
      //       Eg "The furious @fox gimmy@fox.com gotcha stick"
      // find last Index of [trgr] in [txt] (with space before [trgr])
      // final indexOfMatch =
      //     _trailingMentionRegex?.firstMatch(textBeforeCursor)?.start ?? -1;

      // Detect Last Mention in [textBeforeCursor]
      var indexOfMatch = indexOfTrailingRegexWithSpaceBefore(
        textBeforeCursor,
        RegExp(_triggerPattern),
      );

      //final shouldTrigger = token.startsWith(RegExp(_triggerPattern));
      final token = indexOfMatch != -1
          ? textBeforeCursor.substring(indexOfMatch, cursorPos)
          : '';

      if (token.isNotBlank) {
        var lengthOfMatch = token.length;
        final matchers =
            widget.matchers.where((matcher) => matcher.trigger == token[0]);

        if (matchers.length > 1) {
          throw 'Multiple matchers match $token';
        }

        if (matchers.length == 1) {
          final search = token.substring(1);

          final valid = isQueryValid(search, widget.queryMaxChars);

          // if (search.isBlank) {
          //   // TODO: Decide if to display all suggestions on {trgr} character or none
          //   _hideSuggestionOverlay();
          //   return;
          // }

          // // TODO: Check Trailing Space Length (thresold) to proceed ahead
          // // TODO this is wrong, you need to consoder the length of matched regex (not 1 directly)
          // // ! In the case trigger is not a character but a string then this will be ambiguous
          // var trimmedSearch = search.trimRight();
          // if ((search.length - trimmedSearch.length) > 2) {
          //   // TODO Check this & Verify if to hide Suggestion Box or not
          //   _hideSuggestionOverlay();
          //   return;
          // }

          if (!valid) {
            _hideSuggestionOverlay();
            return;
          }

          // TODO: Check if need to keep the constraints of maxLength for search
          if (widget.onQueryDetected != null) {
            final lastChar = search[search.length - 1];

            if (lastChar.isNotBlank) {
              widget.onQueryDetected!.call(search);
            }
          }

          final matcher = matchers.first;

          matcher.indexOfMatch = indexOfMatch;
          matcher.lengthOfMatch = lengthOfMatch;

          var matchedSuggestions = matcher.suggestions.where((e) {
            switch (matcher.searchStyle) {
              case MatcherSearchStyle.startsWith:
                return matcher.displayProp(e).startsWith(search);
              case MatcherSearchStyle.contains:
                return matcher.displayProp(e).contains(search);
              case MatcherSearchStyle.iStartsWith:
                return matcher
                    .displayProp(e)
                    .toLowerCase()
                    .startsWith(search.toLowerCase());
              case MatcherSearchStyle.iContains:
                return matcher
                    .displayProp(e)
                    .toLowerCase()
                    .contains(search.toLowerCase());
            }
          }).toList();

          if (matcher.resultSort != null) {
            matchedSuggestions
                .sort((a, b) => matcher.resultSort!(search, a, b));
          }

          if (widget.suggestionLimit != null) {
            matchedSuggestions =
                matchedSuggestions.take(widget.suggestionLimit!).toList();
          }

          if (matcher.finalResultSort != null) {
            matchedSuggestions
                .sort((a, b) => matcher.finalResultSort!(search, a, b));
          }

          if (widget.suggestionMatches != null) {
            widget.suggestionMatches!(matcher, matchedSuggestions);
          }

          if (!widget.disableSuggestionOverlay) {
            _showSuggestionsOverlay(
              matcher: matcher,
              suggestions: matchedSuggestions,
            );
          }

          return;
        }
      }
    }

    if (widget.suggestionMatches != null) {
      widget.suggestionMatches!(null, []);
    }

    _hideSuggestionOverlay();
  }

  void _applySuggestionListener() {
    applySuggestion(
      matcher: context.read<SuggestionApplier>().matcher!,
      suggestion: context.read<SuggestionApplier>().suggestionToApply!,
    );

    _hideSuggestionOverlay();
  }

  /// Join all triggers by {delim}
  String _pippedTriggers(List<Matcher> matchers) {
    return matchers.map((m) => m.trigger).toSet().join('|');
  }

  void _onChangedImpl(String txt) {
    widget.onChanged?.call(txt);
    _controller.updatePickedTags(); // remove tags if needed !

    //* TODO: Decide if you need to show suggestion box as cursor changes or text changes
    _suggestionListener2();
  }

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? FlutterParsedTextFieldController();
    _triggerPattern = _pippedTriggers(widget.matchers);
    //_trailingMentionRegex = _deriveTrailingMentionRegex(_triggerPattern);
    _controller.matchers = widget.matchers;

    // TODO: UnComment below if you want to listen Cursor-Level Changes
    //_controller.addListener(_suggestionListener2);
  }

  // bool isLastWordAToken(
  //   String text,
  //   RegExp trigger, {
  //   bool requireSpaceBefore = true,
  // }) {
  //   final lastWord = text.split(RegExp(r'\s+')).last;
  //   if()
  //   return ((lastWord.length > 1) && (lastWord.startsWith('@')));
  // }

  @override
  void didUpdateWidget(covariant FlutterParsedTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _triggerPattern = _pippedTriggers(widget.matchers);
    //_trailingMentionRegex = _deriveTrailingMentionRegex(_triggerPattern);
    _controller.matchers = widget.matchers;

    // // ATTEMPT 1 ---------------
    // // if (isLastWordAToken(_controller.text, RegExp(_triggerPattern))) {
    // // To Show the Overlay
    // final i = WidgetsBinding.instance;
    // if (i != null) {
    //   // TODO: Making this check just to enusre it works for flutter 2.10 version
    //   i.addPostFrameCallback(
    //     (_) {
    //       //if (!widget.isLoading && (oldWidget.isLoading != widget.isLoading)) {
    //       // TODO: Check for ListData also here
    //       if (oldWidget.isLoading != widget.isLoading) {
    //         // API call ended or initiated
    //         // TODO: Improve this action taking call (ie not always)
    //         _suggestionListener2();
    //       }
    //     },
    //   );
    //   //}
    // }

    // // ATTEMPT 2 ------------
    // if (widget.isLoading != oldWidget.isLoading) {
    //   // Just trying a Hack to check if it works in 2.10
    //   Future(_suggestionListener2);
    // }

    // As didUpdate for loading check is not working for consecutive isLoading value changes
    Future(_suggestionListener2).ignore();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    context
        .watch<SuggestionApplier?>()
        ?.removeListener(_applySuggestionListener);
    context.watch<SuggestionApplier?>()?.addListener(_applySuggestionListener);
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (hasFocus) {
          if (!hasFocus) {
            _hideSuggestionOverlay();
          }
        },
        child: TextField(
          controller: widget.controller,
          decoration: widget.decoration,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          style: widget.style,
          strutStyle: widget.strutStyle,
          textAlign: widget.textAlign,
          textAlignVertical: widget.textAlignVertical,
          textDirection: widget.textDirection,
          readOnly: widget.readOnly,
          toolbarOptions: widget.toolbarOptions,
          showCursor: widget.showCursor,
          autofocus: widget.autofocus,
          obscuringCharacter: widget.obscuringCharacter,
          obscureText: widget.obscureText,
          autocorrect: widget.autocorrect,
          smartDashesType: widget.smartDashesType,
          smartQuotesType: widget.smartQuotesType,
          enableSuggestions: widget.enableSuggestions,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          expands: widget.expands,
          maxLength: widget.maxLength,
          maxLengthEnforcement: widget.maxLengthEnforcement,
          onChanged: _onChangedImpl,
          onEditingComplete: widget.onEditingComplete,
          onSubmitted: widget.onSubmitted,
          onAppPrivateCommand: widget.onAppPrivateCommand,
          inputFormatters: widget.inputFormatters,
          enabled: widget.enabled,
          cursorWidth: widget.cursorWidth,
          cursorHeight: widget.cursorHeight,
          cursorRadius: widget.cursorRadius,
          cursorColor: widget.cursorColor,
          selectionHeightStyle: widget.selectionHeightStyle,
          selectionWidthStyle: widget.selectionWidthStyle,
          keyboardAppearance: widget.keyboardAppearance,
          scrollPadding: widget.scrollPadding,
          dragStartBehavior: widget.dragStartBehavior,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          selectionControls: widget.selectionControls,
          onTap: widget.onTap,
          mouseCursor: widget.mouseCursor,
          buildCounter: widget.buildCounter,
          scrollController: widget.scrollController,
          scrollPhysics: widget.scrollPhysics,
          autofillHints: widget.autofillHints,
          restorationId: widget.restorationId,
          enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: UnComment below if you want to listen Cursor-Level Changes
    //_controller.removeListener(_suggestionListener2);

    super.dispose();
  }
}
