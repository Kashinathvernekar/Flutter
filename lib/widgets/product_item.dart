import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  //
  // ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final pdProduct = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: pdProduct.id,
              );
            },
            child: Image.network(
              pdProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
              builder:(ctx, pdProduct, _) => IconButton(
              icon: Icon(
                pdProduct.isFavourite ? Icons.favorite: Icons.favorite_border,
              ),
              color: Theme.of(context).accentColor,
              onPressed: (){
                pdProduct.toggleFavouriteButton();
              },
            ),
            ),
            title: Text(
              pdProduct.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(
                  Icons.shopping_cart
              ),
              color: Theme.of(context).accentColor,
              onPressed: (){
                cart.addItem(pdProduct.id, pdProduct.title, pdProduct.price);
                Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added item to cart!'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(label: 'UNDO', onPressed: (){
                    cart.removeSingleItem(pdProduct.id);
                  },),
                ),
              );
            },
            ),
          ),
        ),
    );
  }
}
