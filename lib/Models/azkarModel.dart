class AzkarModel {
  String category;
  List<dynamic> array;

  AzkarModel({
    required this.category,
    required this.array,
  });
  factory AzkarModel.fromJson(Map<String, dynamic> json) {
    return (AzkarModel(category: json["category"], array: json["array"]));
  }
}

class Array{
  int id;
  String text;
  int count;
  Array({
    required this.id,
    required this.text,
    required this.count,
  });
  factory Array.fromJson(Map<String, dynamic> json) => Array(
        id: json["id"],
        text: json["text"],
        count: json["count"],
      );
}
