// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remora/base/base_widget.dart';
import 'package:remora/pages/chat/messagesView.dart';
import 'package:remora/pages/home/home.dart';
import 'package:remora/pages/profile/profileView.dart';

class MainRoutePages extends BaseWidget {
  const MainRoutePages({Key? key}) : super(key: key);

  @override
  BaseWidgetState getState() {
    return _MainRoutePagesState();
  }
}

class _MainRoutePagesState extends BaseWidgetState<MainRoutePages> {
  final _messagesView = const MessagesView();
  final _homeView = const Home();
  //ContactView();
  final _profile = const ProfileView();
  Widget __showPage = const Home();
  int _selectedIndex = 0;

  Widget _choosePage(int page) {
    switch (page) {
      case 0:
        return _messagesView;
      case 1:
        return _homeView;
      case 2:
        return _profile;
      default:
        return const Center(
          child: Text('No page found'),
        );
    }
  }

  void onTapPage(int index) {
    setState(() {
      _selectedIndex = index;
      __showPage = _choosePage(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: __showPage,
      bottomNavigationBar: GestureDetector(
        child: BottomNavigationBar(
          backgroundColor: bc(),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: FaIcon(
                  _selectedIndex == 0
                      ? FontAwesomeIcons.solidComment
                      : FontAwesomeIcons.comment,
                ),
                label: "Chats"),
            BottomNavigationBarItem(
                icon: FaIcon(
                  _selectedIndex == 1
                      ? FontAwesomeIcons.homeAlt
                      : FontAwesomeIcons.home,
                  //    color: bc(),
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: FaIcon(
                  _selectedIndex == 2
                      ? FontAwesomeIcons.userAlt
                      : FontAwesomeIcons.user,
                  //  color: bc(),
                ),
                label: "ME"),
          ],
          currentIndex: _selectedIndex,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          onTap: onTapPage,
          selectedItemColor: pc(),
        ),
        onTap: () {
          // closeOverlay();
        },
      ),
    );
  }
}
