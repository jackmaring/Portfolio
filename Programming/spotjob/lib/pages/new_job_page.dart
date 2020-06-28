import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spotjob/providers/job.dart';
import 'package:spotjob/providers/crud_models/job_crud_model.dart';
import 'package:spotjob/widgets/new_job_page_widgets/raised_blue_button_white_text.dart';
import '../widgets/new_job_page_widgets/add_job_description.dart';
import '../widgets/new_job_page_widgets/add_job_duration.dart';
import '../widgets/new_job_page_widgets/add_job_location.dart';
import '../widgets/new_job_page_widgets/add_job_price.dart';
import '../widgets/new_job_page_widgets/add_job_requirements.dart';
import '../widgets/new_job_page_widgets/add_job_tags.dart';
import '../widgets/new_job_page_widgets/add_job_title.dart';

class NewJobPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    final jobCrud = Provider.of<JobCRUD>(context);
    final job = Provider.of<CreateJob>(context);
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
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: RaisedBlueButtonWhiteText(
                  'Add Job',
                  () {
                    jobCrud.addJob(
                      Job(
                        uid: user.uid,
                        title: job.titleText,
                        payType: job.price,
                        description: job.descText,
                        requirements: job.requirements,
                        tags: job.tags,
                      ),
                    );
                    job.resetCreateJobStats();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
