import 'dart:convert';
import 'package:bloc_project_structure/model/notification_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

Future<void> showNotification(String deviceToken, String notificationMessage, String notificationType) async {

  var token = await FirebaseMessaging.instance.getToken();

  var serverKey = "";
  var projectId = "";
  try {
    NotificationModel _body = NotificationModel();
    _body.message = notificationMessage;
    _body.notificationType = notificationType;

    NotificationObject.strBody = jsonEncode(_body);
    var strGetNotificationInfo = NotificationObject.strBody;
    Map<String, dynamic> json = jsonDecode(strGetNotificationInfo!);
    NotificationObject.notificationInfo = NotificationModel.fromJson(json);

    dynamic response = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'key=$serverKey',
        'project_id': projectId,
      },

      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body':  NotificationObject.notificationInfo.message,
            'title': 'GoKar',
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK $notificationType',
            'id': '1',
            'status': 'done'
          },
          'to': deviceToken
        },
      ),
    );
    print(response.data.toString());
  } catch (e) {
    print("error push notification");
    print(e.toString());
  }
}