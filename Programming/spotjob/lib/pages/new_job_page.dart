import 'package:flutter/material.dart';

import '../widgets/new_job_page_widgets/add_job_description.dart';
import '../widgets/new_job_page_widgets/add_job_duration.dart';
import '../widgets/new_job_page_widgets/add_job_location.dart';
import '../widgets/new_job_page_widgets/add_job_price.dart';
import '../widgets/new_job_page_widgets/add_job_requirements.dart';
import '../widgets/new_job_page_widgets/add_job_tags.dart';
import '../widgets/new_job_page_widgets/add_job_title.dart';
import '../widgets/homepage_widgets/bottombar_appbar.dart';

class NewJobPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: AddJobTitle(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: AddJobDescription(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: AddJobPrice(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: AddJobDuration(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: AddJobLocation(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: AddJobRequirements(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: AddJobTags(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
