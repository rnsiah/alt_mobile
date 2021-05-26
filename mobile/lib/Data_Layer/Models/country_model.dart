class Country {
  Country({
    required this.id,
    required this.name,
    required this.flag,
  });

  int id;
  String name;
  String flag;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
    flag: json["flag"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "flag": flag,
  };
}