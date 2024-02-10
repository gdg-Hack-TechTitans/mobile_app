import 'package:event_manager/view/home.dart';
import 'package:event_manager/view/lost_things_page.dart';
import 'package:event_manager/view/montors_notifications.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../main.dart';
import 'mentors.dart';

class AppMainPage extends StatefulWidget {
  const AppMainPage({Key? key}) : super(key: key);

  @override
  _AppMainPageState createState() => _AppMainPageState();
}

class _AppMainPageState extends State<AppMainPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 16,
              right: 0,
              bottom: 100,
              top: 16,
              child: IndexedStack(
                index: _index,
                children:  [
                  Home(),
                  LostThings(),
                  (prefs!.getString("userType") == 'monter') ? Mentors() :MentorsNotification(),
                  // NewsAppHomePage(),
                  // NewsAppListPage(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _index = 0;
                          });
                        },
                        icon: const Icon(Ionicons.home_outline),
                        color: _index == 0 ? Colors.white : Colors.grey,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _index = 1;
                          });
                        },
                        icon: const Icon(Ionicons.list_outline),
                        color: _index == 1 ? Colors.white : Colors.grey,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _index = 2;
                          });
                        },
                        icon: const Icon(Ionicons.person),
                        color: _index == 2 ? Colors.white : Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}