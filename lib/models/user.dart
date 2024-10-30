class User {
  var _email;
  var _password;

  User(this._email, this._password); //Constructor de la clase

  User.Empty();

  get email => _email;

  set email(value) => _email = value;

  get password => _password;

  set password(value) => _password = value;
}
