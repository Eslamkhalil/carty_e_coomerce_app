class BannerModel {
  bool? status;
  String? message;
  List<Data>? data;

  BannerModel({bool? status, String? message, List<Data>? data}) {
    if (status != null) {
      status = status;
    }
    if (message != null) {
      message = message;
    }
    if (data != null) {
      data = data;
    }
  }

  BannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? image;
  String? category;
  String? product;

  Data({int? id, String? image, String? category, String? product}) {
    if (id != null) {
      id = id;
    }
    if (image != null) {
      image = image;
    }
    if (category != null) {
      category = category;
    }
    if (product != null) {
      product = product;
    }
  }

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['category'] = category;
    data['product'] = product;
    return data;
  }
}
