import 'package:flutter/material.dart';
import 'package:todo_app/screens/calendar_screen.dart';
import 'package:todo_app/screens/todo_list_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': ToDoListScreen(),
        'title': 'List View',
      },
      {
        'page': CalendarScreen(),
        'title': 'Calendar View',
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
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Container(),
          ),
        ],
      ),
    );
  }
}
