import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

tz.TZDateTime _timeOf8AM() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
      tz.TZDateTime(tz.local, now.year, now.month, now.day, 8);
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  return scheduledDate;
}

tz.TZDateTime _timeOf12AM() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
      tz.TZDateTime(tz.local, now.year, now.month, now.day, 12);
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  return scheduledDate;
}

tz.TZDateTime _timeOf22PM() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
      tz.TZDateTime(tz.local, now.year, now.month, now.day, 20, 25);
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  return scheduledDate;
}

class Notification {
  static Future<void> scheduleMorningNotifications() async {
    // 通知をスケジュールする
    final flnp = FlutterLocalNotificationsPlugin();
    await flnp.zonedSchedule(
      0,
      'Medicine Time',
      'It\'s morning medicine time',
      _timeOf8AM(),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          '1',
          'Schedule Morning',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future<void> scheduleAfternoonNotifications() async {
    // 通知をスケジュールする
    final flnp = FlutterLocalNotificationsPlugin();
    await flnp.zonedSchedule(
      1,
      'Medicine Time',
      'It\'s afternoon medicine time',
      _timeOf12AM(),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          '2',
          'Schedule Afternoon',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future<void> scheduleNightNotifications() async {
    // 通知をスケジュールする
    final flnp = FlutterLocalNotificationsPlugin();
    await flnp.zonedSchedule(
      2,
      'Medicine Time',
      'It\'s night medicine time',
      _timeOf22PM(),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          '3',
          'Schedule Night',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future<void> cancelNotificationsSchedule() async {
    final flnp = FlutterLocalNotificationsPlugin();
    await flnp.cancelAll();
  }
}
