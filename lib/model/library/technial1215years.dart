import '../base_model.dart';

class Technical1215 extends BaseModel {
  final String publishedAt;
  final String channelId;
  final String title;
  final String description;
  final Map<String, dynamic> thumbnails;
  final String channelTitle;
  final String playlistId;
  final int position;
  final String videoId;
  final String videoOwnerChannelTitle;
  final String videoOwnerChannelId;

  Technical1215({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    this.description = "",
    required this.thumbnails,
    required this.channelTitle,
    required this.playlistId,
    required this.position,
    required this.videoId,
    required this.videoOwnerChannelTitle,
    required this.videoOwnerChannelId,
  });

  factory Technical1215.fromJson(Map<String, dynamic> json) {
    return Technical1215(
      publishedAt: json['publishedAt'],
      channelId: json['channelId'],
      title: json['title'],
      description: json['description'] ?? "",
      thumbnails: json['thumbnails'],
      channelTitle: json['channelTitle'],
      playlistId: json['playlistId'],
      position: json['position'],
      videoId: json['resourceId']['videoId'],
      videoOwnerChannelTitle: json['videoOwnerChannelTitle'],
      videoOwnerChannelId: json['videoOwnerChannelId'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'publishedAt': publishedAt,
      'channelId': channelId,
      'title': title,
      'description': description,
      'thumbnails': thumbnails,
      'channelTitle': channelTitle,
      'playlistId': playlistId,
      'position': position,
      'videoId': videoId,
      'videoOwnerChannelTitle': videoOwnerChannelTitle,
      'videoOwnerChannelId': videoOwnerChannelId,
    };
  }
}
