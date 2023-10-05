abstract class WishlistRepository {
  Future<List> fetchWishlists();
  Future<void> refreshWishlist();
}
