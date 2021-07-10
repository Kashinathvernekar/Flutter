import 'package:flutter/cupertino.dart';
import './product.dart';

class Products with ChangeNotifier {
List<Product> _items = [
  Product(
      id: 'p1',
      title: 'T shirt',
      description: 'Stylish for your fit  body',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/71JuDM9WOpL._AC_UX385_.jpg',
      price: 568
  ),
  Product(
      id: 'p2',
      title: 'Pant',
      description: 'Haoser Black Formal Trousers for Men',
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/61FjkEaXTNL._UX466_.jpg',
      price: 823
  ),
  Product(
      id: 'p3',
      title: 'Men\'s Watch',
      description: 'HMTe HM-9072 Metal Analog Men\'s watch',
      imageUrl: 'https://n4.sdlcdn.com/imgs/i/z/i/HMTe-HM-9072-Metal-Analog-SDL494827480-1-db8fc.jpg',
      price: 5652
  ),
  Product(
      id: 'p4',
      title: 'MOBILE',
      description: 'VIVO v19',
      imageUrl: 'https://static.digit.in/default/ecc9bccbe133b207187e07937c24e4ab0a05c826.jpeg?tr=1200',
      price: 12336
  ),
  Product(
      id: 'p5',
      title: 'Saree',
      description: 'Alluring Green Colored Soft Silk Saree',
      imageUrl: 'https://hashrail.sgp1.cdn.digitaloceanspaces.com/CND/Product/large/CD120_1.jpg',
      price: 1256
  ),
];

// var _showFavoriteOnly = false;

List<Product> get items{
  // if(_showFavoriteOnly){
  //   return _items.where((prodItem) => prodItem.isFavourite).toList();
  // }
  return [..._items];
}

List<Product> get favoriteItems{
  return _items.where((proItem) => proItem.isFavourite).toList();
}

Product findById(String id){
  return _items.firstWhere((prod) => prod.id == id);
}

// void showFavoriteOnly(){
//   _showFavoriteOnly = true;
//   notifyListeners();
// }
//
// void showAll(){
//   _showFavoriteOnly = false;
//   notifyListeners();
// }

void addProduct(){
  // _items.add(value);
  notifyListeners();
}

}