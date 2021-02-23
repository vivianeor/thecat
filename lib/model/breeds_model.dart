import 'package:json_annotation/json_annotation.dart';
import 'package:thecat_app/model/image_model.dart';


part 'breeds_model.g.dart';

@JsonSerializable()
class BreedsModel {
  String name;
  String temperament;
  String origin;
  String description;
  String adaptability;
  String affectionLevel;
  String energyLevel;
  String intelligence;
  String rare;
  String wikipediaUrl;
  String referenceImageId;
  ImageModel image;

  BreedsModel({
        this.name,
        this.temperament,
        this.origin,
        this.description,
        this.energyLevel,
        this.intelligence,
        this.rare,
        this.wikipediaUrl,
        this.referenceImageId,
        this.image});

  factory BreedsModel.fromJson(Map<String, dynamic> json) => _$BreedsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BreedsModelToJson(this);

}