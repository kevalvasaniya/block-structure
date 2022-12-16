/// Send PushNotification Model Class
class NotificationModel{
  String? message;
  String? notificationType;

  NotificationModel({
    this.message,
    this.notificationType
  });

  factory NotificationModel.fromJson(Map<String, dynamic> parsedJson) {
    return NotificationModel(
      message: parsedJson['message'] ?? "",
      notificationType: parsedJson['notificationType'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "notificationType": notificationType,
    };
  }
}

class NotificationObject{
  static NotificationModel notificationInfo = NotificationModel();
  static String? strBody;
}

