class User_account {
  int id;
  String gender;
  String name;
  String univirsity;
  String major;
  String birthday;
  String image;
  String traning_hours;
  String date_of_traning;
  String created_at;
  String updated_at;
  String trainer_no;
  String emial;
  String password;
  String total_used;
  String total_remining_hours;
  String phone;
  String identity;
  String type_of_training;
  String supervisor;
  String relationship_status;
  String age;

  User_account({
    this.id,
    this.name,
    this.univirsity,
    this.major,
    this.gender,
    this.birthday,
    this.image,
    this.traning_hours,
    this.date_of_traning,
    this.created_at,
    this.updated_at,
    this.trainer_no,
    this.emial,
    this.password,
    this.total_used,
    this.total_remining_hours,
    this.phone,
    this.identity,
    this.type_of_training,
    this.supervisor,
    this.relationship_status,
    this.age,
  });

  factory User_account.fromJson(dynamic json) {
    return User_account(
      id: json['id'],
      name: json['name'],
      univirsity: json['univirsity'],
      major: json['major'],
      gender: json['gender'],
      birthday: json['birthday'],
      image: "meme",
      traning_hours: json['traning_hours'],
      date_of_traning: json['date_of_traning'],
      created_at: json['created_at'],
      updated_at: json["updated_at"],
      trainer_no: json["trainer_no"],
      emial: json['emial'],
      password: json['password'],
      total_used: json['total_used'],
      total_remining_hours: json['total_remining_hours'],
      phone: json['phone'] == null ? '-' : json['phone'],
      identity: json['identity'],
      type_of_training: json['type_of_training'],
      supervisor: json['supervisor'],
      relationship_status: json['relationship_status'],
      age: json['age'],
    );
  }
}
