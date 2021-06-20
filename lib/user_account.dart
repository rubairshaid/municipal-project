class User_account{
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

  User_account({this.id, this.name, this.univirsity, this.major, this.gender, this.birthday,
    this.image, this.traning_hours, this.date_of_traning, this.created_at, this.updated_at,
    this.trainer_no ,this.emial, this.password});

  factory User_account.fromJson(dynamic json) {
    return User_account(
      id:json['id'] ,
      name:json['name'] ,
      univirsity: json['univirsity'] ,
      major: json['major'],
      gender: json['gender'],
      birthday: json['birthday'],
      image:"meme",
      traning_hours: json['traning_hours'],
      date_of_traning:json['date_of_traning'] ,
      created_at: json['created_at'],
      updated_at: json["updated_at"],
      trainer_no: json["trainer_no"],
      emial: json['emial'],
      password: json['password'],

    );

  }
}