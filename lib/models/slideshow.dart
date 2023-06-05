class SlideshowModel {
  final int id;
  final String imagePath;
  final String title;
  final String link;
  final int position;
  final bool status;

  SlideshowModel({required this.id, required this.imagePath, required this.title, required this.link, required this.position, required this.status});

  factory SlideshowModel.fromJson(Map<String, dynamic> data) {
    return SlideshowModel(
      id: data['id'],
      imagePath: data['image'],
      title: data['title'],
      link: data['link'],
      position: int.parse(data['position'] as String),
      status: data['status'],
    );
  }
}
