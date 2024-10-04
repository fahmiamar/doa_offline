class DoaDetail {
  DoaDetail({
    required this.id,
    required this.doa,
    required this.ayat,
    required this.artinya,
  });

  final String id;
  final String doa;
  final String ayat;
  final String artinya;

  factory DoaDetail.fromJson(Map<String, dynamic> json) => DoaDetail(
        id: json["id"],
        doa: json["doa"],
        ayat: json["ayat"],
        artinya: json["artinya"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doa": doa,
        "ayat": ayat,
        "artinya": artinya,
      };
}
