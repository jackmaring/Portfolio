class User {
  String id;
  String uid;
  String email;
  String username;
  String name;
  String displayedEmail;
  int jobsCompleted;
  int jobsPosted;
  List<Map<String, String>> certifications;
  List<String> skills;

  User({
    this.id,
    this.uid,
    this.email,
    this.username,
    this.name,
    this.displayedEmail,
    this.jobsCompleted,
    this.jobsPosted,
    this.certifications,
    this.skills,
  });

  User.fromMap(Map<String, dynamic> data)
      : this(
          id: data['id'] ?? '',
          uid: data['uid'] ?? '',
          email: data['email'] ?? '',
          username: data['username'] ?? '',
          name: data['name'] ?? '',
          displayedEmail: data['displayedEmail'] ?? '',
          jobsCompleted: data['jobsCompleted'] ?? 0,
          jobsPosted: data['jobsPosted'] ?? 0,
          certifications: data['certifications'] ?? [],
          skills: data['skills'] ?? [],
        );

  Map<String, dynamic> toMap() => {
        'id': id ?? '',
        'uid': uid ?? '',
        'email': email ?? '',
        'username': username ?? '',
        'name': name ?? '',
        'displayedEmail': displayedEmail ?? '',
        'jobsCompleted': jobsCompleted ?? 0,
        'jobsPosted': jobsPosted ?? 0,
        'certifications': certifications ?? [],
        'skills': skills ?? [],
      };
}
