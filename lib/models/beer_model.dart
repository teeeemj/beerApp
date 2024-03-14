class BeerModel {
  String? name;
  String? tagline;
  String? firstBrewed;
  String? description;
  String? imageUrl;

  // Volume? volume;
  // Volume? boilVolume;
  // Method? method;
  // Ingredients? ingredients;
  List<String>? foodPairing;
  String? brewersTips;
  String? contributedBy;

  BeerModel({
    this.name,
    this.tagline,
    this.firstBrewed,
    this.description,
    this.imageUrl,
    // this.volume,
    // this.boilVolume,
    // this.method,
    // this.ingredients,
    this.foodPairing,
    this.brewersTips,
    this.contributedBy,
  });

  BeerModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    tagline = json['tagline'];
    firstBrewed = json['first_brewed'];
    description = json['description'];
    imageUrl = json['image_url'];

    // volume = json['volume'] != null ? Volume.fromJson(json['volume']) : null;
    // boilVolume = json['boil_volume'] != null
    //     ? Volume.fromJson(json['boil_volume'])
    //     : null;
    // method = json['method'] != null ? Method.fromJson(json['method']) : null;
    // ingredients = json['ingredients'] != null
    //     ? Ingredients.fromJson(json['ingredients'])
    //     : null;
    foodPairing = List<String>.from(json['food_pairing'] ?? []);
    brewersTips = json['brewers_tips'];
    contributedBy = json['contributed_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['tagline'] = tagline;
    data['first_brewed'] = firstBrewed;
    data['description'] = description;
    data['image_url'] = imageUrl;

    // if (volume != null) {
    //   data['volume'] = volume!.toJson();
    // }
    // if (boilVolume != null) {
    //   data['boil_volume'] = boilVolume!.toJson();
    // }
    // if (method != null) {
    //   data['method'] = method!.toJson();
    // }
    // if (ingredients != null) {
    //   data['ingredients'] = ingredients!.toJson();
    // }
    data['food_pairing'] = foodPairing;
    data['brewers_tips'] = brewersTips;
    data['contributed_by'] = contributedBy;
    return data;
  }
}

// class Volume {
//   int? value;
//   String? unit;

//   Volume({this.value, this.unit});

//   Volume.fromJson(Map<String, dynamic> json) {
//     value = json['value'];
//     unit = json['unit'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['value'] = value;
//     data['unit'] = unit;
//     return data;
//   }
// }

// class Method {
//   List<MashTemp>? mashTemp;
//   Fermentation? fermentation;
//   Null? twist;

//   Method({this.mashTemp, this.fermentation, this.twist});

//   Method.fromJson(Map<String, dynamic> json) {
//     if (json['mash_temp'] != null) {
//       mashTemp = <MashTemp>[];
//       json['mash_temp'].forEach((v) {
//         mashTemp!.add(MashTemp.fromJson(v));
//       });
//     }
//     fermentation = json['fermentation'] != null
//         ? Fermentation.fromJson(json['fermentation'])
//         : null;
//     twist = json['twist'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (mashTemp != null) {
//       data['mash_temp'] = mashTemp!.map((v) => v.toJson()).toList();
//     }
//     if (fermentation != null) {
//       data['fermentation'] = fermentation!.toJson();
//     }
//     data['twist'] = twist;
//     return data;
//   }
// }

// class MashTemp {
//   Volume? temp;
//   int? duration;

//   MashTemp({this.temp, this.duration});

//   MashTemp.fromJson(Map<String, dynamic> json) {
//     temp = json['temp'] != null ? Volume.fromJson(json['temp']) : null;
//     duration = json['duration'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (temp != null) {
//       data['temp'] = temp!.toJson();
//     }
//     data['duration'] = duration;
//     return data;
//   }
// }

// class Fermentation {
//   Volume? temp;

//   Fermentation({this.temp});

//   Fermentation.fromJson(Map<String, dynamic> json) {
//     temp = json['temp'] != null ? Volume.fromJson(json['temp']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (temp != null) {
//       data['temp'] = temp!.toJson();
//     }
//     return data;
//   }
// }

// class Ingredients {
//   List<Malt>? malt;
//   List<Hops>? hops;
//   String? yeast;

//   Ingredients({this.malt, this.hops, this.yeast});

//   Ingredients.fromJson(Map<String, dynamic> json) {
//     if (json['malt'] != null) {
//       malt = <Malt>[];
//       json['malt'].forEach((v) {
//         malt!.add(Malt.fromJson(v));
//       });
//     }
//     if (json['hops'] != null) {
//       hops = <Hops>[];
//       json['hops'].forEach((v) {
//         hops!.add(Hops.fromJson(v));
//       });
//     }
//     yeast = json['yeast'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (malt != null) {
//       data['malt'] = malt!.map((v) => v.toJson()).toList();
//     }
//     if (hops != null) {
//       data['hops'] = hops!.map((v) => v.toJson()).toList();
//     }
//     data['yeast'] = yeast;
//     return data;
//   }
// }

// class Malt {
//   String? name;
//   Amount? amount;

//   Malt({this.name, this.amount});

//   Malt.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     amount = json['amount'] != null ? Amount.fromJson(json['amount']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = name;
//     if (amount != null) {
//       data['amount'] = amount!.toJson();
//     }
//     return data;
//   }
// }

// class Amount {
//   double? value;
//   String? unit;

//   Amount({this.value, this.unit});

//   Amount.fromJson(Map<String, dynamic> json) {
//     value = json['value'];
//     unit = json['unit'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['value'] = value;
//     data['unit'] = unit;
//     return data;
//   }
// }

// class Hops {
//   String? name;
//   Amount? amount;
//   String? add;
//   String? attribute;

//   Hops({this.name, this.amount, this.add, this.attribute});

//   Hops.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     amount = json['amount'] != null ? Amount.fromJson(json['amount']) : null;
//     add = json['add'];
//     attribute = json['attribute'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = name;
//     if (amount != null) {
//       data['amount'] = amount!.toJson();
//     }
//     data['add'] = add;
//     data['attribute'] = attribute;
//     return data;
//   }
// }
