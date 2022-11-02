import 'package:mcvgo_extended_emoij/src/delegate/emoij_delegate.dart';
import 'package:mcvgo_extended_emoij/src/utils/emoij_extensions.dart';

typedef MatchPattern = void Function(String);

class MapPattern {
  static void splitMapPattern(Map<String, dynamic> map, String text,
      {required MatchPattern onMatch, required MatchPattern onNonMatch}) {
    if (text.isEmpty) return;
    List<String> split = text.split(' ');
    for (final key in map.keys.toList()) {
      /// check list match with code
      if (split.contains(key)) {
        int indexOf = split.indexOf(key);

        String nonMatch = split.getRange(0, indexOf).join(' ');

        onNonMatch.call(nonMatch);

        onMatch.call(key);

        text = split.getRange(indexOf + 1, split.length).join(' ');

        return splitMapPattern(map, text,
            onMatch: onMatch, onNonMatch: onNonMatch);
      } else {
        List<String> split = text.split(' ');

        if (key == map.keys.last && !split.contains(key)) {
          onNonMatch.call(split.join(' '));
          return;
        } else {
          continue;
        }
      }
    }
  }

  static String overrideSystemEMOIJ(
    String text,
    List<EMOIJData> data,
  ) {
    for (final emoi in data) {
      if(emoi.code.isNotNullOrEmpty){
        if (text.contains(emoi.name!)) {
          text = text.replaceFirst(emoi.name!, emoi.code);
        }
      }
    }
    return text;
  }
}
