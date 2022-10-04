import 'dart:math';

import 'package:chat_app/components/messages.dart';
import 'package:chat_app/components/new_message.dart';
import 'package:chat_app/core/models/chat_notification.dart';
import 'package:chat_app/core/services/auth/auth_service.dart';
import 'package:chat_app/pages/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/services/notification/chat_notification_service.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 10),
                        Text('Sair'),
                      ],
                    ),
                  ),
                ),
              ],
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              onChanged: (value) {
                if (value == 'logout') {
                  AuthService().logout();
                }
              },
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return NotificationPage();
                    }),
                  );
                },
                icon: Icon(Icons.notifications),
              ),
              Positioned(
                top: 7,
                right: 9,
                child: CircleAvatar(
                  maxRadius: 7,
                  backgroundColor: Colors.red.shade800,
                  child: Text(
                    '${Provider.of<ChatNotificationService>(context).itemCount}',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
