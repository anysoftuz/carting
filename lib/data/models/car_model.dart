class CarModel {
  final String title;
  final String images;
  final int height;
  final int width;
  final int kg;

  CarModel({
    required this.title,
    required this.images,
    required this.height,
    required this.width,
    required this.kg,
  });

  CarModel copyWith({
    String? title,
    String? images,
    int? height,
    int? width,
    int? kg,
  }) {
    return CarModel(
      title: title ?? this.title,
      images: images ?? this.images,
      height: height ?? this.height,
      width: width ?? this.width,
      kg: kg ?? this.kg,
    );
  }
}
