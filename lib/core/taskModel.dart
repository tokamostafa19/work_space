class TaskDataModel {
  String? id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;
  String? userId;

  TaskDataModel({
    this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    this.isDone = false,
     this.userId,

  });

  factory TaskDataModel.fromJson(Map<String, dynamic> json) {
    return TaskDataModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      dateTime: json['dateTime'] != null
          ? DateTime.parse(json['dateTime'])
          : DateTime.now(),
      isDone: json['isDone'] ?? false,
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      'title': title,
      'description': description,
      'dateTime': dateTime.toIso8601String(),
      'isDone': isDone,
      'userId': userId,
    };
  }
}