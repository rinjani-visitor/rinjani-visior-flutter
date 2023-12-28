class AddonEntity {
  final String title;
  final String description;

  AddonEntity({
    required this.title,
    this.description = "No description provided",
  });
  @override
  String toString() {
    return title;
  }
}
