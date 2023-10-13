import 'dart:io';

import 'package:ieee_week13_task2/payment.dart';
import 'package:ieee_week13_task2/product.dart';
import 'package:ieee_week13_task2/trader.dart';
import 'package:ieee_week13_task2/user.dart';

import 'customer.dart';
import 'data.dart';
import 'login_functions.dart';

void userRegister(bool isCustomer) {
  if (isCustomer) {
    customerRegister();
    print('Now you can login as a Customer ');
    customerLogin(isCustomer);
  } else {
    traderRegister();
    print('Now you can login as a Trader ');
    traderLogin(isCustomer);
  }
}

customerRegister() {
  Customer customer;
  User user = getUserMainData();
  PaymentDetails paymentDetails = getPaymentDetails();
  customer = Customer(
    name_: user.name,
    email_: user.email,
    phone_: user.phone,
    address_: user.address,
    age_: user.age,
    paymentDetails_: paymentDetails,
    amount_: user.amount,
    password_: user.password,
  );
  customers.add(customer);
  print('Register Successfully .......');
}

PaymentDetails getPaymentDetails() {
  String paymentId;
  int secretNumber;
  print('Enter Your card ID ...');
  paymentId = stdin.readLineSync()!;
  print('Enter Your secret Number ...');
  secretNumber = int.parse(stdin.readLineSync()!);
  PaymentDetails paymentDetails = PaymentDetails(
    id_: paymentId,
    secretNumber_: secretNumber,
  );
  return paymentDetails;
}

traderRegister() {
  Trader trader;
  User user = getUserMainData();
  bool traderEnterProducts = false;
  Map<String, List<Product>> products = {
    'Electronics': [],
    'Foods': [],
    'Clothes': [],
    'other': [],
  };
  while (!traderEnterProducts) {
    chooseCategory(products);
    print('''
  Do you wnat to enter another Product ? 
  For yes press 1 
  For No press 2
  ''');
    if (int.parse(stdin.readLineSync()!) == 2) {
      traderEnterProducts = true;
    }
  }
  trader = Trader(
    name_: user.name,
    email_: user.email,
    phone_: user.phone,
    address_: user.address,
    password_: user.password,
    age_: user.age,
    products_: products,
    amount_: user.amount,
  );

  traders.add(trader);
}

getUserMainData() {
  String name;
  String phone;
  String email;
  String address;
  int age;
  String password;
  print('Enter Your name ...');
  name = stdin.readLineSync()!;
  print('Enter Your phone ...');
  phone = stdin.readLineSync()!;
  print('Enter Your email ...');
  email = stdin.readLineSync()!;
  print('Enter Your password ...');
  password = stdin.readLineSync()!;
  print('Enter Your address ...');
  address = stdin.readLineSync()!;
  print('Enter Your age ...');
  age = int.parse(stdin.readLineSync()!);

  return User(
    name_: name,
    email_: email,
    phone_: phone,
    address_: address,
    age_: age,
    password_: password,
    amount_: 0,
  );
}

void chooseCategory(Map<String, List<Product>> products) {
  print('''
Now you will enter your products....
Please chose category of your product.....
For Electronics press 1
For Foods press 2
For Clothes press 3
For other Press 4
''');
  int categoryChoice = int.parse(stdin.readLineSync()!);
  if (categoryChoice == 1) {
    var product = addProduct();
    products['Electronics']!.add(product);
  }
  if (categoryChoice == 2) {
    var product = addProduct();
    products['Foods']!.add(product);
  }
  if (categoryChoice == 3) {
    var product = addProduct();
    products['Clothes']!.add(product);
  }
  if (categoryChoice == 4) {
    var product = addProduct();
    products['other']!.add(product);
  }
}

addProduct() {
  String productName;
  double price;
  int quantity;
  int id;
  print('Enter product name ...');
  productName = stdin.readLineSync()!;
  print('Enter the price of this product ...');
  price = double.parse(stdin.readLineSync()!);
  print('Enter the quantity ...');
  quantity = int.parse(stdin.readLineSync()!);
  print('Enter the product id ...');
  id = int.parse(stdin.readLineSync()!);

  return Product(
    name_: productName,
    price_: price,
    quantity_: quantity,
    id_: id,
  );
}