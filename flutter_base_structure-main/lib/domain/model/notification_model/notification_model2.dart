class NotificationModel2 {
  final String id;
  final String title;
  final String content;
  final String type; // VD: "Tặng voucher", "Sự kiện", "Tin tức"
  final String timeAgo; // VD: "Vừa xong", "3 ngày"
  final String? tagColor; // Màu của tag (nếu có)

  NotificationModel2({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.timeAgo,
    this.tagColor,
  });

  factory NotificationModel2.fromJson(Map<String, dynamic> json) {
    return NotificationModel2(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      type: json['type'] ?? '',
      timeAgo: json['time_ago'] ?? '',
      tagColor: json['tag_color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'content': content,
      'type': type,
      'time_ago': timeAgo,
      'tag_color': tagColor,
    };
  }
}
