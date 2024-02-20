class BaseModel {
  final String name;
  final String imageUrl;
  final num price;
  final num preview;
  final num star;
  num value;
  final num id;

  BaseModel(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.preview,
      required this.star,
      required this.value});
}
