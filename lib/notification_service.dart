import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Notification Permission Granted');
    } else {
      print('Notification Permission Denied');
    }

    String? token = await _messaging.getToken();
    print('📱 FCM Token: $token');
    if (token != null) {
      await saveTokenToFirestore(token);
    }

    _messaging.onTokenRefresh.listen(saveTokenToFirestore);
  }

  Future<void> saveTokenToFirestore(String token) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    await FirebaseFirestore.instance.collection('tasks').doc(user.uid).set({
      'fcmToken': token,
    }, SetOptions(merge: true));

    print('Token saved to Firestore for user ${user.uid}');
  }

  void setupMessageListeners() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('📩 Foreground message received:');
      print('   Title: ${message.notification?.title}');
      print('   Body: ${message.notification?.body}');
      print('   Data: ${message.data}');
      // TODO: show a SnackBar, update a badge count, refresh a stream, etc.
    });

    // App was in BACKGROUND, user tapped the notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('👉 Opened app from background notification tap');
      print('   Data: ${message.data}');
      // TODO: navigate to a specific screen using message.data
    });

    // App was TERMINATED, user tapped the notification to launch it
    _messaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        print('🚀 App launched from terminated state via notification');
        print('   Data: ${message.data}');
        // TODO: navigate to a specific screen using message.data
      }
    });
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('🔕 Background message handler triggered: ${message.messageId}');
}
