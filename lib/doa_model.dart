class Doa {
  String? arab;
  String? indo;
  String? judul;
  String? source;

  Doa({
    required this.arab,
    required this.indo,
    required this.judul,
    required this.source,
  });

  factory Doa.fromJson(Map<String, dynamic> json) => Doa(
        arab: json["arab"],
        indo: json["indo"],
        judul: json["judul"],
        source: json["source"],
      );

  Map<String?, dynamic> toJson() => {
        "arab": arab == null ? null : arab!,
        "indo": indo == null ? null : indo!,
        "judul": judul == null ? null : judul!,
        "source": source == null ? null : source!,
      };
}
