class SignUpResponseBody {
  SignUpResponseBody({
      this.msg,});

  SignUpResponseBody.fromJson(dynamic json) {
    msg = json['Msg'];
  }
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Msg'] = msg;
    return map;
  }

}