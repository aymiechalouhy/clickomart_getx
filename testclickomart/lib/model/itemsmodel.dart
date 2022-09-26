class CategoryItems {
	String? status;
	Response? response;

	CategoryItems({this.status, this.response});

	CategoryItems.fromJson(Map<String, dynamic> json) {
		status = json['status'];
		response = json['response'] != null ? Response.fromJson(json['response']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['status'] = status;
		if (response != null) {
      data['response'] = response!.toJson();
    }
		return data;
	}
}

class Response {
	List<Items>? items;
	int? total;
	Facets? facets;
	String? path;
	List<dynamic>? subcategories;

	Response({this.items, this.total, this.facets, this.path, this.subcategories});

	Response.fromJson(Map<String, dynamic> json) {
		if (json['items'] != null) {
			items = <Items>[];
			json['items'].forEach((v) { items!.add(Items.fromJson(v)); });
		}
		total = json['total'];
		facets = json['facets'] != null ? Facets.fromJson(json['facets']) : null;
		path = json['path'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
		data['total'] = total;
		if (facets != null) {
      data['facets'] = facets!.toJson();
    }
		data['path'] = path;
		return data;
	}
}

class Items {
	String? sId;
	int? quantity;
	int? variationsCount;
	String? type;
	dynamic variationReference;
	String? name;
	int? price;
	String? description;
	String? summary;
	dynamic details;
	dynamic nutritionalFacts;
	dynamic specialNote;
	String? image;
	String? rank;
	int? order;
	List<String>? gallery;
	int? discount;
	bool? hideFromWishlist;
	dynamic hideFromSearch;
	String? slug;
	String? sku;
	String? discountType;
	dynamic isFavorite;
	dynamic isInWishlist;
	List<String>? categoryIds;
	List<dynamic>? liveTranslations;
	dynamic translationIds;
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

	Items({this.sId, this.quantity, this.variationsCount, this.type, this.variationReference, this.name, this.price, this.description, this.summary, this.details, this.nutritionalFacts, this.specialNote, this.image, this.rank, this.order, this.gallery, this.discount, this.hideFromWishlist, this.hideFromSearch, this.slug, this.sku, this.discountType, this.isFavorite, this.isInWishlist, this.categoryIds, this.liveTranslations, this.translationIds, this.currency, this.currencyId, this.brandId, this.brand, this.productId,this.tags, this.tagIds, this.variantTypes, this.variantValues, this.variantTypeIds, this.variations, this.createdAt, this.isFeatured, this.meta, this.categories, this.availableQuantity, this.discountPrice});

	Items.fromJson(Map<String, dynamic> json) {
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
		// if (json['liveTranslations'] != null) {
		// 	liveTranslations = <Null>[];
		// 	json['liveTranslations'].forEach((v) { liveTranslations!.add(Null.fromJson(v)); });
		// }
		translationIds = json['translationIds'];
		currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
		currencyId = json['currencyId'];
		brandId = json['brandId'];
		brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
		productId = json['productId'];
		brand = json['Brand'];
		tagIds = json['tagIds'];
		// variantValues = json['variantValues'] != null ? VariantValues.fromJson(json['variantValues']) : null;
		// variations = json['variations'] != null ? VariantValues.fromJson(json['variations']) : null;
		createdAt = json['createdAt'];
		isFeatured = json['isFeatured'];
		meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
		if (json['categories'] != null) {
			categories = <Categories>[];
			json['categories'].forEach((v) { categories!.add(Categories.fromJson(v)); });
		}
		availableQuantity = json['availableQuantity'];
		discountPrice = json['discountPrice'];
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
		data['translationIds'] = translationIds;
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
		data['tagIds'] = tagIds;
		if (variantValues != null) {
      data['variantValues'] = variantValues!.toJson();
    }
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

	// VariantValues.fromJson(Map<String, dynamic> json) {
	// }

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		return data;
	}
}

class Meta {
	Cashback? cashback;

	Meta({this.cashback});

	Meta.fromJson(Map<String, dynamic> json) {
		cashback = json['cashback'] != null ? Cashback.fromJson(json['cashback']) : null;
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
	int? cashbackAmount;
	String? cashbackType;

	Cashback({this.cashbackAmount, this.cashbackType});

	Cashback.fromJson(Map<String, dynamic> json) {
		cashbackAmount = json['cashbackAmount'];
		cashbackType = json['cashbackType'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['cashbackAmount'] = cashbackAmount;
		data['cashbackType'] = cashbackType;
		return data;
	}
}

class Categories {
	String? sId;
	String? name;
	String? logo;
	String? icon;
	String? slug;
	String? parentCategoryId;

	Categories({this.sId, this.name, this.logo, this.icon, this.slug, this.parentCategoryId});

	Categories.fromJson(Map<String, dynamic> json) {
		sId = json['_id'];
		name = json['name'];
		logo = json['logo'];
		icon = json['icon'];
		slug = json['slug'];
		parentCategoryId = json['parentCategoryId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['_id'] = sId;
		data['name'] = name;
		data['logo'] = logo;
		data['icon'] = icon;
		data['slug'] = slug;
		data['parentCategoryId'] = parentCategoryId;
		return data;
	}
}

class Facets {
	List<Brand>? brands;
	// List<Tags>? tags;
	List<Prices>? prices;
	List<Attributes>? attributes;

	Facets({this.brands, this.prices, this.attributes});

	Facets.fromJson(Map<String, dynamic> json) {
		// if (json['brands'] != null) {
		// 	brands = <Brands>[];
		// 	json['brands'].forEach((v) { brands!.add(Brands.fromJson(v)); });
		// }
		// if (json['Brands'] != null) {
		// 	brands = <Null>[];
		// 	json['Brands'].forEach((v) { brands!.add(Null.fromJson(v)); });
		// }
		// if (json['tags'] != null) {
		// 	tags = <Tags>[];
		// 	json['tags'].forEach((v) { tags!.add(Tags.fromJson(v)); });
		// }
		if (json['Prices'] != null) {
			prices = <Prices>[];
			json['Prices'].forEach((v) { prices!.add(Prices.fromJson(v)); });
		}
		if (json['Attributes'] != null) {
			attributes = <Attributes>[];
			json['Attributes'].forEach((v) { attributes!.add(Attributes.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		if (brands != null) {
      data['brands'] = brands!.map((v) => v.toJson()).toList();
    }
		if (brands != null) {
      data['Brands'] = brands!.map((v) => v.toJson()).toList();
    }
		// if (tags != null) {
    //   data['tags'] = tags!.map((v) => v.toJson()).toList();
    // }
		if (prices != null) {
      data['Prices'] = prices!.map((v) => v.toJson()).toList();
    }
		if (attributes != null) {
      data['Attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Prices {
	int? min;
	double? max;

	Prices({this.min, this.max});

	Prices.fromJson(Map<String, dynamic> json) {
		min = json['min'];
		max = json['max'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['min'] = min;
		data['max'] = max;
		return data;
	}
}

class Attributes {
	String? name;
	List<String>? values;

	Attributes({this.name, this.values});

	Attributes.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		values = json['values'].cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['name'] = name;
		data['values'] = values;
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
	int? price;
	String? description;
	String? summary;
	dynamic details;
	dynamic nutritionalFacts;
	dynamic specialNote;
	String? image;
	String? rank;
	int? order;
	List<String>? gallery;
	int? discount;
	bool? hideFromWishlist;
	dynamic hideFromSearch;
	String? slug;
	String? sku;
	String? discountType;
	dynamic isFavorite;
	dynamic isInWishlist;
	List<String>? categoryIds;
	List<dynamic>? liveTranslations;
	dynamic translationIds;
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

	Items1({this.sId, this.quantity, this.variationsCount, this.type, this.variationReference, this.name, this.price, this.description, this.summary, this.details, this.nutritionalFacts, this.specialNote, this.image, this.rank, this.order, this.gallery, this.discount, this.hideFromWishlist, this.hideFromSearch, this.slug, this.sku, this.discountType, this.isFavorite, this.isInWishlist, this.categoryIds, this.liveTranslations, this.translationIds, this.currency, this.currencyId, this.brandId, this.brand, this.productId,this.tags, this.tagIds, this.variantTypes, this.variantValues, this.variantTypeIds, this.variations, this.createdAt, this.isFeatured, this.meta, this.categories, this.availableQuantity, this.discountPrice});

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
		// if (json['liveTranslations'] != null) {
		// 	liveTranslations = <Null>[];
		// 	json['liveTranslations'].forEach((v) { liveTranslations!.add(Null.fromJson(v)); });
		// }
		translationIds = json['translationIds'];
		currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;
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
		// variantValues = json['variantValues'] != null ? VariantValues.fromJson(json['variantValues']) : null;
		// if (json['variantTypeIds'] != null) {
		// 	variantTypeIds = <Null>[];
		// 	json['variantTypeIds'].forEach((v) { variantTypeIds!.add(Null.fromJson(v)); });
		// }
		// variations = json['variations'] != null ? VariantValues.fromJson(json['variations']) : null;
		createdAt = json['createdAt'];
		isFeatured = json['isFeatured'];
		meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
		if (json['categories'] != null) {
			categories = <Categories>[];
			json['categories'].forEach((v) { categories!.add(Categories.fromJson(v)); });
		}
		availableQuantity = json['availableQuantity'];
		discountPrice = json['discountPrice'];
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
		if (liveTranslations != null) {
      data['liveTranslations'] = liveTranslations!.map((v) => v.toJson()).toList();
    }
		data['translationIds'] = translationIds;
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
		if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
		data['tagIds'] = tagIds;
		if (variantTypes != null) {
      data['variantTypes'] = variantTypes!.map((v) => v.toJson()).toList();
    }
		if (variantValues != null) {
      data['variantValues'] = variantValues!.toJson();
    }
		if (variantTypeIds != null) {
      data['variantTypeIds'] = variantTypeIds!.map((v) => v.toJson()).toList();
    }
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
		return data;
	}
}