import 'dart:convert';

CultureReport cultureReportFromJson(String str) =>
    CultureReport.fromJson(json.decode(str));

String cultureReportToJson(CultureReport data) => json.encode(data.toJson());

class CultureReport {
  CultureReport({
    this.incident,
    this.region,
    this.description,
    this.town,
    this.occurrenceTimes,
    this.genderAffected,
  });

  String incident;
  String region;
  String description;
  String town;
  String occurrenceTimes;
  String genderAffected;

  factory CultureReport.fromJson(Map<String, dynamic> json) => CultureReport(
        incident: json["incident"],
        region: json["region"],
        description: json["description"],
        town: json["town"],
        occurrenceTimes: json["occurrenceTimes"],
        genderAffected: json["genderAffected"],
      );

  Map<String, dynamic> toJson() => {
        "incident": incident,
        "region": region,
        "description": description,
        "town": town,
        "occurrenceTimes": occurrenceTimes,
        "genderAffected": genderAffected,
      };
}
