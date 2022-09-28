class Ads {
  String? status;
  List<Response>? response;

  Ads({this.status, this.response});

  Ads.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? image;
  List<String>? displayIn;
  String? type;
  String? placement;
  int? order;
  String? startDate;
  bool? isShown;
  String? status;
  String? statusLastUpdatedAt;
  String? categoryId;
  Category? category;
  String? endDate;
  Category? product;

  Response(
      {this.sId,
      this.title,
      this.image,
      this.displayIn,
      this.type,
      this.placement,
      this.order,
      this.startDate,
      this.isShown,
      this.status,
      this.statusLastUpdatedAt,
      this.categoryId,
      this.category,
      this.endDate,
      this.product});

  Response.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'];
    displayIn = json['displayIn'].cast<String>();
    type = json['type'];
    placement = json['placement'];
    order = json['order'];
    startDate = json['startDate'];
    isShown = json['isShown'];
    status = json['status'];
    statusLastUpdatedAt = json['statusLastUpdatedAt'];
    categoryId = json['categoryId'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    endDate = json['endDate'];
    product =
        json['product'] != null ? Category.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['image'] = image;
    data['displayIn'] = displayIn;
    data['type'] = type;
    data['placement'] = placement;
    data['order'] = order;
    data['startDate'] = startDate;
    data['isShown'] = isShown;
    data['status'] = status;
    data['statusLastUpdatedAt'] = statusLastUpdatedAt;
    data['categoryId'] = categoryId;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['endDate'] = endDate;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Category {
  String? sId;
  String? name;
  String? slug;

  Category({this.sId, this.name, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}