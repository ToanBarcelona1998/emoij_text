import 'package:mcvgo_extended_emoij/src/shared.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'logger.dart';

class ConvertEMOIJ {
  static ImageProvider emoijBuilder(
      EMOIJLoaderType type, String path, String errorImage,
      [String? package]) {
    Logger.logMessage(
      'build emoij success ${type}',
    );
    Logger.logMessage(
      'build emoij success ${path}',
    );
    switch (type) {
      case EMOIJLoaderType.memory:
        MemoryImage? image = _getMemoryImageFromPath(path);

        if (image == null) {
          return AssetImage(errorImage);
        }

        Logger.logMessage(
          'build emoij success ${image.bytes}',
        );
        return image;
      case EMOIJLoaderType.file:
        Logger.logError(
          'Not support emoij type ${type.name}',
          null,
          LogType.high,
        );
        throw UnimplementedError(
          'Not support emoij type ${type.name}',
        );
      case EMOIJLoaderType.netWork:
        Logger.logError(
          'Not support emoij type ${type.name}',
          null,
          LogType.high,
        );
        throw UnimplementedError(
          'Not support emoij type ${type.name}',
        );
      case EMOIJLoaderType.assets:
        Logger.logMessage(
          'build emoij success $path',
        );
        return AssetImage(
          path,
          package: package,
        );
    }
  }

  static MemoryImage? _getMemoryImageFromPath(String path) {
    final UriData? data = Uri.parse(path).data;

    if (data == null) return null;

    Uint8List image = data.contentAsBytes();

    return MemoryImage(image);
  }
}
