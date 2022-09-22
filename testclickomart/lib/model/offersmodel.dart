import 'package:flutter/cupertino.dart';

class Offers {
  String? status;
  List<Response>? response;

  Offers({this.status, this.response});

  Offers.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        try {
          response!.add(Response.fromJson(v));
        } catch (e) {
          // debugPrint(e.toString());
          // debugPrint(v.toString());
        }
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
  String? name;
  String? slug;
  String? outputResult;
  String? sId;
  List<Items>? items;
  String? viewType;

  Response(
      {this.name,
      this.slug,
      this.outputResult,
      this.sId,
      this.items,
      this.viewType});

  Response.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    outputResult = json['outputResult'];
    sId = json['_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        try { items!.add(Items.fromJson(v));} catch (e) {
          // debugPrint(e.toString());
          // debugPrint(v.toString());
        }
       
      });
    }
    viewType = json['viewType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['outputResult'] = outputResult;
    data['_id'] = sId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['viewType'] = viewType;
    return data;
  }
}

class Items {
  String? sId;
  int? quantity;
  String? name;
  int? price;
  String? description;
  String? summary;
  String? details;
  String? image;
  int? discount;
  String? slug;
  List<Categories>? categories;
  int? discountPrice;
  int? availableQuantity;
  String? lang;
  dynamic isFavorite;
  List<String>? categoryIds;
  // String? type;
  // dynamic specialNote;
  // int? variationsCount;
  // int? rank;
  // dynamic variationReference;
  // String? nutritionalFacts;
  // List<String>? gallery;
  // int? order;
  // bool? hideFromWishlist;
  // dynamic hideFromSearch;
  // String? sku;
  // String? discountType;
  // dynamic isInWishlist;
  // Currency? currency;
  // String? currencyId;
  // String? brandId;
  // Brand? brand;
  // dynamic productId;
  // List<dynamic>? tags;
  // dynamic tagIds;
  // List<dynamic>? variantTypes;
  // VariantValues? variantValues;
  // List<dynamic>? variantTypeIds;
  // VariantValues? variations;
  // String? createdAt;
  // dynamic isFeatured;
  // Meta? meta;

  Items(
      {this.sId,
      this.quantity,
      this.name,
      this.price,
      this.description,
      this.summary,
      this.details,
      this.image,
      this.discount,
      this.slug,
      this.isFavorite,
      this.availableQuantity,
      this.categories,
      this.discountPrice,
      this.lang
      // this.variationReference,
      // this.type,
      // this.variationsCount,
      // this.nutritionalFacts,
      // this.order,
      // this.rank,
      // this.gallery,
      // this.specialNote,
      // this.hideFromWishlist,
      // this.hideFromSearch,
      // this.sku,
      // this.discountType,
      // this.isInWishlist,
      // this.categoryIds,
      // this.currency,
      // this.currencyId,
      // this.brandId,
      // this.brand,
      // this.productId,
      // this.tags,
      // this.tagIds,
      // this.variantTypes,
      // this.variantValues,
      // this.variantTypeIds,
      // this.variations,
      // this.createdAt,
      // this.isFeatured,
      // this.meta,
      });

  Items.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    quantity = json['quantity'];
    // variationsCount = json['variationsCount'];
    // type = json['type'];
    // variationReference = json['variationReference'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    summary = json['summary'];
    details = json['details'];
    // nutritionalFacts = json['nutritionalFacts'];
    // specialNote = json['specialNote'];
    image = json['image'];
    // rank = json['rank'];
    // order = json['order'];
    // gallery = json['gallery'].cast<String>();
    discount = json['discount'];
    // hideFromWishlist = json['hideFromWishlist'];
    // hideFromSearch = json['hideFromSearch'];
    slug = json['slug'];
    // sku = json['sku'];
    // discountType = json['discountType'];
    isFavorite = json['isFavorite'];
    // isInWishlist = json['isInWishlist'];
    categoryIds = json['categoryIds'].cast<String>();
    // currency =
    //     json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    // currencyId = json['currencyId'];
    // brandId = json['brandId'];
    // brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    // productId = json['productId'];
    // brand = json['Brand'];
    // if (json['tags'] != null) {
    // 	tags = <Null>[];
    // 	json['tags'].forEach((v) { tags!.add(Null.fromJson(v)); });
    // }
    // tagIds = json['tagIds'];
    // if (json['variantTypes'] != null) {
    // 	variantTypes = <Null>[];
    // 	json['variantTypes'].forEach((v) { variantTypes!.add(Null.fromJson(v)); });
    // }
    // variantValues = json['variantValues'] != null
        // ? VariantValues.fromJson(json['variantValues'])
        // : null;
    // if (json['variantTypeIds'] != null) {
    // 	variantTypeIds = <Null>[];
    // 	json['variantTypeIds'].forEach((v) { variantTypeIds!.add(Null.fromJson(v)); });
    // }
    // variations = json['variations'] != null
    //     ? VariantValues.fromJson(json['variations'])
    //     : null;
    // createdAt = json['createdAt'];
    // isFeatured = json['isFeatured'];
    // meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    availableQuantity = json['availableQuantity'];
    discountPrice = json['discountPrice'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['quantity'] = quantity;
    // data['variationsCount'] = variationsCount;
    // data['type'] = type;
    // data['variationReference'] = variationReference;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['summary'] = summary;
    data['details'] = details;
    // data['nutritionalFacts'] = nutritionalFacts;
    // data['specialNote'] = specialNote;
    // data['image'] = image;
    // data['rank'] = rank;
    // data['order'] = order;
    // data['gallery'] = gallery;
    // data['discount'] = discount;
    // data['hideFromWishlist'] = hideFromWishlist;
    // data['hideFromSearch'] = hideFromSearch;
    data['slug'] = slug;
    // data['sku'] = sku;
    // data['discountType'] = discountType;
    data['isFavorite'] = isFavorite;
    // data['isInWishlist'] = isInWishlist;
    data['categoryIds'] = categoryIds;
    // if (currency != null) {
    //   data['currency'] = currency!.toJson();
    // }
    // data['currencyId'] = currencyId;
    // data['brandId'] = brandId;
    // if (brand != null) {
    //   data['brand'] = brand!.toJson();
    // }
    // data['productId'] = productId;
    // data['Brand'] = brand;
    // if (tags != null) {
    //   data['tags'] = tags!.map((v) => v.toJson()).toList();
    // }
    // data['tagIds'] = tagIds;
    // if (variantTypes != null) {
    //   data['variantTypes'] = variantTypes!.map((v) => v.toJson()).toList();
    // }
    // if (variantValues != null) {
    //   data['variantValues'] = variantValues!.toJson();
    // }
    // if (variantTypeIds != null) {
    //   data['variantTypeIds'] = variantTypeIds!.map((v) => v.toJson()).toList();
    // }
    // if (variations != null) {
    //   data['variations'] = variations!.toJson();
    // }
    // data['createdAt'] = createdAt;
    // data['isFeatured'] = isFeatured;
    // if (meta != null) {
    //   data['meta'] = meta!.toJson();
    // }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['availableQuantity'] = availableQuantity;
    data['discountPrice'] = discountPrice;
    data['lang'] = lang;
    return data;
  }
}

class Currency {
  String? name;
  String? symbol;
  String? code;
  int? conversionRate;

  Currency({this.name, this.symbol, this.code, this.conversionRate});

  Currency.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
    code = json['code'];
    conversionRate = json['conversionRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['symbol'] = symbol;
    data['code'] = code;
    data['conversionRate'] = conversionRate;
    return data;
  }
}

class Brand {
  String? sId;
  String? name;

  Brand({this.sId, this.name});

  Brand.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class VariantValues {
  // VariantValues({});

  VariantValues.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class Meta {
  Cashback? cashback;

  Meta({this.cashback});

  Meta.fromJson(Map<String, dynamic> json) {
    cashback =
        json['cashback'] != null ? Cashback.fromJson(json['cashback']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cashback != null) {
      data['cashback'] = cashback!.toJson();
    }
    return data;
  }
}

class Cashback {
  String? cashbackType;
  int? cashbackAmount;

  Cashback({this.cashbackType, this.cashbackAmount});

  Cashback.fromJson(Map<String, dynamic> json) {
    cashbackType = json['cashbackType'];
    cashbackAmount = json['cashbackAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cashbackType'] = cashbackType;
    data['cashbackAmount'] = cashbackAmount;
    return data;
  }
}

class Categories {
  String? sId;
  String? name;
  String? slug;
  String? parentCategoryId;
  String? logo;
  String? icon;

  Categories(
      {this.sId,
      this.name,
      this.slug,
      this.parentCategoryId,
      this.logo,
      this.icon});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    parentCategoryId = json['parentCategoryId'];
    logo = json['logo'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['parentCategoryId'] = parentCategoryId;
    data['logo'] = logo;
    data['icon'] = icon;
    return data;
  }
}

class Items1 {
  String? sId;
  int? quantity;
  int? variationsCount;
  String? type;
  dynamic variationReference;
  String? name;
  double? price;
  String? description;
  String? summary;
  String? details;
  String? nutritionalFacts;
  dynamic specialNote;
  String? image;
  int? rank;
  int? order;
  List<String>? gallery;
  double? discount;
  bool? hideFromWishlist;
  dynamic hideFromSearch;
  String? slug;
  String? sku;
  String? discountType;
  dynamic isFavorite;
  dynamic isInWishlist;
  List<String>? categoryIds;
  Currency? currency;
  String? currencyId;
  String? brandId;
  Brand? brand;
  dynamic productId;
  List<dynamic>? tags;
  dynamic tagIds;
  List<dynamic>? variantTypes;
  VariantValues? variantValues;
  List<dynamic>? variantTypeIds;
  VariantValues? variations;
  String? createdAt;
  dynamic isFeatured;
  Meta? meta;
  List<Categories>? categories;
  int? availableQuantity;
  int? discountPrice;
  String? lang;

  Items1(
      {this.sId,
      this.quantity,
      this.variationsCount,
      this.type,
      this.variationReference,
      this.name,
      this.price,
      this.description,
      this.summary,
      this.details,
      this.nutritionalFacts,
      this.specialNote,
      this.image,
      this.rank,
      this.order,
      this.gallery,
      this.discount,
      this.hideFromWishlist,
      this.hideFromSearch,
      this.slug,
      this.sku,
      this.discountType,
      this.isFavorite,
      this.isInWishlist,
      this.categoryIds,
      this.currency,
      this.currencyId,
      this.brandId,
      this.brand,
      this.productId,
      this.tags,
      this.tagIds,
      this.variantTypes,
      this.variantValues,
      this.variantTypeIds,
      this.variations,
      this.createdAt,
      this.isFeatured,
      this.meta,
      this.categories,
      this.availableQuantity,
      this.discountPrice,
      this.lang});

  Items1.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    quantity = json['quantity'];
    variationsCount = json['variationsCount'];
    type = json['type'];
    variationReference = json['variationReference'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    summary = json['summary'];
    details = json['details'];
    nutritionalFacts = json['nutritionalFacts'];
    specialNote = json['specialNote'];
    image = json['image'];
    rank = json['rank'];
    order = json['order'];
    gallery = json['gallery'].cast<String>();
    discount = json['discount'];
    hideFromWishlist = json['hideFromWishlist'];
    hideFromSearch = json['hideFromSearch'];
    slug = json['slug'];
    sku = json['sku'];
    discountType = json['discountType'];
    isFavorite = json['isFavorite'];
    isInWishlist = json['isInWishlist'];
    categoryIds = json['categoryIds'].cast<String>();
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    currencyId = json['currencyId'];
    brandId = json['brandId'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    productId = json['productId'];
    brand = json['Brand'];
    // if (json['tags'] != null) {
    // 	tags = <Null>[];
    // 	json['tags'].forEach((v) { tags!.add(Null.fromJson(v)); });
    // }
    tagIds = json['tagIds'];
    // if (json['variantTypes'] != null) {
    // 	variantTypes = <Null>[];
    // 	json['variantTypes'].forEach((v) { variantTypes!.add(Null.fromJson(v)); });
    // }
    variantValues = json['variantValues'] != null
        ? VariantValues.fromJson(json['variantValues'])
        : null;
    // if (json['variantTypeIds'] != null) {
    // 	variantTypeIds = <Null>[];
    // 	json['variantTypeIds'].forEach((v) { variantTypeIds!.add(Null.fromJson(v)); });
    // }
    variations = json['variations'] != null
        ? VariantValues.fromJson(json['variations'])
        : null;
    createdAt = json['createdAt'];
    isFeatured = json['isFeatured'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    availableQuantity = json['availableQuantity'];
    discountPrice = json['discountPrice'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['quantity'] = quantity;
    data['variationsCount'] = variationsCount;
    data['type'] = type;
    data['variationReference'] = variationReference;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['summary'] = summary;
    data['details'] = details;
    data['nutritionalFacts'] = nutritionalFacts;
    data['specialNote'] = specialNote;
    data['image'] = image;
    data['rank'] = rank;
    data['order'] = order;
    data['gallery'] = gallery;
    data['discount'] = discount;
    data['hideFromWishlist'] = hideFromWishlist;
    data['hideFromSearch'] = hideFromSearch;
    data['slug'] = slug;
    data['sku'] = sku;
    data['discountType'] = discountType;
    data['isFavorite'] = isFavorite;
    data['isInWishlist'] = isInWishlist;
    data['categoryIds'] = categoryIds;
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    data['currencyId'] = currencyId;
    data['brandId'] = brandId;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['productId'] = productId;
    data['Brand'] = brand;
    // if (tags != null) {
    //   data['tags'] = tags!.map((v) => v.toJson()).toList();
    // }
    data['tagIds'] = tagIds;
    // if (variantTypes != null) {
    //   data['variantTypes'] = variantTypes!.map((v) => v.toJson()).toList();
    // }
    if (variantValues != null) {
      data['variantValues'] = variantValues!.toJson();
    }
    // if (variantTypeIds != null) {
    //   data['variantTypeIds'] = variantTypeIds!.map((v) => v.toJson()).toList();
    // }
    if (variations != null) {
      data['variations'] = variations!.toJson();
    }
    data['createdAt'] = createdAt;
    data['isFeatured'] = isFeatured;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['availableQuantity'] = availableQuantity;
    data['discountPrice'] = discountPrice;
    data['lang'] = lang;
    return data;
  }
}
