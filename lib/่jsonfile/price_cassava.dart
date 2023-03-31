// To parse this JSON data, do
//
//     final priceCassava = priceCassavaFromJson(jsonString);

import 'dart:convert';

List<PriceCassava> priceCassavaFromJson(String str) => List<PriceCassava>.from(json.decode(str).map((x) => PriceCassava.fromJson(x)));

String priceCassavaToJson(List<PriceCassava> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PriceCassava {
  PriceCassava({
    required this.id,
    this.chip,
    this.dryresidue,
    this.thrpercent,
    this.twopercent,
  });

  int id;
  String? chip;
  String? dryresidue;
  String? thrpercent;
  String? twopercent;

  factory PriceCassava.fromJson(Map<String, dynamic> json) => PriceCassava(
    id: json["id"],
    chip: json["chip"],
    dryresidue: json["dryresidue"],
    thrpercent: json["thrpercent"],
    twopercent: json["twopercent"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "chip": chip,
    "dryresidue": dryresidue,
    "thrpercent": thrpercent,
    "twopercent": twopercent,
  };
}
