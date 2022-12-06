class SampleModel {
  Id? iId;
  int? rating;
  String? title;
  String? description;
  String? price;
  String? year;
  String? countryOfOrigin;
  String? volume;
  String? imagePath;

  SampleModel(
      {this.iId,
      this.title,
      this.description,
      this.price,
      this.year,
      this.volume,
      this.countryOfOrigin,
      this.rating,
      this.imagePath});

  SampleModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    rating = json['rating'];
    volume = json['volume'];
    title = json['title'];
    countryOfOrigin = json['countryOfOrigin'];
    description = json['description'];
    year = json['year'];
    price = json['price'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (iId != null) {
      data['_id'] = iId!.toJson();
    }
    if (rating != null) {
      data['rating'] = rating;
    }

    data['volume'] = volume;
    data['title'] = title;
    data['description'] = description;
    data['countryOfOrigin'] = countryOfOrigin;
    data['year'] = year;
    data['price'] = price;
    data['imagePath'] = imagePath;

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
