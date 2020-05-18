import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:navrail/page/feed.dart';
import 'package:navrail/page/live.dart';
import 'package:navrail/page/notification.dart';
import 'package:navrail/page/setting.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  bool _isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 960.0;
  }

  bool _isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 640.0;
  }

  @override
  Widget build(BuildContext context) {
    // large screen
    if (_isLargeScreen(context)) {
      return Scaffold(
        appBar: AppBar(title: Text("Example")),
        body: Row(
          children: <Widget>[
            NavigationRail(
              extended: true,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.rss_feed),
                  label: Text("Feed"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.live_tv),
                  label: Text("Live"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.alarm),
                  label: Text("Notification"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text("Settings"),
                ),
              ],
              selectedIndex: _currentIndex,
              onDestinationSelected: (index) {
                if (mounted) {
                  setState(() {
                    _currentIndex = index;
                  });
                }
              },
            ),
            VerticalDivider(
              width: 1,
              thickness: 1,
              color: Colors.grey[300],
            ),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: <Widget>[
                  FeedPage(),
                  LivePage(),
                  NotificationPage(),
                  SettingPage()
                ],
              ),
            ),
          ],
        ),
      );
    }

    // medium screen
    if (_isMediumScreen(context)) {
      return Scaffold(
        appBar: AppBar(title: Text("Example")),
        body: Row(
          children: <Widget>[
            NavigationRail(
              labelType: NavigationRailLabelType.selected,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.rss_feed),
                  label: Text("Feed"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.live_tv),
                  label: Text("Live"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.alarm),
                  label: Text("Notification"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text("Settings"),
                ),
              ],
              selectedIndex: _currentIndex,
              onDestinationSelected: (index) {
                if (mounted) {
                  setState(() {
                    _currentIndex = index;
                  });
                }
              },
            ),
            VerticalDivider(
              width: 1,
              thickness: 1,
              color: Colors.grey[300],
            ),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: <Widget>[
                  FeedPage(),
                  LivePage(),
                  NotificationPage(),
                  SettingPage()
                ],
              ),
            ),
          ],
        ),
      );
    }

    // small screen
    return Scaffold(
      appBar: AppBar(title: Text("Example")),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          FeedPage(),
          LivePage(),
          NotificationPage(),
          SettingPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            title: Text("Feed"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            title: Text("Live"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            title: Text("Notification"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
        selectedItemColor: ThemeData.light().accentColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (mounted) {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }
}
