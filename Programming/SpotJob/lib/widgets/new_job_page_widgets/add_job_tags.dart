import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotjob/providers/job.dart';

import 'package:spotjob/widgets/new_job_page_widgets/raised_blue_button_white_text.dart';
import '../profile_page_widgets/skills_grid.dart';

class AddJobTags extends StatefulWidget {
  @override
  _AddJobTagsState createState() => _AddJobTagsState();
}

class _AddJobTagsState extends State<AddJobTags> {
  String _text;
  TextEditingController _c = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final job = Provider.of<CreateJob>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Tags:',
          style: Theme.of(context).textTheme.title,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8),
          child: SkillsGrid(job.tags),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 20, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RaisedBlueButtonWhiteText(
                'Add',
                () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration:
                                InputDecoration(hintText: "Update Info"),
                            controller: _c,
                          ),
                          FlatButton(
                            child: Text("Save"),
                            onPressed: () {
                              setState(() {
                                _text = _c.text;
                                job.addTag(_text);
                                _c.text = '';
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
