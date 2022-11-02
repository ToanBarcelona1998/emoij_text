import 'package:flutter/material.dart';

typedef EMOIJErrorBuilder = Widget Function(
    BuildContext context, Object error, StackTrace? stackTrace);

typedef EMOIJLoadingBuilder = Widget Function(
  BuildContext context,
  Widget child,
  ImageChunkEvent? loadingProgress,
);

enum EMOIJLoaderType {
  memory,
  assets,
  file,
  netWork,
}
