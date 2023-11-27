import 'package:json_annotation/json_annotation.dart';
import 'package:rinjani_visitor/core/domain/entity/base_response.dart';
import 'package:rinjani_visitor/features/favorite/domain/entity/favorite.dart';

part 'get_favorite.g.dart';

@JsonSerializable()
class GetFavoriteResponse extends BaseResponse<List<GetFavoriteBody>?> {
  GetFavoriteResponse(
      {required super.errors, required super.message, required super.data});

  factory GetFavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFavoriteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetFavoriteResponseToJson(this);
}

@JsonSerializable()
class GetFavoriteBody {
  String productId;
  String? title;
  String? category;
  @JsonKey(name: "status")
  bool? avaiable;
  double? rating;
  String? location;
  String? thumbnail;
  int? lowestPrice;

  GetFavoriteBody({
    required this.productId,
    this.title,
    this.rating,
    this.avaiable,
    this.category,
    this.location,
    this.lowestPrice,
    this.thumbnail,
  });

  factory GetFavoriteBody.fromJson(Map<String, dynamic> json) =>
      _$GetFavoriteBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GetFavoriteBodyToJson(this);

  FavoriteEntity toEntity() => FavoriteEntity(
        productId: productId,
        category: category,
        avaiable: avaiable,
        location: location,
        lowestPrice: lowestPrice,
        rating: rating,
        thumbnail: thumbnail,
        title: title,
      );
}
