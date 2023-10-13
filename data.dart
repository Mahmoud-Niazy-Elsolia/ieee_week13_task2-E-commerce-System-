import 'package:ieee_week13_task2/payment.dart';
import 'package:ieee_week13_task2/product.dart';
import 'package:ieee_week13_task2/trader.dart';
import 'customer.dart';

List<Customer> customers = [
  Customer(
    name_: 'name_',
    email_: 'm@',
    phone_: '01062676647',
    address_: 'address_',
    age_: 21,
    paymentDetails_: PaymentDetails(id_: '1234', secretNumber_: 1234),
    amount_: 300000000,
    password_: '123',
  ),
];
List<Trader> traders = [
  Trader(
    name_: 'ma',
    email_: 'ma@',
    phone_: '01062676647',
    address_: "address_",
    age_: 221,
    products_: {
      'Electronics' :[
        Product(name_: 'Mobile', price_: 3000, quantity_: 2, id_: 1),
        Product(name_: 'pc', price_: 10000, quantity_: 2, id_: 2),
        Product(name_: 'Laptop', price_: 15000, quantity_: 2, id_: 3),

      ],
      'Foods' :[

      ],
      'Clothes' :[
        Product(name_: 'Jacket', price_: 500, quantity_: 300, id_: 4),
      ],
      'other' :[],

    },
    amount_: 0,
    password_: '123',
  ),
];
