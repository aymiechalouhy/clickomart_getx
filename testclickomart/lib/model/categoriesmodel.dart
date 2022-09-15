class Categories {
  String? status;
  List<Response>? response;

  Categories({this.status, this.response});

  Categories.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? sId;
  String? name;
  bool? isForAccessories;
  String? slug;
  List<void>? liveTranslations;
  String? icon;
  String? logo;
  int? itemsCount;
  String? lang;
  List<Subcategories>? subcategories;

  Response(
      {this.sId,
      this.name,
      this.isForAccessories,
      this.slug,
      this.liveTranslations,
      this.icon,
      this.logo,
      this.itemsCount,
      this.lang,
      this.subcategories});

  Response.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    isForAccessories = json['isForAccessories'];
    slug = json['slug'];
    // if (json['liveTranslations'] != null) {
    //   liveTranslations = <Null>[];
    //   json['liveTranslations'].forEach((v) {
    //     liveTranslations!.add(Null.fromJson(v));
    //   });
    // }
    icon = json['icon'];
    logo = json['logo'];
    itemsCount = json['itemsCount'];
    lang = json['lang'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(Subcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['isForAccessories'] = isForAccessories;
    data['slug'] = slug;
    // if (liveTranslations != null) {
    //   data['liveTranslations'] =
    //       liveTranslations!.map((v) => v.toJson()).toList();
    // }
    data['icon'] = icon;
    data['logo'] = logo;
    data['itemsCount'] = itemsCount;
    data['lang'] = lang;
    if (subcategories != null) {
      data['subcategories'] =
          subcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategories {
  String? sId;
  String? name;
  bool? isForAccessories;
  String? slug;
  List<void>? liveTranslations;
  int? itemsCount;
  String? lang;

  Subcategories(
      {this.sId,
      this.name,
      this.isForAccessories,
      this.slug,
      this.liveTranslations,
      this.itemsCount,
      this.lang});

  Subcategories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    isForAccessories = json['isForAccessories'];
    slug = json['slug'];
    // if (json['liveTranslations'] != null) {
    //   liveTranslations = <Null>[];
    //   json['liveTranslations'].forEach((v) {
    //     liveTranslations!.add(Null.fromJson(v));
    //   });
    // }
    itemsCount = json['itemsCount'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['isForAccessories'] = isForAccessories;
    data['slug'] = slug;
    // if (liveTranslations != null) {
    //   data['liveTranslations'] =
    //       liveTranslations!.map((v) => v.toJson()).toList();
    // }
    data['itemsCount'] = itemsCount;
    data['lang'] = lang;
    return data;
  }
}