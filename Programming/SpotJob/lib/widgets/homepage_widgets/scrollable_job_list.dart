import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spotjob/pages/job_info_page.dart';
import 'package:spotjob/pages/profile_page.dart';
import 'package:spotjob/providers/crud_models/job_crud_model.dart';
import 'package:spotjob/providers/crud_models/user_crud_model.dart';
import 'package:spotjob/providers/job.dart';
import 'package:spotjob/providers/user.dart';

class ScrollableJobList extends StatefulWidget {
  @override
  _ScrollableJobListState createState() => _ScrollableJobListState();
}

class _ScrollableJobListState extends State<ScrollableJobList> {
  @override
  Widget build(BuildContext context) {
    final userCrud = Provider.of<UserCRUD>(context);
    final jobCrud = Provider.of<JobCRUD>(context);
    List<User> users;

    // Future<List<Job>> getJobs() async {
    //   List<Job> jobs = await jobCrud.fetchJobs();
    //   return jobs;
    // }

    Future getJobs() async {
      var firestore = Firestore.instance;

      QuerySnapshot qn = await firestore.collection('jobs').getDocuments();

      return qn.documents;
    }

    Future getUsers() async {
      var firestore = Firestore.instance;

      QuerySnapshot qn = await firestore.collection('users').getDocuments();

      return qn.documents;
    }

    return FutureBuilder(
      future: getUsers(),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return FutureBuilder(
            future: getJobs(),
            builder: (_, jobSnapshot) {
              if (jobSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: jobSnapshot.data.length,
                  itemBuilder: (_, index) {
                    DocumentSnapshot job = jobSnapshot.data[index];
                    DocumentSnapshot relevantUser;
                    for (DocumentSnapshot user in userSnapshot.data) {
                      if (jobSnapshot.data[index].data['uid'] ==
                          user.data['uid']) {
                        // username = user.data['username'];
                        relevantUser = user;
                      }
                    }
                    return Dismissible(
                      key: ObjectKey(jobSnapshot.data[index]),
                      onDismissed: (direction) {
                        setState(() {
                          jobCrud.removeJob(job.data['id']);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 5,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => JobInfoPage(
                                  relevantUser.data['username'],
                                  job.data['title'],
                                  job.data['desc'],
                                  job.data['payType'],
                                  relevantUser.data['name'],
                                  // job.data['requirements'],
                                  // job.data['tags'],
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(ProfilePage.routeName);
                              },
                              child: Image.asset(
                                  'assets/images/circleprofilepic.jpeg'),
                            ),
                            title: Text(
                              '${job.data['title']}',
                              style: Theme.of(context).textTheme.title,
                            ),
                            subtitle: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(ProfilePage.routeName);
                              },
                              child: Text(
                                relevantUser.data['username'],
                                // 'username',
                                style: Theme.of(context).textTheme.subtitle,
                              ),
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: Text(
                                '\$ ${job.data['payType']}',
                                style: Theme.of(context).textTheme.title,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          );
        }
      },
    );
    // return StreamBuilder(
    //   stream: userCrud.fetchUsersAsStream(),
    //   builder: (context, AsyncSnapshot<QuerySnapshot> userSnapshot) {
    //     if (!userSnapshot.hasData) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     return StreamBuilder(
    //       stream: jobCrud.fetchJobsAsStream(),
    //       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //         final jobs = snapshot.data.documents;
    //         final users = userSnapshot.data.documents;
    //         return ListView.builder(
    //           padding: EdgeInsets.zero,
    //           itemCount: jobs.length,
    //           itemBuilder: (context, index) {
    //             final currentJob = jobs[index];
    //             final currentUser = users
    //                 .where((user) => user.data['uid'] == jobs[index]['uid']);
    //             final username =
    //                 currentUser.map((user) => user.data['username']).toString();
    //             return Dismissible(
    //               key: ObjectKey(jobs[index]),
    //               onDismissed: (direction) {
    //                 jobCrud.removeJob(jobs[index].documentID);
    //               },
    //               child: Container(
    //                 decoration: BoxDecoration(
    //                   border: Border(
    //                     bottom: BorderSide(
    //                       color: Colors.grey,
    //                     ),
    //                   ),
    //                 ),
    //                 margin: EdgeInsets.symmetric(
    //                   vertical: 8,
    //                   horizontal: 5,
    //                 ),
    //                 child: GestureDetector(
    //                   onTap: () {
    //                     Navigator.of(context).pushNamed(JobInfoPage.routeName);
    //                   },
    //                   child: ListTile(
    //                     leading: GestureDetector(
    //                       onTap: () {
    //                         Navigator.of(context)
    //                             .pushNamed(ProfilePage.routeName);
    //                       },
    //                       child: Image.asset(
    //                           'assets/images/circleprofilepic.jpeg'),
    //                     ),
    //                     title: Text(
    //                       '${jobs[index].data['title']}',
    //                       style: Theme.of(context).textTheme.title,
    //                     ),
    //                     subtitle: GestureDetector(
    //                       onTap: () {
    //                         Navigator.of(context)
    //                             .pushNamed(ProfilePage.routeName);
    //                       },
    //                       child: Text(
    //                         username,
    //                         style: Theme.of(context).textTheme.subtitle,
    //                       ),
    //                     ),
    //                     trailing: Padding(
    //                       padding: EdgeInsets.only(right: 40),
    //                       child: Text(
    //                         '\$ ${jobs[index].data['payType']}',
    //                         style: Theme.of(context).textTheme.title,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             );
    //           },
    //         );
    //       },
    //     );
    //   },
    // );
  }
}
