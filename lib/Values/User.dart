class User {
  int? user_id;
  String user_name;
  String password;
  User({this.user_id, required this.user_name, required this.password});


  int? getUserId(){
    return user_id;
  }

  void setUserId(int user_id){
    this.user_id = user_id;
  }

  String getUserName(){
    return user_name;
  }

  void setUserName(String user_name){
    this.user_name = user_name;
  }

  String getPassword(){
    return password;
  }

  void setPassword(String password){
    this.password = password;
  }

  User.fromMap(Map<String, dynamic> res)
      : user_id = res["user_id"],
        user_name = res["user_name"],
        password = res["password"];

  Map<String, Object?> toMap() {
    return {'user_id':user_id,'user_name': user_name, 'password': password};
  }
}