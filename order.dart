import 'package:ieee_week13_task2/product.dart';

import 'customer.dart';

class Order {
  Customer _customer ;
  List<Product> _products;
  String _orderTime;

  Order({
    required Customer customer_,
    required List<Product> products_,
    required String orderTime_,
}) : _customer = customer_ ,
  _products = products_,
  _orderTime = orderTime_ {
    customer = _customer;
    products = _products;
    orderTime = _orderTime;
  }

  set customer(customer){
    _customer = customer;
  }
  get customer => _customer;


  set products(products){
    _products = products;
  }
  get products => _products;


  set orderTime(orderTime){
    _orderTime = orderTime;
  }
  get orderTime => _orderTime;
}