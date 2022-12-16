import 'package:bloc_project_structure/model/notification_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationServices{
  var notificationType = '';
  void initMethod(){
    /// This method call when app is working in application to open from.
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Dashboard Notification onMessage");
      RemoteNotification? notification = message.notification;
      notificationType = message.data['click_action'].toString().split(" ").last;
      NotificationObject.notificationInfo.notificationType = notificationType;
    });


    /// This method call when app is working in background.
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      notificationType = message.data['click_action'].toString().split(" ").last;
      RemoteNotification? notification = message.notification;
      if (notification != null ) {
        print("Dashboard Notification onMessageOpenedApp");
      }
    });


    /// This method call when app is killed(Terminated).
    killAppNotificationFunction();
  }

  /// Kill(Terminated) app function.
  killAppNotificationFunction() async {
    RemoteMessage? terminatedMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (terminatedMessage != null) {
      // this is a function I created to route to a page
      processKillAppPushNotification(message: terminatedMessage);
    }
  }

  void processKillAppPushNotification({RemoteMessage? message}) async {
    // var notificationType;
    print("Dashboard Notification processKillAppPushNotification");

    RemoteNotification? notification = message!.notification;
    notificationType = message.data['click_action'].toString().split(" ").last;
    if (notification != null) {

    }
  }
}