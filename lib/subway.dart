class Subway {
  final String arrivalMessage;

  final String heading;

  Subway({required this.arrivalMessage, required this.heading});

  factory Subway.fromJson(Map<String, dynamic> json) {
    return Subway(
      arrivalMessage: json['arvlMsg2'] as String,
      heading: json['trainLineNm'] as String,
    );
  }
}
