class FavoriteEntity {
  final String productId;
  String? title;
  bool? avaiable;
  double? rating;
  String get ratingString =>
      rating == null || rating == 0.0 ? "0.0" : this.rating.toString();
  String? category;
  String? location;
  String? thumbnail;
  int? lowestPrice;
  bool? favoriteStatus;

  FavoriteEntity({
    required this.productId,
    this.favoriteStatus,
    this.title,
    this.category,
    this.avaiable,
    this.rating,
    this.location,
    this.thumbnail,
    this.lowestPrice,
  });
}
