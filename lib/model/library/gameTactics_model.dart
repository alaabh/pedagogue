import '../base_model.dart';

class GameTactic extends BaseModel {
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

  GameTactic({
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

  factory GameTactic.fromJson(Map<String, dynamic> json) {
    return GameTactic(
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
}

class GameTactics extends BaseModel {
  final List<GameTactic> tactics;

  GameTactics({required this.tactics});

  @override
  Map<String, dynamic> toJson() {
    return {
      'data': tactics.map((v) => v.toJson()).toList(),
    };
  }

  factory GameTactics.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<GameTactic> tacticsList = list.map((i) => GameTactic.fromJson(i)).toList();
    return GameTactics(tactics: tacticsList);
  }
}
