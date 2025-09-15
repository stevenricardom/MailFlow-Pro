
// models/filter_model.dart
class Filter {
  final int id;
  String name;
  String description;
  String type;
  String criteria;
  bool active;
  bool autoReply;
  bool caseSensitive;

  Filter({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.criteria,
    this.active = true,
    this.autoReply = false,
    this.caseSensitive = false,
  });

  Filter copyWith({
    String? name,
    String? description,
    String? type,
    String? criteria,
    bool? active,
    bool? autoReply,
    bool? caseSensitive,
  }) {
    return Filter(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      criteria: criteria ?? this.criteria,
      active: active ?? this.active,
      autoReply: autoReply ?? this.autoReply,
      caseSensitive: caseSensitive ?? this.caseSensitive,
    );
  }
}