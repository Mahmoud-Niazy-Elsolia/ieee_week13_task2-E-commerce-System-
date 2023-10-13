import 'package:ieee_week13_task2/product.dart';
import 'package:ieee_week13_task2/user.dart';

class Trader extends User {
  Map<String, List<Product>> _products;

  Trader({
    required super.name_,
    required super.email_,
    required super.phone_,
    required super.address_,
    required super.age_,
    required Map<String, List<Product>> products_, required super.amount_, required super.password_,
  }) : _products = products_ {
    products = _products;
  }

  set products(products) {
    _products = products;
  }

  get products => _products;
}
