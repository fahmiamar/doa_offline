import 'dart:convert';

QuranDetail quranDetailFromJson(String str) =>
    QuranDetail.fromJson(json.decode(str));

String quranDetailToJson(QuranDetail data) => json.encode(data.toJson());

class QuranDetail {
  String? arab;
  String? indo;
  String? judul;
  String? source;

  QuranDetail({
    required this.arab,
    required this.indo,
    required this.judul,
    required this.source,
  });

  factory QuranDetail.fromJson(Map<String, dynamic> json) => QuranDetail(
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
