class CacheData {
  static String email = "";
  static String username = "";
  static String phone = "";
  static int? id;
  void setEmail(String value) {
    CacheData.email = value;
  }

  String getEmail() {
    return email;
  }

  void setUsername(String value) {
    CacheData.username = value;
  }

  String getUsername() {
    return username;
  }

  void setId(int value) {
    CacheData.id = value;
  }

  int? getId() {
    return id;
  }
}
