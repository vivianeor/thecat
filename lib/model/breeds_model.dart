import 'package:json_annotation/json_annotation.dart';

part 'breeds_model.g.dart';

@JsonSerializable()
class Breed {
  Weight weight;
  String id;
  String name;
  String cfaUrl;
  String vetstreetUrl;
  String vcahospitalsUrl;
  String temperament;
  String origin;
  String countryCodes;
  String countryCode;
  String description;
  String lifeSpan;
  int indoor;
  int lap;
  String altNames;
  int adaptability;
  int affectionLevel;
  int childFriendly;
  int dogFriendly;
  int energyLevel;
  int grooming;
  int healthIssues;
  int intelligence;
  int sheddingLevel;
  int socialNeeds;
  int strangerFriendly;
  int vocalisation;
  int experimental;
  int hairless;
  int natural;
  int rare;
  int rex;
  int suppressedTail;
  int shortLegs;
  String wikipediaUrl;
  int hypoallergenic;
  String referenceImageId;
  Image image;


  Breed({
    this.weight,
    this.id,
    this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    this.temperament,
    this.origin,
    this.countryCodes,
    this.countryCode,
    this.description,
    this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    this.wikipediaUrl,
    this.hypoallergenic,
    this.referenceImageId,
    this.image});

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);

  Map<String, dynamic> toJson() => _$BreedToJson(this);

}

class BreedsList {
  final List<Breed> values;

  BreedsList({this.values});

  factory BreedsList.fromJson(List<dynamic> parsedJson){
    List<Breed> list = new List<Breed>();
    list = parsedJson.map((i) => Breed.fromJson(i)).toList();

    return new BreedsList(
        values: list
    );
  }
}

@JsonSerializable()
class Weight {
  String imperial;
  String metric;

  Weight({this.imperial, this.metric});

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);

  Map<String, dynamic> toJson() => _$WeightToJson(this);
}

@JsonSerializable()
class Image {
  String id;
  int width;
  int height;
  String url;

  Image({this.id, this.width, this.height, this.url});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

