library mcvgo_extended_emoij;

import 'src/delegate/emoij_delegate.dart';
import 'src/shared.dart';

export 'src/emoij_extended_text/emoij_extended_textfield.dart';
export 'package:mcvgo_extended_text_field/extended_text_field.dart'
    show ExtendedTextFieldState;
export 'src/emoij_extended_text/emoij_extended_text.dart';
export 'src/delegate/emoij_delegate.dart';
export 'src/shared.dart';
export 'src/utils/map_pattern.dart';

abstract class EMOIJProvider<T> {
  const EMOIJProvider();

  static EMOIJProvider get provider => const MCVGoEMOIJProvider._init();

  void initProvider({
    required T data,
    required double emoijHeight,
    required double emoijWidth,
    required EMOIJErrorBuilder errorBuilder,
    required EMOIJLoadingBuilder loadingBuilder,
    required String startPattern,
    required String endPattern,
    required String package,
    EMOIJLoaderType type = EMOIJLoaderType.assets,
  }) {
    EMOIJDelegate.instance.delegateEMOIJ(
      merge(data),
      type: type,
      startPattern: startPattern,
      endPattern: endPattern,
      emoijHeight: emoijHeight,
      emoijWidth: emoijWidth,
      errorBuilder: errorBuilder,
      loadingBuilder: loadingBuilder,
      package: package,
    );
  }

  Map<String, EMOIJData> merge(T data);
}

class MCVGoEMOIJProvider extends EMOIJProvider<List<EMOIJGroupData>> {
  const MCVGoEMOIJProvider._init() : super();

  @override
  void initProvider(
      {required List<EMOIJGroupData> data,
      required double emoijHeight,
      required double emoijWidth,
      required EMOIJErrorBuilder errorBuilder,
      required EMOIJLoadingBuilder loadingBuilder,
      required String startPattern,
      required String endPattern,
      required String package,
      EMOIJLoaderType type = EMOIJLoaderType.memory}) {
    return super.initProvider(
      data: data,
      type: type,
      package: package,
      startPattern: startPattern,
      endPattern: endPattern,
      emoijHeight: emoijHeight,
      emoijWidth: emoijWidth,
      errorBuilder: errorBuilder,
      loadingBuilder: loadingBuilder,
    );
  }

  @override
  Map<String, EMOIJData> merge(List<EMOIJGroupData> data) {
    List<EMOIJData> emoijList = [];
    for (final gr in data) {
      emoijList.addAll(gr.data);
    }

    Map<String, EMOIJData> mergeEMOIJ = {};

    for (final em in emoijList) {
      mergeEMOIJ[em.code] = em;
    }

    return mergeEMOIJ;
  }
}
