import 'package:extended_text/extended_text.dart';
import 'package:flutter/material.dart';

import 'emoij_extended_textfield.dart';

class EMOIJExtendedText extends ExtendedText {
  final String text;

  EMOIJExtendedText({
    required this.text,
    Key? key,
    TextStyle? style,
    TextAlign textAlign = TextAlign.start,
    TextDirection? textDirection,
    bool softWrap = true,
    TextOverflow overflow = TextOverflow.clip,
    double textScaleFactor = 1.0,
    int? maxLines,
    Locale? locale,
    VoidCallback? onTap,
    StrutStyle? strutStyle,
  }) : super(
          text,
          style: style,
          textAlign: textAlign,
          textDirection: textDirection,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          locale: locale,
          key: key,
          strutStyle: strutStyle,
          onTap: onTap,
          specialTextSpanBuilder: EMOIJSpecialTextSpanBuilder(),
        );
}
