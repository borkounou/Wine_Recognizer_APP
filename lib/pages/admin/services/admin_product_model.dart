import 'dart:convert';

class ProductModel {
  Id? iId;
  int? points;
  String? name;
  String? description;
  double? price;
  String? country;
  String? image;
  double? quantity;
  List<String>? imagePaths;

  ProductModel(
      {this.iId,
      this.points,
      this.name,
      this.description,
      this.price,
      this.country,
      this.image,
      this.quantity,
      this.imagePaths});

  ProductModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    points = json['points'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    country = json['country'];
    image = json['image'];
    quantity = json['quantity'];
    imagePaths = json['imagePaths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (iId != null) {
      data['_id'] = iId!.toJson();
    }
    data['points'] = points;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['country'] = country;
    data['image'] = image;
    data['quantity'] = quantity;
    data['imagePaths'] = imagePaths;
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$oid'] = oid;
    return data;
  }
}
