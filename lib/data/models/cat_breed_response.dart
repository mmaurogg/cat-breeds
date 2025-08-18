import 'package:catbreeds/domain/entities/cat_breed_entity.dart';

class CatBreedResponse extends CatBreedModel {
  CatBreedResponse({
    required WeightResponse? weight,
    required String? id,
    required String? name,
    required String? cfaUrl,
    required String? vetstreetUrl,
    required String? vcahospitalsUrl,
    required String? temperament,
    required String? origin,
    required String? countryCodes,
    required String? countryCode,
    required String? description,
    required String? lifeSpan,
    required int? indoor,
    required int? lap,
    required String? altNames,
    required int? adaptability,
    required int? affectionLevel,
    required int? childFriendly,
    required int? dogFriendly,
    required int? energyLevel,
    required int? grooming,
    required int? healthIssues,
    required int? intelligence,
    required int? sheddingLevel,
    required int? socialNeeds,
    required int? strangerFriendly,
    required int? vocalisation,
    required int? experimental,
    required int? hairless,
    required int? natural,
    required int? rare,
    required int? rex,
    required int? suppressedTail,
    required int? shortLegs,
    required String? wikipediaUrl,
    required int? hypoallergenic,
    required String? referenceImageId,
    required ImageResponse? image,
  }) : super(
         weight: weight,
         id: id,
         name: name,
         cfaUrl: cfaUrl,
         vetstreetUrl: vetstreetUrl,
         vcahospitalsUrl: vcahospitalsUrl,
         temperament: temperament,
         origin: origin,
         countryCodes: countryCodes,
         countryCode: countryCode,
         description: description,
         lifeSpan: lifeSpan,
         indoor: indoor,
         lap: lap,
         altNames: altNames,
         adaptability: adaptability,
         affectionLevel: affectionLevel,
         childFriendly: childFriendly,
         dogFriendly: dogFriendly,
         energyLevel: energyLevel,
         grooming: grooming,
         healthIssues: healthIssues,
         intelligence: intelligence,
         sheddingLevel: sheddingLevel,
         socialNeeds: socialNeeds,
         strangerFriendly: strangerFriendly,
         vocalisation: vocalisation,
         experimental: experimental,
         hairless: hairless,
         natural: natural,
         rare: rare,
         rex: rex,
         suppressedTail: suppressedTail,
         shortLegs: shortLegs,
         wikipediaUrl: wikipediaUrl,
         hypoallergenic: hypoallergenic,
         referenceImageId: referenceImageId,
         image: image,
       );

  factory CatBreedResponse.fromJson(Map<String, dynamic> json) {
    return CatBreedResponse(
      weight:
          json['weight'] != null
              ? WeightResponse.fromJson(json['weight'])
              : null,
      id: json['id'],
      name: json['name'],
      cfaUrl: json['cfa_url'],
      vetstreetUrl: json['vetstreet_url'],
      vcahospitalsUrl: json['vcahospitals_url'],
      temperament: json['temperament'],
      origin: json['origin'],
      countryCodes: json['country_codes'],
      countryCode: json['country_code'],
      description: json['description'],
      lifeSpan: json['life_span'],
      indoor: json['indoor'],
      lap: json['lap'],
      altNames: json['alt_names'],
      adaptability: json['adaptability'],
      affectionLevel: json['affection_level'],
      childFriendly: json['child_friendly'],
      dogFriendly: json['dog_friendly'],
      energyLevel: json['energy_level'],
      grooming: json['grooming'],
      healthIssues: json['health_issues'],
      intelligence: json['intelligence'],
      sheddingLevel: json['shedding_level'],
      socialNeeds: json['social_needs'],
      strangerFriendly: json['stranger_friendly'],
      vocalisation: json['vocalisation'],
      experimental: json['experimental'],
      hairless: json['hairless'],
      natural: json['natural'],
      rare: json['rare'],
      rex: json['rex'],
      suppressedTail: json['suppressed_tail'],
      shortLegs: json['short_legs'],
      wikipediaUrl: json['wikipedia_url'],
      hypoallergenic: json['hypoallergenic'],
      referenceImageId: json['reference_image_id'],
      image:
          json['image'] != null ? ImageResponse.fromJson(json['image']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (weight != null) {
      data['weight'] = (weight as WeightResponse).toJson();
    }
    data['id'] = id;
    data['name'] = name;
    data['cfa_url'] = cfaUrl;
    data['vetstreet_url'] = vetstreetUrl;
    data['vcahospitals_url'] = vcahospitalsUrl;
    data['temperament'] = temperament;
    data['origin'] = origin;
    data['country_codes'] = countryCodes;
    data['country_code'] = countryCode;
    data['description'] = description;
    data['life_span'] = lifeSpan;
    data['indoor'] = indoor;
    data['lap'] = lap;
    data['alt_names'] = altNames;
    data['adaptability'] = adaptability;
    data['affection_level'] = affectionLevel;
    data['child_friendly'] = childFriendly;
    data['dog_friendly'] = dogFriendly;
    data['energy_level'] = energyLevel;
    data['grooming'] = grooming;
    data['health_issues'] = healthIssues;
    data['intelligence'] = intelligence;
    data['shedding_level'] = sheddingLevel;
    data['social_needs'] = socialNeeds;
    data['stranger_friendly'] = strangerFriendly;
    data['vocalisation'] = vocalisation;
    data['experimental'] = experimental;
    data['hairless'] = hairless;
    data['natural'] = natural;
    data['rare'] = rare;
    data['rex'] = rex;
    data['suppressed_tail'] = suppressedTail;
    data['short_legs'] = shortLegs;
    data['wikipedia_url'] = wikipediaUrl;
    data['hypoallergenic'] = hypoallergenic;
    data['reference_image_id'] = referenceImageId;
    if (image != null) {
      data['image'] = (image as ImageResponse).toJson();
    }
    return data;
  }
}

class WeightResponse extends Weight {
  WeightResponse({super.imperial, super.metric});

  WeightResponse.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imperial'] = this.imperial;
    data['metric'] = this.metric;
    return data;
  }
}

class ImageResponse extends ImageModel {
  ImageResponse({super.id, super.width, super.height, super.url});

  ImageResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    return data;
  }
}
