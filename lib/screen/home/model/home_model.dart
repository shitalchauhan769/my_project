class FakstoresModel {
  String? id, title, description, category, image;
  var



  price;
  RatingModel? ratingModel;

  FakstoresModel(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.image,
      this.price,
      this.ratingModel});

  factory FakstoresModel.MapToModel(Map m1) {
    return FakstoresModel(
        category: m1['category'],
        image: m1['image'],
        description: m1['description'],
        id: m1['id'],
        price: m1['price'],
        title: m1['title'],
        ratingModel: RatingModel.MapToModel(m1));
  }
}

class RatingModel {
  num? rate;
  int? count;

  RatingModel({this.rate, this.count});

  factory RatingModel.MapToModel(Map m1) {
    return RatingModel(count: m1['count'], rate: m1['rate']);
  }
}
