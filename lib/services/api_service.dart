import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:volume/models/cryptocurrency.dart';
import 'package:connectivity/connectivity.dart';
import 'package:volume/models/exceptions/connectivity_exception.dart';
import 'package:volume/models/exceptions/httpException.dart';

class ApiService {
  static final String _url = DotEnv().env['API_LINK'];


  static Future<List<Cryptocurrency>> fetchCryptocurrencies() async {
    
      ConnectivityResult connectivityResult = await  Connectivity().checkConnectivity();
      
      if(connectivityResult == ConnectivityResult.none){
        throw ConnectivityException();
      }
      final response = await http.get(_url);
      if(response.statusCode == 200){
        List<Cryptocurrency> cryptocurrencies = List<Cryptocurrency>.from(
          json.decode(response.body).map((x) => Cryptocurrency.fromJson(x)));
      return cryptocurrencies;
      }else {
       throw HttpException(); 
      }
    
    
  }
}
