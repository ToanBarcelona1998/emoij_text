import 'package:mcvgo_extended_emoij/src/shared.dart';

part 'emoij_data.dart';

class EMOIJDelegate {
  static EMOIJDelegate instance = EMOIJDelegate._instance();

  EMOIJDelegate._instance();

  ///init store with key is your code define
  final Map<String, EMOIJData> store = <String, EMOIJData>{};
  late double _emoijHeight;
  late double _emoijWidth;
  late EMOIJErrorBuilder _errorBuilder;
  late EMOIJLoadingBuilder _loadingBuilder;
  late String _startPattern;
  late String _endPattern;
  late String _package;
  EMOIJLoaderType _type = EMOIJLoaderType.assets;

  ///

  double get emoijHeight => _emoijHeight;

  double get emoijWidth => _emoijWidth;

  EMOIJErrorBuilder get errorBuilder => _errorBuilder;

  EMOIJLoadingBuilder get loadingBuilder => _loadingBuilder;

  String get startPattern => _startPattern;

  String get endPattern => _endPattern;

  EMOIJLoaderType get type => _type;

  String get package => _package;

  void delegateEMOIJ(
    Map<String, EMOIJData> initStore, {
    required double emoijHeight,
    required double emoijWidth,
    required EMOIJErrorBuilder errorBuilder,
    required EMOIJLoadingBuilder loadingBuilder,
    required String startPattern,
    required String endPattern,
    required String package,
    EMOIJLoaderType type = EMOIJLoaderType.assets,
  }) {
    store.addAll(initStore);
    _emoijHeight = emoijHeight;
    _emoijWidth = emoijWidth;
    _errorBuilder = errorBuilder;
    _loadingBuilder = loadingBuilder;
    _type = type;
    _startPattern = startPattern;
    _endPattern = endPattern;
    _package = package;
  }
}
