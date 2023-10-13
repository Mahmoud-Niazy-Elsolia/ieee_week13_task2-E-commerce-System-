import 'dart:io';
import 'package:ieee_week13_task2/register_functions.dart';
import 'login_functions.dart';

void main() {
  bool isCustomer;
  print('''
  For Customer enter 1 ....
  For Trader enter 2 ....
  ''');
  isCustomer = int.parse(stdin.readLineSync()!) == 1 ? true : false;

  print('''
  For login press 1 ...
  For register press 2 ....
  ''');
  if ((int.parse(stdin.readLineSync()!) == 2)) {
    userRegister(isCustomer);
  }
  else {
    userLogin(isCustomer);
    }
  }





