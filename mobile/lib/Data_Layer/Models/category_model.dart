class Category {
  Category({
    required this.name,
    required this.image,
    required this.information,
  });

  String name;
  String image;
  String information;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
    image: json["image"],
    information: json["information"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "information": information,
  };
}