
class AddOnEntity {
  AddOnEntity(
      {required this.name,
      this.description,
      required this.price,
      required this.id});


  /// Add on name, will be displayed as add on name
  final String name;

  /// Add on description, will be displayed as tooltip
  final String? description;

  /// price value that has been formatted
  ///
  final int price;

  /// Add on id
  final String id;


  get pricing => "${price.toString()}\$";
}
