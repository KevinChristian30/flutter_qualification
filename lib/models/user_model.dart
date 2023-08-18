class User {
  String email;
  String password;

  User(this.email, this.password);

  static List<User> users = [
    User('kevin@gmail.com', 'kevin123'),
    User('jose@gmail.com', 'jose123'),
    User('bryant@gmail.com', 'bryant123'),
  ];

  static bool isValidCredentials(String email, String password) {
    for (User user in users) {
      if (user.email == email && user.password == password) {
        return true;
      }
    }
    
    return false;
  }
}