
class RestaurantCardModel{
  late String? title;
  late String? description;
  late String? url;
  late double? rating;

  RestaurantCardModel(this.title, this.description, this.url, this.rating);

  RestaurantCardModel.fromMap(Map<String, dynamic> map) {
    url = map['url'];
    title = map['title'];
    description = map['description'];
    // Parse the rating as a double
    rating = double.tryParse(map['rating'] ?? '');
  }
}

