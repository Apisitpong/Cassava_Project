// To parse this JSON data, do
//
//     final priceCassava = priceCassavaFromJson(jsonString);

import 'dart:convert';

List<PriceCassava> priceCassavaFromJson(String str) => List<PriceCassava>.from(json.decode(str).map((x) => PriceCassava.fromJson(x)));

String priceCassavaToJson(List<PriceCassava> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PriceCassava {
  PriceCassava({
    required this.id,
    this.empty,
    required this.webScraperOrder,
    this.webScraperStartUrl,
    this.the25,
    this.the30,
  });

  int id;
  String? empty;
  String webScraperOrder;
  String? webScraperStartUrl;
  String? the25;
  String? the30;

  factory PriceCassava.fromJson(Map<String, dynamic> json) => PriceCassava(
    id: json["id"],
    empty: json["อำเภอ"],
    webScraperOrder: json["web-scraper-order"],
    webScraperStartUrl: json["web-scraper-start-url"],
    the25: json["เชื้อแป้ง 25%"],
    the30: json["เชื้อแป้ง 30%"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "อำเภอ": empty,
    "web-scraper-order": webScraperOrder,
    "web-scraper-start-url": webScraperStartUrl,
    "เชื้อแป้ง 25%": the25,
    "เชื้อแป้ง 30%": the30,
  };
}
