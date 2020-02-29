import 'package:flutter/material.dart';
import 'package:gradient_bottom_navigation_bar/gradient_bottom_navigation_bar.dart';

import 'package:spotjob/pages/homepage.dart';
import 'package:spotjob/pages/job_lists_page.dart';
import 'package:spotjob/pages/new_job_page.dart';
import 'package:spotjob/pages/search_page.dart';
import 'package:spotjob/pages/settings_page.dart';
import '../widgets/homepage_widgets/bottombar_appbar.dart';

class TabsPage extends StatefulWidget {
  static const routeName = '/tabs-page';

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': HomePage(),
        'title': '',
      },
      {
        'page': JobListsPage(),
        'title': 'Jobs Lists',
      },
      {
        'page': NewJobPage(),
        'title': 'Create Job',
      },
      {
        'page': SearchPage(),
        'title': 'Search',
      },
      {
        'page': SettingsPage(),
        'title': 'Settings',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BottombarAppbar(
        _pages[_selectedPageIndex]['title'],
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: GradientBottomNavigationBar(
        onTap: _selectPage,
        type: BottomNavigationBarType.fixed,
        backgroundColorStart: Theme.of(context).accentColor,
        backgroundColorEnd: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.build,
              size: 30,
              color: Colors.white,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              size: 30,
              color: Colors.white,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30,
              color: Colors.white,
            ),
            title: Container(),
          ),
        ],
      ),
    );
  }
}
