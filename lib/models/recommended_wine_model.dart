class RecommendedWineModel {
  final int id;
  final String price;
  final String title;
  final String description;
  final String imagePath;
  final int rating;
  bool isFavourite;

  RecommendedWineModel(
      {required this.id,
      required this.price,
      required this.title,
      required this.description,
      required this.imagePath,
      required this.rating,
      this.isFavourite = false});
}
