class Product {
  int _id;
  String _name;
  double _price;
  int _quantity;

  Product({
    required String name_,
    required double price_,
    required int quantity_,
    required int id_,
  })  : _name = name_,
        _price = price_,
        _quantity = quantity_ ,
  _id = id_
  {
    name = _name;
    price = _price;
    quantity = _quantity;
  }

  set name(name){
    _name = name;
  }
  get name => _name;

  set id(id){
    _id = id;
  }
  get id => _id;

  set price(price){
    _price = price;
  }
  get price => _price;

  set quantity(quantity){
    _quantity = quantity;
  }
  get quantity => _quantity;
}
