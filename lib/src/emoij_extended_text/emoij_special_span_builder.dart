part of 'emoij_extended_textfield.dart';

class EMOIJSpecialTextSpanBuilder extends SpecialTextSpanBuilder {
  EMOIJSpecialTextSpanBuilder();

  @override
  TextSpan build(String data,
      {TextStyle? textStyle, SpecialTextGestureTapCallback? onTap}) {
    if (data == '') {
      return const TextSpan(text: '');
    }

    final List<InlineSpan> inlineList = <InlineSpan>[];

    if (data.isNotEmpty) {
      SpecialText? specialText;
      String textStack = '';
      for (int i = 0; i < data.length; i++) {
        ///get text with index
        textStack += data[i];

        specialText = createSpecialText(
          textStack,
          textStyle: textStyle,
          onTap: onTap,
          index: i,
        );

        if (specialText != null) {
          if (textStack.length - specialText.startFlag.length >= 0) {
            textStack = textStack.substring(
                0, textStack.length - specialText.startFlag.length);
            specialText.appendContent(textStack);
            if (specialText.isEnd(textStack)) {
              inlineList.add(specialText.finishText());
              specialText = null;
            } else {
              inlineList.add(
                TextSpan(text: textStack, style: textStyle),
              );
            }
          }
          textStack = '';
        } else {
          if (EMOIJDelegate.instance.store.constantsTextKey(textStack)) {
            String? key =
                EMOIJDelegate.instance.store.getKeyWithText(textStack);

            if (key != null) {
              int index = textStack.indexOf(key);

              String beforeTarget = textStack.substring(0, index);

              inlineList.add(
                TextSpan(text: beforeTarget, style: textStyle),
              );

              specialText = createSpecialText(
                key,
                textStyle: textStyle,
                onTap: onTap,
                index: i,
              );

              if (specialText != null) {
                if (key.length - specialText.startFlag.length >= 0) {
                  key = key.substring(
                      0, key.length - specialText.startFlag.length);

                  if (key.isNotEmpty) {
                    specialText.appendContent(key);
                    if (specialText.isEnd(key)) {
                      inlineList.add(specialText.finishText());
                      specialText = null;
                    } else {
                      inlineList.add(
                        TextSpan(text: key, style: textStyle),
                      );
                    }
                  }
                }
              } else {
                inlineList.add(
                  TextSpan(text: key, style: textStyle),
                );
              }

              String afterTarget =
                  textStack.substring(index + key.length, textStack.length);

              inlineList.add(
                TextSpan(text: afterTarget, style: textStyle),
              );
            }
            textStack = '';
          }
        }
      }

      if (textStack.isNotEmpty) {
        inlineList.add(TextSpan(text: textStack, style: textStyle));
      }
    } else {
      inlineList.add(TextSpan(text: data, style: textStyle));
    }

    return TextSpan(children: inlineList, style: textStyle);
  }

  @override
  SpecialText? createSpecialText(String flag,
      {TextStyle? textStyle,
      SpecialTextGestureTapCallback? onTap,
      required int index}) {
    if (flag.isEmpty) return null;

    String startPattern = EMOIJDelegate.instance.startPattern;

    int start = startPattern.isNotEmpty
        ? index - (startPattern.length - 1)
        : index + 1 - flag.length;

    if (EMOIJDelegate.instance.store.containsKey(flag)) {
      return EMOIJSpecial(
        textStyle: textStyle,
        start: start,
      );
    }
    return null;
  }

  @override
  bool isStart(String value, String startFlag) {
    if (startFlag.isEmpty) return true;
    return value.endsWith(startFlag);
  }
}
