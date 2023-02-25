
class Winner {
  bool? onHold;
  String? comment;

  Winner(
      {
        this.onHold,
        this.comment});

  Winner.fromJson(Map<String, dynamic> json) {
    onHold = json['on_hold'];
    comment = json['comment'];
  }
}