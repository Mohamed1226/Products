class RateModel {
  final double rate;
  final int count;

  const RateModel({required this.count, required this.rate});

  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(
        count: json["count"],
        rate: json["rate"] is int ? json["rate"].toDouble() : json["rate"]);
  }
}
