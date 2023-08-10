import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/pages/cart_model.dart';
import 'package:provider/provider.dart';
import 'cart_page.dart';
import 'grocery_item_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floating action button

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              //Cart Page....
              return CartPage();
            },
          ),
        ),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag),
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),

            //good morning
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text("Good Morning"),
            ),

            const SizedBox(height: 4),

            //let's order fresh item for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),

            //divider

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Divider(
                thickness: 1,
              ),
            ),

            const SizedBox(height: 24),

            //fresh items + grid

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Fresh Items",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  padding: EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index);
                      },
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),

      //floating action button
      
      // This code can apply in Scaffold but not in body
      //SO we can placed it in the top or in the bottom
      //Output is always same

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) {
      //         //Cart Page....
      //         return CartPage();
      //       },
      //     ),
      //   ),
      //   backgroundColor: Colors.black,
      //   child: Icon(Icons.shopping_bag),
      // ),
    );
  }
}
