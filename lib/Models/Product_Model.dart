class DataModel {
  int? limit;
  int? skip;
  int? total;

  List<ProductModel>? products;

  DataModel({this.limit, this.products, this.skip, this.total});

  factory DataModel.fromJson(Map<String, dynamic> JSION) {
    List<ProductModel> mproducts = [];

    for (Map<String, dynamic> SingleProduct in JSION['products']) {
      ProductModel ccProducts = ProductModel.fromJson(SingleProduct);

      mproducts.add(ccProducts);
    }

    return DataModel(
      limit: JSION['limit'],
      products: mproducts,
      skip: JSION['skip'],
      total: JSION['total'],
    );
  }
}

class ProductModel {
  String? availabilityStatus;
  String? brand;

  String? category;

  String? description;

  DimensionsModel? dimensions;

  /// Classes---

  double? discountPercentage;

  int? id;

  List<dynamic>? images;

  /// Dimanic arrya ------------------

  MetaModel? meta;

  /// Classes---

  int? minimumOrderQuantity;

  double? price;

  double? rating;

  String? returnPolicy;

  List<ReviewModel>? reviews;

  /// Dimanic arrya ------------------

  String? shippingInformation;

  String? sku;

  int? stock;

  List<dynamic>? tags;

  /// Dimanic arrya ------------------

  String? thumbnail;

  String? title;

  String? warrantyInformation;

  int? weight;

  ProductModel(
      {this.availabilityStatus,
      this.brand,
      this.category,
      this.description,
      this.dimensions,
      this.discountPercentage,
      this.id,
      this.images,
      this.meta,
      this.minimumOrderQuantity,
      this.price,
      this.rating,
      this.returnPolicy,
      this.reviews,
      this.shippingInformation,
      this.sku,
      this.stock,
      this.tags,
      this.thumbnail,
      this.title,
      this.warrantyInformation,
      this.weight});

  factory ProductModel.fromJson(Map<String, dynamic> JSION) {
 List<ReviewModel> mReviews=[];

    for (Map<String, dynamic> singleRiviews in JSION['reviews']) {
      ReviewModel SingleData = ReviewModel.fromJson(singleRiviews);

      mReviews.add(SingleData);
    }

    return ProductModel(
      availabilityStatus: JSION['availabilityStatus'],
      brand: JSION['brand'],
      category: JSION['category'],
      description: JSION['description'],
      dimensions: DimensionsModel.fromJson(JSION[
          'dimensions']), // sorted they are single map class so there is no need for for in loop
      //  discountPercentage: JSION['discountPercentage'],   //----------------P3
      id: JSION['id'],
      images: JSION['images'],
      meta: MetaModel.fromJson(JSION[
          'meta']), // sorted they are single map class so there is no need for for in loop
      minimumOrderQuantity: JSION['minimumOrderQuantity'],
      price: JSION['price'],
      rating: JSION['rating'],
      returnPolicy: JSION['returnPolicy'],
      reviews:mReviews,  // sorted they are   collection of map
      shippingInformation: JSION['shippingInformation'],
      sku: JSION['sku'],
      stock: JSION['stock'],
      tags: JSION['tags'],
      thumbnail: JSION['thumbnail'],
      title: JSION['title'],
      warrantyInformation: JSION['warrantyInformation'],
      weight: JSION['weight'],
    );
  }
}

class ReviewModel {
  String? comment;

 String? date;

 int? rating;

  String? reviewerEmail;

  String? reviewerName;

  ReviewModel(
      {this.comment,
      this.date,
      this.rating,
      this.reviewerEmail,
      this.reviewerName});

  factory ReviewModel.fromJson(Map<String, dynamic> JSON) {
    return ReviewModel(
      comment: JSON['comment'],
      date: JSON['date'],
      rating: JSON['rating'],
      reviewerEmail: JSON['reviewerEmail'],
      reviewerName: JSON['reviewerName'],
    );
  }
}

class DimensionsModel {
  double? depth;
  double? height;
  double? width;

  DimensionsModel({this.depth, this.height, this.width});

  factory DimensionsModel.fromJson(Map<String, dynamic> JSION) {
    return DimensionsModel(
      depth: JSION['depth'],
      // height: JSION['height'], //     ----------------- p1
      //     width: JSION['width'],                     //     ----------------- p2
    );
  }
}

class MetaModel {
  String? barcode;
  String? createdAt;
  String? qrCode;
  String? updatedAt;

  MetaModel({this.barcode, this.createdAt, this.qrCode, this.updatedAt});

  factory MetaModel.fromJson(Map<String, dynamic> JSION) {
    return MetaModel(
        barcode: JSION['barcode'],
        createdAt: JSION['createdAt'],
        qrCode: JSION['qrCode'],
        updatedAt: JSION['updatedAt']);
  }
}
