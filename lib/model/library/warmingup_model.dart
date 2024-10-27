import '../base_model.dart';

class WarmingUp extends BaseModel {
  final dynamic? publishedAt;
  final dynamic? channelId;
  final dynamic? title;
  final dynamic? description;
  final Map<dynamic, dynamic>? thumbnails;
  final dynamic? channelTitle;
  final dynamic? playlistId;
  final dynamic? position;
  final dynamic? videoId;
  final dynamic? videoOwnerChannelTitle;
  final dynamic? videoOwnerChannelId;

  WarmingUp({
     this.publishedAt,
    this.channelId,
     this.title,
     this.description ,
     this.thumbnails,
     this.channelTitle,
     this.playlistId,
     this.position,
     this.videoId,
     this.videoOwnerChannelTitle,
     this.videoOwnerChannelId,
  });

  factory WarmingUp.fromJson(Map<String, dynamic> json) {
    return WarmingUp(
      publishedAt: json['publishedAt'] as dynamic?,
      channelId: json['channelId'] as dynamic?,
      title: json['title'] as dynamic?,
      description: json['description'] as dynamic?,
      thumbnails: json['thumbnails'] as dynamic?,
      channelTitle: json['channelTitle'] as dynamic?,
      playlistId: json['playlistId']as dynamic?,
      position: json['position']as dynamic?,
      videoId: json['resourceId']['videoId']as dynamic?,
      videoOwnerChannelTitle: json['videoOwnerChannelTitle'] as dynamic?,
      videoOwnerChannelId: json['videoOwnerChannelId']as dynamic?,
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
