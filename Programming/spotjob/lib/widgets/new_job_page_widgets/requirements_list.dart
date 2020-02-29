import 'package:flutter/material.dart';

class RequirementsList extends StatelessWidget {
  final List requirements;

  RequirementsList(this.requirements);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: requirements.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              requirements[index],
              style: Theme.of(context).textTheme.body1.merge(
                    TextStyle(
                      height: 1.15,
                    ),
                  ),
            ),
          ),
        );
      },
    );
  }
}
