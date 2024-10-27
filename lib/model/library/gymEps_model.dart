import '../base_model.dart';

class GymEps extends BaseModel {
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

  GymEps({
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

  factory GymEps.fromJson(Map<String, dynamic> json) {
    return GymEps(
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
