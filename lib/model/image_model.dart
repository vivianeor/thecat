import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()

class ImageModel{
  String height;
  String id;
  String url;
  String width;

  ImageModel(this.height, this.id, this.url, this.width);

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}