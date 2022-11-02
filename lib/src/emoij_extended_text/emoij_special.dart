part of 'emoij_extended_textfield.dart';

class EMOIJSpecial extends SpecialText {
  final int start;
  final StringBuffer _content;

  EMOIJSpecial({
    TextStyle? textStyle,
    required this.start,
  }) : _content = StringBuffer(), super(
    EMOIJDelegate.instance.startPattern,
    EMOIJDelegate.instance.endPattern,
    textStyle,
  );

  @override
  void appendContent(String value) {
    _content.write(value);
  }

  @override
  String getContent() {
    String content = _content.toString();
    if(endFlag.isEmpty || startFlag.isEmpty) return content;

    if (content.endsWith(endFlag)) {
      content = content.substring(
        0,
        content.length - endFlag.length,
      );
    }
    return content;
  }

  @override
  bool isEnd(String value) {
    return EMOIJDelegate.instance.store.containsKey(value);
  }

  @override
  InlineSpan finishText() {
    final String key = toString();
    if (EMOIJDelegate.instance.store.containsKey(key)) {
      Logger.logMessage('mapper pattern key $key');
      return ImageSpan(
        ConvertEMOIJ.emoijBuilder(
            EMOIJDelegate.instance.type,
            EMOIJDelegate.instance.store[key]?.path ?? '',
            '',
            EMOIJDelegate.instance.package
        ),
        imageHeight: EMOIJDelegate.instance.emoijHeight,
        imageWidth: EMOIJDelegate.instance.emoijWidth,
        loadingBuilder: EMOIJDelegate.instance.loadingBuilder,
        fit: BoxFit.cover,
        start: start,
        actualText: key,
        margin: const EdgeInsets.all(2),
      );
    }

    return TextSpan(text: toString(), style: textStyle);
  }

  @override
  String toString() {
    return getContent();
  }
}
