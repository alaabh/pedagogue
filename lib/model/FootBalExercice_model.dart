import 'base_model.dart';

class FootballExercise extends BaseModel {
  final String? publishedAt;
  final String? channelId;
  final String? title;
  final String? description;
  final Map<String, dynamic>? thumbnails;
  final String? channelTitle;
  final String? playlistId;
  final String? videoId;
  final int? position;
  final Map<String, dynamic>? resourceId;
  final String? videoOwnerChannelTitle;
  final String? videoOwnerChannelId;

  FootballExercise({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.playlistId,
    this.videoId,
    this.position,
    this.resourceId,
    this.videoOwnerChannelTitle,
    this.videoOwnerChannelId,
  });

  factory FootballExercise.fromJson(Map<String, dynamic> json) {
    return FootballExercise(
      publishedAt: json['publishedAt'] as String?,
      channelId: json['channelId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      thumbnails: json['thumbnails'] as Map<String, dynamic>?,
      channelTitle: json['channelTitle'] as String?,
      playlistId: json['playlistId'] as String?,
      position: json['position'] as int?,
      videoId: json['resourceId'] != null ? json['resourceId']['videoId'] as String? : null,
      resourceId: json['resourceId'] as Map<String, dynamic>?,
      videoOwnerChannelTitle: json['videoOwnerChannelTitle'] as String?,
      videoOwnerChannelId: json['videoOwnerChannelId'] as String?,
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
      'resourceId': resourceId,
      'videoId': videoId, // Note: this assumes you want to include videoId at this level for some reason.
      'videoOwnerChannelTitle': videoOwnerChannelTitle,
      'videoOwnerChannelId': videoOwnerChannelId,
    };
  }
}
