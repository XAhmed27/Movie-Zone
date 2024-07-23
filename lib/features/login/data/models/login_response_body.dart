class LoginResponseBody {
  LoginResponseBody({
      this.token, 
      this.msg,});

  LoginResponseBody.fromJson(dynamic json) {
    token = json['token'];
    msg = json['Msg'];
  }
  String? token;
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['Msg'] = msg;
    return map;
  }

}