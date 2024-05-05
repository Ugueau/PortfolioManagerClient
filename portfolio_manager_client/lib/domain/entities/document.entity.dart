class DocumentEntity {
  final String? title;
  final String? descr;
  final String? link;
  final String? creationDate;
  final int id;
  final List<String>? categories;
  final List<String>? images;

  const DocumentEntity({required this.title, required this.descr,required this.link, required this.creationDate, required this.id, required this.categories,  required this.images});
}