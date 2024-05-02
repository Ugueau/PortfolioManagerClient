class DocumentEntity {
  final String? imgPath;
  final String? title;
  final String? descr;
  final String? creationDate;
  final int id;
  final String categoryTitles;

  const DocumentEntity({required this.imgPath,required this.title, required this.descr, required this.creationDate, required this.id, required this.categoryTitles});
}