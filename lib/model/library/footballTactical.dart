import '../base_model.dart';

class FootballTactical extends BaseModel {
  final String? publishedAt;
  final String? channelId;
  final String? title;
  final String? description;
  final Map<String, dynamic>? thumbnails;
  final String? channelTitle;
  final String? playlistId;
  final int? position;
  final String? videoId;
  final String? videoOwnerChannelTitle;
  final String? videoOwnerChannelId;

  FootballTactical({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.playlistId,
    this.position,
    this.videoId,
    this.videoOwnerChannelTitle,
    this.videoOwnerChannelId,
  });

  factory FootballTactical.fromJson(Map<String, dynamic> json) {
    return FootballTactical(
      publishedAt: json['publishedAt'],
      channelId: json['channelId'],
      title: json['title'],
      description: json['description'],
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
