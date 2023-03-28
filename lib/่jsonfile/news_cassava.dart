// To parse this JSON data, do
//
//     final newsCassava = newsCassavaFromJson(jsonString);

// To parse this JSON data, do
//
//     final newsCassava = newsCassavaFromJson(jsonString);

import 'dart:convert';

List<NewsCassava> newsCassavaFromJson(String str) => List<NewsCassava>.from(json.decode(str).map((x) => NewsCassava.fromJson(x)));

String newsCassavaToJson(List<NewsCassava> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsCassava {
  NewsCassava({
    required this.id,
    this.title,
    this.urlLink,
    this.imageSrc,
    this.subTitle,
    this.urlLinkHref,
    required this.webScraperOrder,
    this.webScraperStartUrl,
  });

  int id;
  String? title;
  String? urlLink;
  String? imageSrc;
  String? subTitle;
  String? urlLinkHref;
  String webScraperOrder;
  String? webScraperStartUrl;

  factory NewsCassava.fromJson(Map<String, dynamic> json) => NewsCassava(
    id: json["id"],
    title: json["title"],
    urlLink: json["url-link"],
    imageSrc: json["image-src"],
    subTitle: json["sub-title"],
    urlLinkHref: json["url-link-href"],
    webScraperOrder: json["web-scraper-order"],
    webScraperStartUrl: json["web-scraper-start-url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "url-link": urlLink,
    "image-src": imageSrc,
    "sub-title": subTitle,
    "url-link-href": urlLinkHref,
    "web-scraper-order": webScraperOrder,
    "web-scraper-start-url": webScraperStartUrl,
  };
}

