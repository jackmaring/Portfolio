import 'package:flutter/material.dart';

enum PayType {
  oneTime,
  perHour,
}

enum LocationType {
  remote,
  locationBased,
}

class Job {
  String id;
  String uid;
  String title;
  String description;
  String payType;
  String locationType;
  List<String> requirements;
  List<String> tags;

  Job({
    this.id,
    this.uid,
    this.title,
    this.payType,
    this.locationType,
    this.description,
    this.requirements,
    this.tags,
  });

  Job.fromMap(Map<String, dynamic> data)
      : this(
          id: data['id'],
          uid: data['uid'],
          title: data['title'],
          description: data['description'],
          payType: data['payType'],
          locationType: data['locationType'],
          requirements: data['requirements'],
          tags: data['tags'],
        );

  Map<String, dynamic> toMap() => {
        'id': id,
        'uid': uid,
        'title': title,
        'payType': payType,
        'locationType': locationType,
        'description': description,
        'requirements': requirements,
        'tags': tags,
      };
}

class CreateJob with ChangeNotifier {
  String titleText = '';
  String descText = '';
  String price = '';
  List<String> requirements = [];
  List<String> tags = [];

  void addRequirement(String requirement) {
    requirements.add(requirement);
    notifyListeners();
  }

  void addTag(String tag) {
    tags.add(tag);
    notifyListeners();
  }


  void resetCreateJobStats() {
    titleText = '';
    descText = '';
    price = '';
    requirements = [];
    tags = [];
    notifyListeners();
  }

}
