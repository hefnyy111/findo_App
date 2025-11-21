// features/auth/services/notification_service.dart
import 'dart:typed_data'; // Uint8List
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http; 

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  // ******************************* Initilization
  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

     // ***** Foreground notifications *****
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotification(message);
      print("🔥 OTP received: ${message.data['otp']}");
    });

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }


  // ******************************* Show Notification
  Future<void> _showNotification(RemoteMessage message) async {
  final String imageURL = "https://a.top4top.io/p_3612io7gp1.png";
  final Uri url = Uri.parse(imageURL);
  final http.Response response = await http.get(url); // استخدم http.get
  final Uint8List bytes = response.bodyBytes; // بيانات الصورة على شكل مصفوفة بايت جاهزة للاستخدام في الإشعار.
    
    final AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'otp_channel', // معرف القناة
      'OTP Notifications', // اسم القناة اللي بيظهر في إعدادات الهاتف
      channelDescription: 'Channel for OTP notifications',
      importance: Importance.max, // أعلى أولوية للإشعار (يظهر فوق أي إشعار آخر).
      priority: Priority.high, // يظهر فورًا.
      largeIcon: ByteArrayAndroidBitmap(bytes), // الصورة الدائرية على يمين الإشعار.
    );

    // إعداد NotificationDetails
    final NotificationDetails platformDetails =  NotificationDetails(android: androidDetails); 

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'OTP',
      message.notification?.body ?? message.data['otp'] ?? '',
      platformDetails,
    );
  }
}
