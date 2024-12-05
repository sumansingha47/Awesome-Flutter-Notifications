import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications_flutter_24/notification_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(),

            //BASIC NOTIFICATION
            ElevatedButton.icon(
              onPressed: () async {
                await showNotification(
                  title: "Basic Notification",
                  body: "This is a Basic Notification",
                );
              },
              label: Text("Default Notification"),
            ),

            // SUMMARY NOTIFICATION
            ElevatedButton.icon(
              onPressed: () async {
                await showNotification(
                  title: "Summary Notification",
                  body: "This is a Summary Notification",
                  summary: "This is Basic Summary",
                  notificationLayout: NotificationLayout.Inbox,
                );
              },
              label: Text("Notification with Summary"),
            ),

            // BIG PICTURE NOTIFICATION
            ElevatedButton.icon(
              onPressed: () async {
                await showNotification(
                  title: "BigPicture Notification",
                  body: "This is a BigPicture Notification",
                  summary: "This is Basic Summary",
                  notificationLayout: NotificationLayout.BigPicture,
                  bigPicture:
                      "https://firebasestorage.googleapis.com/v0/b/clone-fcc-2024.appspot.com/o/image%2Fd1866f7a-0d16-4c74-ad16-7f5c92b0ac18?alt=media&token=660caa26-c442-43f9-b9ed-b53b7e49e1c6",
                );
              },
              label: Text("BigPictue Notification"),
            ),

            // ACTION BUTTON NOTIFICATION
            ElevatedButton.icon(
              onPressed: () async {
                await showNotification(
                  title: "Action Button Notification",
                  body: "This is a Action Button Notification",
                  payload: {
                    "navigate": "true",
                  },
                  actionButtons: [
                    NotificationActionButton(
                      key: 'landing',
                      label: 'Call now',
                      actionType: ActionType.SilentAction,
                      color: Colors.deepPurple,
                    ),
                  ],
                );
              },
              label: Text("Action Button Notification"),
            ),

            //BIG TEXT NOTIFICATION
            ElevatedButton.icon(
              onPressed: () async {
                await showNotification(
                  title: "Big Text Notification",
                  body: "This is Big Text",
                  notificationLayout: NotificationLayout.BigText,
                );
              },
              label: Text("BigText Notification"),
            ),

            //PROGRESS BAR NOTIFICATION
            ElevatedButton.icon(
              onPressed: () async {
                await showNotification(
                  title: "Song Downloading",
                  body: "Please wait",
                  notificationLayout: NotificationLayout.ProgressBar,
                );
              },
              label: Text("ProgressBar Notification"),
            ),

            //MESSAGING NOTIFICATION
            ElevatedButton.icon(
              onPressed: () async {
                await showNotification(
                  title: "Nitish Kumar",
                  body: "Hello what are you doing",
                  notificationLayout: NotificationLayout.Messaging,
                );
              },
              label: Text("Messaging Notification"),
            ),

            //GROUP MESSAGING NOTIFICATION
            ElevatedButton.icon(
              onPressed: () async {
                await showNotification(
                  title: "Nitish Kumar",
                  body: "Hello what are you doing",
                  notificationLayout: NotificationLayout.MessagingGroup,
                );
              },
              label: Text("Group Messaging Notification"),
            ),

            //MEDIA PLAYER NOTIFICATION
            ElevatedButton.icon(
              onPressed: () async {
                await showNotification(
                  title: "New song playing",
                  body: "Arijit Singh",
                  notificationLayout: NotificationLayout.MediaPlayer,
                );
              },
              label: Text("MediaPlayer Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
