class Citation {
  late int id;
  late String category;
  late int count;
  late String description;
  late String reference;
  late String zekr;

  Citation({
    required this.id,
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.zekr,
  });

  Citation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    count = json['count'];
    description = json['description'];
    reference = json['reference'];
    zekr = json['zekr'];
  }
}
