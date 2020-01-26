import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:volume/models/cryptocurrency.dart';
import 'package:volume/models/exceptions/connectivity_exception.dart';
import 'package:volume/models/exceptions/httpException.dart';
import 'package:volume/widgets/crypto_list_tile_widget.dart';
import 'package:volume/widgets/exception_error_widget.dart';
import './common/styles.dart';
import 'services/api_service.dart';

Future<void> main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Volume',
      theme: ThemeData(
        primaryColor: mainBlackColor,
        accentColor: acentBlackColor,
        textTheme: TextTheme(
          title: TextStyle(fontSize: 15, color: mainBlackColor),
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
      body: FutureBuilder(
        future: ApiService.fetchCryptocurrencies(),
        builder: (ctx, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasData){
            List<Cryptocurrency> cryptocurrencies = snapshot.data;
            return ListView.builder(
               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              itemCount: cryptocurrencies.length,
              itemBuilder: (ctx, int index){
                return CryptoListTileWidget(
                  name: "${cryptocurrencies[index].name} (${cryptocurrencies[index].symbol})",
                  price: "\$${double.tryParse(cryptocurrencies[index].price).toStringAsFixed(3)}",
                  priceChanges: "${cryptocurrencies[index].the1D.priceChangePct.toStringAsFixed(2)}%",
                  svgImageUrl: cryptocurrencies[index].logoUrl,
                );
              },
            );
          }else if(snapshot.hasError && snapshot.error.toString() == ConnectivityException.exceptionMessage){
            return Center(child: ExceptionErrorWidget(
              iconData: Icons.wifi,
              onPressed: (){setState(() {
              });},
              title: snapshot.error.toString(),
            ));
          }else if(snapshot.hasError && snapshot.error.toString() == HttpException.exceptionMessage){
            return Center(child: ExceptionErrorWidget(
              iconData: Icons.error,
              onPressed: (){setState(() {
              });},
              title: snapshot.error.toString(),
            ));
            // return Text("${snapshot.error.toString()}");
          }else if(snapshot.hasError){
            return Center(child: ExceptionErrorWidget(
              iconData: Icons.error,
              onPressed: (){setState(() {
              });},
              title: "Could not get data",
            ));
          }
          return Text("error");
        },
      ),
      
    );
  }
}


// padding: 