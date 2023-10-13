import 'dart:io';

import 'package:ieee_week13_task2/register_functions.dart';
import 'package:ieee_week13_task2/trader.dart';

import 'customer.dart';
import 'data.dart';

void userLogin(bool isCustomer) {
  if (isCustomer) {
    customerLogin(isCustomer);

  }
  else {
    traderLogin(isCustomer);
  }
}

void customerLogin(bool isCustomer) {
  Customer customer = getCustomerData(
    isCustomer: isCustomer,
  );
  showCustomerServices(customer);
}

void showCustomerServices(Customer customer) {
  bool paymentVerified = false;
  bool processCompleted = false;
  while(!processCompleted){
    print('Now you can see our products....');
    displayAllProducts();
    print('Enter the id of any product do you want to buy.....');
    int id = int.parse(stdin.readLineSync()!);
    print('First you must enter your paymentDetails.....');
    verifyPayment(paymentVerified, customer);
    buyProduct(id, customer);
    print('If you want to buy another product press 1 else press 2');
    var res = int.parse(stdin.readLineSync()!);
    if(res !=1){
      processCompleted = true;
    }
  }

}

getCustomerData({required bool isCustomer,}) {
  bool userLogin = false;
  String email;
  String password;
  mainLoop:
  while (!userLogin) {
    print('Please enter your email....');
    email = stdin.readLineSync()!;
    print('Please enter your password....');
    password = stdin.readLineSync()!;
    for (var customer in customers) {
      if (customer.email == email) {
        print('Email is exist');
        if (customer.password == password) {
          print('Login Successfully...');
          userLogin = true;
          return customer;
        } else {
          print('Password is incorrect');
          continue mainLoop;
        }
      }
    }
    print('Email isn\'t exist');
  }
}

void verifyPayment(bool paymentVerified, Customer customer) {
  while(!paymentVerified){
    print('Enter your id.....');
    String id = stdin.readLineSync()! ;
    print('Enter the secret number.....');
    int secretNumber = int.parse(stdin.readLineSync()!);
    if(customer.paymentDetails.id == id && customer.paymentDetails.secretNumber == secretNumber){
      paymentVerified = true;
    }
    else{
      print('Payment details is incorrect');
    }
  }
}

void buyProduct(int id, Customer customer) {
  for(var trad in traders){
    for(var cat in trad.products.entries){
      for(var prod in cat.value){
        if(prod.id == id){
          if(customer.amount>=prod.price){
            prod.quantity --;
            customer.amount = customer.amount -prod.price;
            displayAllProducts();
            print('/////');
            print('Your amount now is ${customer.amount}');
          }
          else{
            print('There is no enough money');
          }
        }
      }
    }
  }
}

void traderLogin(bool isCustomer) {
  Trader trader = getTraderData(
    isCustomer: isCustomer,
  );
  showTraderServices(trader);
}

void showTraderServices(Trader trader) {
  bool traderEnterProducts = false;
  bool processCompleted = false;
  while(!processCompleted){
    print('''
     For adding new product press 1
     For displaying your products press 2
     For Delete any product press 3     
     ''');
    int input = int.parse(stdin.readLineSync()!);
    if(input == 1) {
      while (!traderEnterProducts) {
        chooseCategory(trader.products);
        displayProducts(trader);
        print('''
    Do you wnat to enter another Product ? 
    For yes press 1 
    For No press 2
    ''');
        if (int.parse(stdin.readLineSync()!) == 2) {
          traderEnterProducts = true;
        }
      }
    }
    if(input == 2){
      displayProducts(trader);
    }
    if(input ==3){
      print('Enter the id of the product dou you want to delete');
      displayProducts(trader);
      deleteProduct(trader);
    }
    print('Do you want ant another process? For Y press 1 For No press 2');
    int res = int.parse(stdin.readLineSync()!);
    if(res != 1){
      processCompleted = true;
    }
  }
}

getTraderData({required bool isCustomer,}) {
  bool userLogin = false;
  String email;
  String password;
  while (!userLogin) {
    print('Please enter your email....');
    email = stdin.readLineSync()!;
    print('Please enter your password....');
    password = stdin.readLineSync()!;
    for (var trader in traders) {
      if (trader.email == email) {
        print('Email is exist');
        if (trader.password == password) {
          print('Login Successfully...');
          userLogin = true;
          return trader;
        } else {
          print('Password is incorrect');
          continue;
        }
      }
    }
    print('Email isn\'t exist');
  }
}

void deleteProduct(Trader trader) {
  int idOfTheDeletedProduct = int.parse(stdin.readLineSync()!);
  List list = [];
  String key  ='';
  for(var cat in trader.products.entries){
    for(var product in cat.value){
      // cat.value.removeWhere((element)=> element.id == idOfTheDeletedProduct);
      // displayProducts(trader);

      if(product.id == idOfTheDeletedProduct){
        list.add(product);
        key = cat.key;
        // cat.value.removeWhere((element)=> list.contains(element));
        // displayProducts(trader);
        // cat.value.remove(product);
        // displayProducts(trader);
      }
    }
  }
  trader.products[key].removeWhere((element)=> list.contains(element));
  displayProducts(trader);

}

void displayAllProducts() {
  for(var trad in traders){
    for(var cat in trad.products.entries){
      for(var prod in cat.value){
        print('Product :${prod.name}   / Price: ${prod.price}  /  Quantity: ${
            prod.quantity
        }   / id : ${prod.id}');
      }
    }
  }
}

void displayProducts(Trader trader) {
  for(var cat in trader.products.entries){
    for(var product in cat.value){
      print('${product.name}  id: ${product.id} \n');
    }
  }
}