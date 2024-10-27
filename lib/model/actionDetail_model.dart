class ActionDetail {
  String team;
  String player;
  String event;
  double x;
  double y;

  ActionDetail({
    required this.team,
    required this.player,
    required this.event,
    required this.x,
    required this.y,
  });
   List<String> toCsvRow() {
    return [
      team,
      player,
      event,
      x.toStringAsFixed(2),
      y.toStringAsFixed(2),
    ];
  }
}
