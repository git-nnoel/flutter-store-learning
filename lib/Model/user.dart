class User {
  String fullName;
  String password;
  String? email;
  String? contactNumber;

  User({
    required this.fullName,
    required this.password,
  });

  String concludeRegister(String email, String contactNumber){
    this.email = email;
    this.contactNumber = contactNumber;
    return 'name: $fullName\npassword: $password\nemail: ${this.email}\ncontact: ${this.contactNumber}';
  }

}
