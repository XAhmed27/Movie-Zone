
class SignUpRequestBody {
  SignUpRequestBody({
      this.name, 
      this.email, 
      this.password, 
      this.cpassword, 
      this.phone,});

  SignUpRequestBody.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    cpassword = json['cpassword'];
    phone = json['phone'];
  }
  String? name;
  String? email;
  String? password;
  String? cpassword;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['cpassword'] = cpassword;
    map['phone'] = phone;
    return map;
  }

}