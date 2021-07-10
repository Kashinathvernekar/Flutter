import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/cart_screen.dart';
import '../widgets/app_drawer.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import './cart_screen.dart';



enum FilterOptions{
  Favorites,
  All,
}


class ProductOverviewWidgets extends StatefulWidget {
  @override
  _ProductOverviewWidgetsState createState() => _ProductOverviewWidgetsState();
}

class _ProductOverviewWidgetsState extends State<ProductOverviewWidgets> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('eShop'),
        actions: <Widget> [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue){
              setState(() {
                if(selectedValue == FilterOptions.Favorites){
                  _showOnlyFavorites = true;
                }else{
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Only Favourites'), value: FilterOptions.Favorites,),
              PopupMenuItem(child: Text('Show All '), value: FilterOptions.All,),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(_showOnlyFavorites),
    );
  }
}

