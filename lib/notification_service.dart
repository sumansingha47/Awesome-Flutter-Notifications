import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications_flutter_24/landing_page.dart';
import 'package:awesome_notifications_flutter_24/main.dart';
import 'package:flutter/material.dart';

Future<void> initializeNotification() async {
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelGroupKey: 'high_importance_channel',
        channelKey: 'high_importance_channel',
        channelName: 'Basic Notification',
        channelDescription: 'Notification channel for basic task',
        defaultColor: Colors.deepPurple,
        ledColor: Colors.red,
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        onlyAlertOnce: true,
        playSound: true,
        criticalAlerts: true,
      ),
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: 'high_importance_channel_group',
        channelGroupName: 'Group 1',
      ),
    ],
    debug: true,
  );

  await AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  await AwesomeNotifications().setListeners(
    onActionReceivedMethod: onActionReceivedMethod,
    onNotificationCreatedMethod: onNotificationCreatedMethod,
    onNotificationDisplayedMethod: onNotificationDisplayedMethod,
    onDismissActionReceivedMethod: onDismissActionReceivedMethod,
  );
}

//Notification Event
Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
  debugPrint("On Action Received");
  final payload = receivedAction.payload ?? {};
  if (payload['navigate'] == "true") {
    MyApp.navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => LandingPage(),
      ),
    );
  }
}

Future<void> onNotificationCreatedMethod(
    ReceivedNotification notification) async {
  debugPrint("On Notification Created Method");
}

Future<void> onNotificationDisplayedMethod(
    ReceivedNotification notification) async {
  debugPrint("On Notification Displayed");
}

Future<void> onDismissActionReceivedMethod(
    ReceivedAction receivedAction) async {
  debugPrint("On Notification Received");
}

//Now Show Notification Method
Future<void> showNotification({
  required final String title,
  required final String body,
  final String? summary,
  final Map<String, String>? payload,
  final ActionType actionType = ActionType.Default,
  final NotificationLayout notificationLayout = NotificationLayout.Default,
  final NotificationCategory? category,
  final String? bigPicture,
  final List<NotificationActionButton>? actionButtons,
  final bool scheduled = false,
  final int? interval,
}) async {
  assert(!scheduled || (scheduled && interval != null));
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: -1,
      channelKey: 'high_importance_channel',
      title: title,
      body: body,
      actionType: actionType,
      notificationLayout: notificationLayout,
      summary: summary,
      category: category,
      payload: payload,
      bigPicture: bigPicture,
    ),
    actionButtons: actionButtons,
    schedule: scheduled
        ? NotificationInterval(
            // interval: Duration(seconds: interval!),
            interval: interval,
            timeZone: await AwesomeNotifications.localTimeZoneIdentifier,
            preciseAlarm: true,
          )
        : null,
  );
}
