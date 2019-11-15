import 'user.dart';

class UserDB{
  List<User> users;

  UserDB({this.users});

  List getUsers(){
      return this.users;
  }

  User getUserById(int id){
    for(User user in users){
      if (user.id == id) return user;
    }
    return null;
  }

  User getUserByUserName(String userName){
    for(User user in users){
      if (user.userName == userName) return user;
    }
    return null;
  }

}