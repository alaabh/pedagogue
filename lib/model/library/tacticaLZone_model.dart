import '../base_model.dart';

class TacticalZone extends BaseModel {
  final dynamic publishedAt;
  final dynamic channelId;
  final dynamic title;
  final dynamic description;
  final Map<String, dynamic>? thumbnails;
  final dynamic channelTitle;
  final dynamic playlistId;
  final dynamic position;
  final dynamic videoId;
  final dynamic videoOwnerChannelTitle;
  final dynamic videoOwnerChannelId;

  TacticalZone({
     this.publishedAt,
     this.channelId,
     this.title,
    this.description , // La description peut être vide par défaut
     this.thumbnails,
     this.channelTitle,
     this.playlistId,
     this.position,
     this.videoId,
     this.videoOwnerChannelTitle,
     this.videoOwnerChannelId,
  });

  factory TacticalZone.fromJson(Map<String, dynamic> json) {
    return TacticalZone(
      publishedAt: json['publishedAt'] as dynamic?,
      channelId: json['channelId'] as dynamic?,
      title: json['title'] as dynamic?,
      description: json['description'] as dynamic? ?? "", // Provide a default empty string if null
      thumbnails: json['thumbnails'] as Map<String, dynamic>?,
      channelTitle: json['channelTitle'] as dynamic?,
      playlistId: json['playlistId'] as dynamic?,
      position: json['position'] as int?,
      videoId: json['resourceId'] != null ? json['resourceId']['videoId'] as dynamic? : null,
      videoOwnerChannelTitle: json['videoOwnerChannelTitle'] as dynamic?,
      videoOwnerChannelId: json['videoOwnerChannelId'] as dynamic?,
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
