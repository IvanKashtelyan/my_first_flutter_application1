class BeerModel {
  String name;
  String description;
  String imageUrl;
  int id;

  BeerModel({this.id, this.name, this.description, this.imageUrl});

  static BeerModel fromJson(dynamic json) {
    return BeerModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["image_url"]);
  }
}
