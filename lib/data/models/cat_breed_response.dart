import 'package:catbreeds/domain/entities/cat_breed_entity.dart';

class CatBreedResponse extends CatBreedModel {
  CatBreedResponse({
    required super.weight,
    required super.id,
    required super.name,
    required super.cfaUrl,
    required super.vetstreetUrl,
    required super.vcahospitalsUrl,
    required super.temperament,
    required super.origin,
    required super.countryCodes,
    required super.countryCode,
    required super.description,
    required super.lifeSpan,
    required super.indoor,
    required super.lap,
    required super.altNames,
    required super.adaptability,
    required super.affectionLevel,
    required super.childFriendly,
    required super.dogFriendly,
    required super.energyLevel,
    required super.grooming,
    required super.healthIssues,
    required super.intelligence,
    required super.sheddingLevel,
    required super.socialNeeds,
    required super.strangerFriendly,
    required super.vocalisation,
    required super.experimental,
    required super.hairless,
    required super.natural,
    required super.rare,
    required super.rex,
    required super.suppressedTail,
    required super.shortLegs,
    required super.wikipediaUrl,
    required super.hypoallergenic,
    required super.referenceImageId,
    required super.image,
  });

  CatBreedResponse.fromJson(Map<String, dynamic> json) {
    weight =
        json['weight'] != null ? new Weight.fromJson(json['weight']) : null;
    id = json['id'];
    name = json['name'];
    cfaUrl = json['cfa_url'];
    vetstreetUrl = json['vetstreet_url'];
    vcahospitalsUrl = json['vcahospitals_url'];
    temperament = json['temperament'];
    origin = json['origin'];
    countryCodes = json['country_codes'];
    countryCode = json['country_code'];
    description = json['description'];
    lifeSpan = json['life_span'];
    indoor = json['indoor'];
    lap = json['lap'];
    altNames = json['alt_names'];
    adaptability = json['adaptability'];
    affectionLevel = json['affection_level'];
    childFriendly = json['child_friendly'];
    dogFriendly = json['dog_friendly'];
    energyLevel = json['energy_level'];
    grooming = json['grooming'];
    healthIssues = json['health_issues'];
    intelligence = json['intelligence'];
    sheddingLevel = json['shedding_level'];
    socialNeeds = json['social_needs'];
    strangerFriendly = json['stranger_friendly'];
    vocalisation = json['vocalisation'];
    experimental = json['experimental'];
    hairless = json['hairless'];
    natural = json['natural'];
    rare = json['rare'];
    rex = json['rex'];
    suppressedTail = json['suppressed_tail'];
    shortLegs = json['short_legs'];
    wikipediaUrl = json['wikipedia_url'];
    hypoallergenic = json['hypoallergenic'];
    referenceImageId = json['reference_image_id'];
    image =
        json['image'] != null
            ? new ImageModel.fromJson(json['image'])
            : new ImageModel(
              url:
                  'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png',
            );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weight != null) {
      data['weight'] = this.weight!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['cfa_url'] = this.cfaUrl;
    data['vetstreet_url'] = this.vetstreetUrl;
    data['vcahospitals_url'] = this.vcahospitalsUrl;
    data['temperament'] = this.temperament;
    data['origin'] = this.origin;
    data['country_codes'] = this.countryCodes;
    data['country_code'] = this.countryCode;
    data['description'] = this.description;
    data['life_span'] = this.lifeSpan;
    data['indoor'] = this.indoor;
    data['lap'] = this.lap;
    data['alt_names'] = this.altNames;
    data['adaptability'] = this.adaptability;
    data['affection_level'] = this.affectionLevel;
    data['child_friendly'] = this.childFriendly;
    data['dog_friendly'] = this.dogFriendly;
    data['energy_level'] = this.energyLevel;
    data['grooming'] = this.grooming;
    data['health_issues'] = this.healthIssues;
    data['intelligence'] = this.intelligence;
    data['shedding_level'] = this.sheddingLevel;
    data['social_needs'] = this.socialNeeds;
    data['stranger_friendly'] = this.strangerFriendly;
    data['vocalisation'] = this.vocalisation;
    data['experimental'] = this.experimental;
    data['hairless'] = this.hairless;
    data['natural'] = this.natural;
    data['rare'] = this.rare;
    data['rex'] = this.rex;
    data['suppressed_tail'] = this.suppressedTail;
    data['short_legs'] = this.shortLegs;
    data['wikipedia_url'] = this.wikipediaUrl;
    data['hypoallergenic'] = this.hypoallergenic;
    data['reference_image_id'] = this.referenceImageId;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}
