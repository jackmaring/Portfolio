import 'package:flutter/material.dart';

import 'education_list.dart';
import 'skills_grid.dart';

class BlueGradientBoxWithLists extends StatelessWidget {
  final skills = [
    'Communication',
    'Coding',
    'Flutter',
    'People',
    'Focused',
    'I go hard',
    'Yo yo enthusiast',
    'Communication',
    'Coding',
    'Flutter',
    'People',
    'Focused',
    'I go hard',
    'Yo yo enthusiast',
  ];

  final TextStyle listHeader = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 22,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 32),
        padding: EdgeInsets.only(top: 32),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor,
            ],
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Education/Certifications:',
                style: listHeader,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 24,
                ),
                child: EducationList(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                ),
                child: Text(
                  'Skills:',
                  style: listHeader,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 24,
                ),
                child: SkillsGrid(skills),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
