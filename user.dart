class User {
  String _name;
  String _email;
  String _phone;
  double _amount;
  int _age;
  String _address;
  String _password;

  User({required String name_,
    required String email_,
    required String phone_,
    required String address_,
    required int age_,
    required double amount_,
    required String password_,
  })
      : _amount = amount_,
        _phone = phone_,
        _email = email_,
        _name = name_,
        _age = age_,
        _address = address_,
  _password=password_
  {
    name = _name;
    email = _email;
    phone = _phone;
    address = _address;
    amount = _amount;
    age = _age;
    password = _password;
  }

  set name(name) {
    _name = name;
  }

  get name => _name;

  set email(email) {
    if (email.contains('@')) {
      _email = email;
    } else {
      throw Exception();
    }
  }

  get email => _email;

  set phone(phone) {
    if (phone.length == 11) {
      _phone = phone;
    } else {
      throw Exception();
    }
  }

  get phone => _phone;

  set amount(amount) {
    _amount = amount;
  }

  get amount => _amount;

  set password(password) {
    _password = password;
  }

  get password => _password;


  set address(address) {
    _address = address;
  }

  get address => _address;

  set age(age) {
    if (age > 0) {
      _age = age;
    } else {
      throw Exception();
    }
  }

  get age => _age;
}
