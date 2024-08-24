class Config {
  final int id;
  final String field;
  final String value;

  Config({
    required this.id,
    required this.field,
    required this.value,
  });

  factory Config.fromLocalDatabase(Map<String, dynamic> config) {
    return Config(
      id: (config['id'] ?? 0) as int,
      field: (config['field'] ?? '') as String,
      value: (config['value'] ?? '') as String,
    );
  }
}
