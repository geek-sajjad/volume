import 'package:flutter/material.dart';
import 'package:volume/widgets/crypto_list_tile_widget.dart';
import './common/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Volume',
      theme: ThemeData(
        
        primaryColor: mainBlackColor,
        textTheme: TextTheme(
          title: TextStyle(fontSize: 16, color: mainBlackColor),
        )
      ),
      home: MyHomePage(title: 'Crypto Price'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          children: <Widget>[
            CryptoListTileWidget(
              name: "Bitcoin (BTC)",
              price: "\$9600.21",
              priceChanges: "+3.982",
              svgImageUrl: "https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/btc.svg",
              
            ),
            CryptoListTileWidget(
              name: "Bitcoin (BTC)",
              price: "\$9600.21",
              priceChanges: "+3.982",
              svgImageUrl: "https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/btc.svg",
              
            ),
          ],
        )
      ),
      
    );
  }
}
