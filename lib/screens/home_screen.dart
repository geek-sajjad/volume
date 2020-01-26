import 'package:flutter/material.dart';
import 'package:volume/models/cryptocurrency.dart';
import 'package:volume/models/exceptions/connectivity_exception.dart';
import 'package:volume/models/exceptions/httpException.dart';
import 'package:volume/widgets/crypto_list_tile_widget.dart';
import 'package:volume/widgets/exception_error_widget.dart';
import '../services/api_service.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, @required this.title}) : super(key: key);


  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

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

