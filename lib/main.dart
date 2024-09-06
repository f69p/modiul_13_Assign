import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoping Card',
      home: ShopingCard(),
    );
  }
}

class ShopingCard extends StatefulWidget {
  const ShopingCard({super.key});

  @override
  State<ShopingCard> createState() => _ShopingCardState();
}

class _ShopingCardState extends State<ShopingCard> {
  int pulloverQuantity = 1;
  int tshartQuantity = 1;
  int sportQuantity = 1;

  double pulloverPrice = 51.0;
  double tshartPrice = 30.0;
  double sportPrice = 43.0;

  double getTotalAmount() {
    return (pulloverQuantity * pulloverPrice) +
        (tshartQuantity * tshartPrice) +
        (sportQuantity * sportPrice);
  }

  void _showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content:const Text('Congratulations! Your order has been placed.'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'My Bag',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildItemCard(
              'Pullover', 'Black', 'L', pulloverQuantity, pulloverPrice, () {
            setState(
              () {
                if (pulloverQuantity > 1) pulloverQuantity--;
              },
            );
          }, () {
            setState(() {
              pulloverQuantity++;
            });
          }),
       const  SizedBox(
            height: 18,
          ),
          _buildItemCard('T-Shirt', 'Gray', 'L', tshartQuantity, tshartPrice,
              () {
            setState(() {
              if (tshartQuantity > 1) tshartQuantity--;
            });
          }, () {
            setState(() {
              tshartQuantity++;
            });
          }),
        const  SizedBox(
            height: 18,
          ),
          _buildItemCardNO3(
              'Sport Dress', 'Black', 'M', sportQuantity, sportPrice, () {
            setState(() {
              if (sportQuantity > 1) sportQuantity--;
            });
          }, () {
            setState(() {
              sportQuantity++;
            });
          }),
          Spacer(),
          Text('Total Amount:${getTotalAmount().toStringAsFixed(2)}\$'),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed:()=>_showSnackbar(context),
              child:const Text('CHECK OUT'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCard(String title, String colour, String size, int quantity,
      double price, voidonDecress, voidonIncress) {
    return Card(
      child: Row(
        children: [
          Image.asset(
            'asset/images/tshart.jpg',
            height: 150,
            width: 150,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 12,
              ),
              Text("Color: $colour    Size:$size"),
              ButtonBar(
                children: [
                  IconButton(
                      onPressed: voidonDecress, icon: Icon(Icons.remove)),
                  Text(quantity.toString()),
                  IconButton(onPressed: voidonIncress, icon: Icon(Icons.add)),
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Icon(Icons.more_vert),
              SizedBox(
                height: 58,
              ),
              Text('${price.toStringAsFixed(2)}\$'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemCardNO3(String title, String colour, String size,
      int quantity, double price, voidonDecress, voidonIncress) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'asset/images/tshart.jpg',
                ),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    child: Image.asset('asset/images/flutter.jpg'),
                  ),
                  Text(
                    'Flutter',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          Column(
            children: [
              Text(title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  )),
              SizedBox(
                height: 22,
              ),
              Text('Color: $colour   Size: $size'),
              Row(
                children: [
                  IconButton(
                      onPressed: voidonDecress, icon: Icon(Icons.remove)),
                  Text(quantity.toString()),
                  IconButton(onPressed: voidonIncress, icon: Icon(Icons.add)),
                ],
              )
            ],
          ),
          Spacer(),
          Column(
            children: [
              Icon(Icons.more_vert),
              SizedBox(
                height: 58,
              ),
              Text('${price.toStringAsFixed(2)}\$'),
            ],
          ),
        ],
      ),
    );
  }
}
