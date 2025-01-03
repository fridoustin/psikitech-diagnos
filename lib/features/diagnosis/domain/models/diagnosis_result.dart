class DiagnosisResult {
  final String result;
  final DateTime date;

  DiagnosisResult({
    required this.result,
    required this.date,
  });

  // Serialisasi ke JSON
  Map<String, dynamic> toJson() {
    return {
      'result': result,
      'date': date.toIso8601String(),
    };
  }

  // Deserialisasi dari JSON
  factory DiagnosisResult.fromJson(Map<String, dynamic> json) {
    return DiagnosisResult(
      result: json['result'] as String,
      date: DateTime.parse(json['date'] as String),
    );
  }
}
