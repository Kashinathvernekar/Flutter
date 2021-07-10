import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cartP = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total', style: TextStyle(fontSize: 20),),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\₹${cartP.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cartP.items.values.toList(),
                          cartP.totalAmount,
                      );
                      cartP.clearCart();
                    },
                    child: Text('ORDER NOW'),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
        SizedBox(height: 10),
        Expanded(
            child: ListView.builder(
              itemCount: cartP.items.length,
              itemBuilder: (ctx, i) => CartItem(
                  cartP.items.values.toList()[i].id,
                  cartP.items.keys.toList()[i],
                  cartP.items.values.toList()[i].price,
                  cartP.items.values.toList()[i].quantity,
                  cartP.items.values.toList()[i].title,
              ),
            ),
          )
        ],),
    );
  }
}
