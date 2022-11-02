part of 'emoij_delegate.dart';

class EMOIJData {
  final int? id;
  final String? name;
  final String code;
  final String path;

  const EMOIJData({this.id, this.name, required this.code, required this.path});

  factory EMOIJData.fromJson(Map<String, dynamic> json) {
    return EMOIJData(
      code: json['code'],
      path: json['path'],
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'path': path,
      'name': name,
      'code': code,
    };
  }
}

class EMOIJGroupData{
  final List<EMOIJData> data;
  final String groupId;

  const EMOIJGroupData({required this.data,required this.groupId});
}
