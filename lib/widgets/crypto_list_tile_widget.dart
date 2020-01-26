import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:volume/common/styles.dart';

class CryptoListTileWidget extends StatelessWidget {
  final String name;
  final String price;
  final String svgImageUrl;
  final String priceChanges;

  const CryptoListTileWidget(
      {Key key,
      @required this.name,
      @required this.price,
      @required this.svgImageUrl,
      @required this.priceChanges})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.network(
            this.svgImageUrl,
            placeholderBuilder: (BuildContext context) => Container(
                child: const SizedBox(
                  child: CircularProgressIndicator(),
                  width: 25,
                  height: 25,
                )),
            height: 25,
            width: 25,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            this.name,
            style: Theme.of(context).textTheme.title,
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            this.price,
            style: Theme.of(context).textTheme.title,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "(${this.priceChanges})",
            style: Theme.of(context).textTheme.title.copyWith(
                color: this.priceChanges.contains("-") ? redColor : greenColor),
          ),
        ],
      ),
    );
  }
}
