class ProductModel {
  Id? iId;
  int? points;
  String? title;
  String? description;
  int? price;
  String? variety;
  String? region1;
  String? region2;
  String? province;
  String? country;
  String? winery;
  List<String>? name;

  ProductModel(
      {this.iId,
      this.points,
      this.title,
      this.description,
      this.price,
      this.variety,
      this.region1,
      this.region2,
      this.province,
      this.country,
      this.winery,
      this.name});

  ProductModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    points = json['points'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    variety = json['variety'];
    region1 = json['region_1'];
    region2 = json['region_2'];
    province = json['province'];
    country = json['country'];
    winery = json['winery'];
    name = json['name'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (iId != null) {
      data['_id'] = iId!.toJson();
    }
    data['points'] = points;
    data['title'] = title;
    data['description'] = description;
    data['price'] = this.price;
    data['variety'] = variety;
    data['region_1'] = region1;
    data['region_2'] = region2;
    data['province'] = province;
    data['country'] = country;
    data['winery'] = winery;
    data['name'] = name;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['$oid'] = oid;
    return data;
  }
}
