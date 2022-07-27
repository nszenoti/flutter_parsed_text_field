A flutter package which lets you use styled @mentions and #hashtags or other similar mentions with suggestions in your TextField.

> NOTE : 
> This package is modified version of `flutter_parsed_text_field`
> original package ref : https://pub.dev/packages/flutter_parsed_text_field 

<br>

*New features added* :
- callback for detected query ie `onQueryDetected` (inorder to act on currently detected query)
- limit the query by characters `queryMaxChars`
- customize the size (height, width) of an overlay
- provision to pick first suggestion from overlay, mandatorily

# Table of contents

- [Installing](#installing)
- [Usage](#usage)
- [Custom Suggestion List](#custom-suggestion-list)

# Installing

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_parsed_text_field:
    git:
      url: https://github.com/nszenoti/flutter_parsed_text_field
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```
$ pub get
```

with `Flutter`:

```
$ flutter pub get
```

### 3. Import it

Now in your `Dart` code, you can use:

```dart
import 'package:flutter_parsed_text_field/flutter_parsed_text_field.dart';
```

# Usage

### `FlutterParsedTextField` is a _Stateful Widget_ that extends TextField.

```dart
FlutterParsedTextField(
    controller: controller.flutterParsedTextEditingController,
    suggestionMatches: suggestionMatches,
    disableSuggestionOverlay: disableSuggestionOverlay,
    suggestionLimit: suggestionLimit,
    suggestionPosition: suggestionPosition,
    matchers: [],
)
```

Configurable properties:

- `controller` – extension of `TextEditingController` which styles your parsed text field
- `disableSuggestionOverlay` –  `true` if you don't want the built-in suggestion list to appear; `false` otherwise.
- `suggestionLimit` – number of suggestions to return
- `suggestionPosition` – should the suggestion list appear above or below the text field
- `matchers` - a list of `Matcher` which defines the triggers and suggestions
- `queryMaxChars` - number of max characters allowed in detected query
- `overlayHeight` - max height of an suggestion overlay box
- `overlayWidth` - max-width of an suggestion overlay box

Callbacks:

- `suggestionMatches` – returns a list of the suggestions that are matched
- `onQueryDetected` - returns the query token detected (i.e after trigger character)

### `Matcher`

```dart
Matcher<String>(
    trigger: "#",
    suggestions: ['BattleOfNewYork', 'InfinityGauntlet'],
    idProp: (hashtag) => hashtag,
    displayProp: (hashtag) => hashtag,
    style: const TextStyle(color: Colors.blue),
    stringify: (trigger, hashtag) => hashtag,
    alwaysHighlight: true,
    parse: (hashtagString) => hashtagString.substring(1),
)
```

Configurable properties:

- `trigger` - single character to trigger suggestions
- `suggestions` - list of suggestions
- `idProp` - get the id of the suggestion
- `displayProp` - get the display of the suggestion
- `style` - TextStyle for matches
- `stringify` - convert the suggestion into a parsable string
- `alwaysHighlight` - always apply style even if there isn't a matching suggestion
- `parse` - convert the parsable string into a suggestion
- `needToPickFirstSuggestion` - `true` if need to pick first mention compulsorily from overlay suggestion box

# Custom Suggestion List
If you dont want the built-in popup to appear, and instead display the suggestions elsewhere, you can!
Check /example/lib/custom-suggestion-list.dart

## License
[MIT](https://choosealicense.com/licenses/mit/)