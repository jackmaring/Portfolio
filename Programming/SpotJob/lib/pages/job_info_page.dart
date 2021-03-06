import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:spotjob/widgets/homepage_widgets/scrollable_job_list.dart';

import '../widgets/profile_page_widgets/skills_grid.dart';

class JobInfoPage extends StatelessWidget {
  static const routeName = '/job-info';

  final String username;
  final String jobTitle;
  final String description;
  final String price;
  final String name;
  // final List<String> requirements;
  // final List<String> tags;

  JobInfoPage(
    this.username,
    this.jobTitle,
    this.description,
    this.price,
    this.name,
    // this.requirements,
    // this.tags,
  );

  final TextStyle listHeader = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 22,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Theme.of(context).accentColor,
        backgroundColorEnd: Theme.of(context).primaryColor,
        title: Text(
          '$username\'s Spotjob',
          style: Theme.of(context).textTheme.title.merge(
                TextStyle(
                  color: Colors.white,
                ),
              ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: () {},
            color: Colors.white,
            iconSize: 30,
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            // width: double.infinity,
            height: 1325,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor,
                ],
              ),
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 625,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 8.0),
                              //   child: Text(
                              //     'Posted: Jan 1 2019',
                              //     style: Theme.of(context).textTheme.body1,
                              //   ),
                              // ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32.0),
                            child: Text(
                              '$jobTitle',
                              style: Theme.of(context).textTheme.display1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              '\$$price',
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Image.asset(
                              'assets/images/circleprofilepic.jpeg',
                              height: 200,
                              width: 200,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              '$name',
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                              left: 8,
                              right: 8,
                            ),
                            child: Text(
                              '$description',
                              style: Theme.of(context).textTheme.body1.merge(
                                    TextStyle(
                                      height: 1.15,
                                    ),
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'Duration:',
                                      style: Theme.of(context).textTheme.title,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Card(
                                        elevation: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Start Date: Nov 10',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .body1,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                'End Date: TBD',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .body1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'Location:',
                                      style: Theme.of(context).textTheme.title,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Card(
                                        elevation: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Type: Location Based',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .body1,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                'Address: 21 8th St N',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .body1,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 600,
                      left: 125,
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 32,
                          ),
                          child: Text(
                            'Apply',
                            style: Theme.of(context).textTheme.title.merge(
                                  TextStyle(color: Colors.white),
                                ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 700,
                  padding: EdgeInsets.only(left: 32, top: 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Requirements/Special Notes:',
                        style: listHeader,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 24.0,
                          right: 16,
                          left: 16,
                        ),
                        // child: ListView.builder(
                        //   itemCount: requirements.length,
                        //   itemBuilder: (context, index) {
                        //     return Card(
                        //       elevation: 3,
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(16.0),
                        //         child: Text(
                        //           '${requirements[index]}',
                        //           style:
                        //               Theme.of(context).textTheme.body1.merge(
                        //                     TextStyle(
                        //                       height: 1.15,
                        //                     ),
                        //                   ),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 32,
                        ),
                        child: Text(
                          'Tags:',
                          style: listHeader,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 24,
                        ),
                        // child: SkillsGrid(tags),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
