class PaymentDetails {
  String _id;
  int _secretNumber;

  PaymentDetails({
    required String id_,
    required int secretNumber_,
  })  : _id = id_,
        _secretNumber = secretNumber_ {
    id = _id;
    secretNumber = _secretNumber;
  }

  set id(id) {
    _id = id;
  }
  get id => _id;

  set secretNumber(secretNumber) {
    _secretNumber = secretNumber;
  }
  get secretNumber => _secretNumber;
}
