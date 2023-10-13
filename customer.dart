import 'package:ieee_week13_task2/payment.dart';
import 'package:ieee_week13_task2/user.dart';

class Customer extends User {
  PaymentDetails _paymentDetails;
  Customer({
    required super.name_,
    required super.email_,
    required super.phone_,
    required super.address_,
    required super.age_,
    required PaymentDetails paymentDetails_, required super.amount_, required super.password_,
  }) :
  _paymentDetails = paymentDetails_{
    paymentDetails = _paymentDetails;
  }

  set paymentDetails(paymentDetails){
    _paymentDetails = paymentDetails;
  }
  get paymentDetails => _paymentDetails;
}
