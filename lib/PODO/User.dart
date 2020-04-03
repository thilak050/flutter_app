class User {
  String userName;
  String password;
  String clientCode;

  User({this.userName, this.password, this.clientCode});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    password = json['password'];
    clientCode = json['clientCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['clientCode'] = this.clientCode;
    return data;
  }


}