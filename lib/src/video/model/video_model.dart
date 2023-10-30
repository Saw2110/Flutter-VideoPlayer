import '../../../core/core.dart';

class VideoModel {
  final List<VideoDataModel> videoList;
  VideoModel({required this.videoList});

  ///
  String? error;
  VideoModel.withError(String errorMessage, this.videoList) {
    error = errorMessage;
  }

  factory VideoModel.fromJson(DataMap json) {
    return VideoModel(
      videoList: json["video"] == null
          ? []
          : List<VideoDataModel>.from(
              json["video"]!.map((x) => VideoDataModel.fromJson(x))),
    );
  }

  DataMap toJson() => {
        "video": videoList.map((x) => x.toJson()).toList(),
      };
}

class VideoDataModel {
  VideoDataModel({
    required this.title,
    required this.description,
    required this.createdDate,
    required this.source,
    required this.sourceImg,
    required this.videoUrl,
    required this.thumbnail,
    required this.urlDetail,
    required this.views,
    required this.tags,
  });

  final String title;
  final String description;
  final String createdDate;
  final String source;
  final String sourceImg;
  final String videoUrl;
  final String thumbnail;
  final String urlDetail;
  final String views;
  final String tags;

  factory VideoDataModel.fromJson(DataMap json) {
    return VideoDataModel(
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      createdDate: json["createdDate"] ?? "",
      source: json["source"] ?? "",
      sourceImg: json["sourceImg"] ?? "",
      videoUrl: json["videoUrl"] ?? "",
      thumbnail: json["thumbnail"] ?? "",
      urlDetail: json["urlDetail"] ?? "",
      views: json["views"] ?? "",
      tags: json["tags"] ?? "",
    );
  }

  DataMap toJson() => {
        "title": title,
        "description": description,
        "createdDate": createdDate,
        "source": source,
        "sourceImg": sourceImg,
        "videoUrl": videoUrl,
        "thumbnail": thumbnail,
        "urlDetail": urlDetail,
        "views": views,
        "tags": tags,
      };
}
