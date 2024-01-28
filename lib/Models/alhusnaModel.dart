class HusnaModel {
    final String name;
    final String transliteration;
    final String meaning;

    HusnaModel({
        required this.name,
        required this.transliteration,
        required this.meaning,
    });

    factory HusnaModel.fromJson(Map<String, dynamic> json) => HusnaModel(
        name: json["name"],
        transliteration: json["transliteration"],
        meaning: json["meaning"],
    );
}