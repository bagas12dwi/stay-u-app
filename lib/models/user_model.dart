class User{
  final int? id;
  final String? nama;
  final int? level;
  final String email;
  final String password;

  User({this.id, this.nama,this.level, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        email: json['email'],
        password: json['password'],
        nama: json['nama'],
        level: json['level'],
        id: json['id']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'level': level,
      'email': email,
      'password': password,
    };
  }
}