class User {
  final int id;
  final String lastname;
  final String firstname;
  final String email;
  final String? emailVerifiedAt;
  final String phone;
  final String npi;
  final String image;
  final int sexe;
  final int roleId;
  final int activityId;
  final int cityId;
  final String createdAt;
  final String updatedAt;
  final String token;
  final String? imgUrl;

  User(
      {required this.id,
      required this.lastname,
      required this.firstname,
      required this.email,
      this.emailVerifiedAt,
      required this.phone,
      required this.npi,
      required this.image,
      required this.sexe,
      required this.roleId,
      required this.activityId,
      required this.cityId,
      required this.createdAt,
      required this.updatedAt,
      required this.token,
      required this.imgUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        lastname: json['lastname'],
        firstname: json['firstname'],
        email: json['email'],
        emailVerifiedAt: json['email_verified_at'],
        phone: json['phone'],
        npi: json['npi'],
        image: json['image'] ?? "",
        sexe: json['sexe'],
        roleId: json['role_id'],
        activityId: json['activity_id'] ?? 0,
        cityId: json['city_id'] ?? 0,
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        token: json['token'],
        imgUrl: json['img_url'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lastname': lastname,
      'firstname': firstname,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'phone': phone,
      'npi': npi,
      'image': image,
      'sexe': sexe,
      'role_id': roleId,
      'activity_id': activityId,
      'city_id': cityId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'token': token
    };
  }
}
