class RecommendationModel {
  final String? backdropPath;
  final int? id;

  RecommendationModel({
    required this.backdropPath,
    required this.id,
  });
}

class RecommndetionalListModel {
  List<RecommendationModel>? reList;
  RecommndetionalListModel({this.reList});
}
