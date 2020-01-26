
class Cryptocurrency {
    final String id;
    final String currency;
    final String symbol;
    final String name;
    final String logoUrl;
    final String rank;
    final String price;
    final DateTime priceDate;
    final String marketCap;
    final String circulatingSupply;
    final String maxSupply;
    final The1D the1D;
    final The1D the30D;
    final String high;
    final DateTime highTimestamp;

    Cryptocurrency({
        this.id,
        this.currency,
        this.symbol,
        this.name,
        this.logoUrl,
        this.rank,
        this.price,
        this.priceDate,
        this.marketCap,
        this.circulatingSupply,
        this.maxSupply,
        this.the1D,
        this.the30D,
        this.high,
        this.highTimestamp,
    });

    factory Cryptocurrency.fromJson(Map<String, dynamic> json) => Cryptocurrency(
        id: json["id"] == null ? null : json["id"],
        currency: json["currency"] == null ? null : json["currency"],
        symbol: json["symbol"] == null ? null : json["symbol"],
        name: json["name"] == null ? null : json["name"],
        logoUrl: json["logo_url"] == null ? null : json["logo_url"],
        rank: json["rank"] == null ? null : json["rank"],
        price: json["price"] == null ? null : json["price"],
        priceDate: json["price_date"] == null ? null : DateTime.parse(json["price_date"]),
        marketCap: json["market_cap"] == null ? null : json["market_cap"],
        circulatingSupply: json["circulating_supply"] == null ? null : json["circulating_supply"],
        maxSupply: json["max_supply"] == null ? null : json["max_supply"],
        the1D: json["1d"] == null ? null : The1D.fromJson(json["1d"]),
        the30D: json["30d"] == null ? null : The1D.fromJson(json["30d"]),
        high: json["high"] == null ? null : json["high"],
        highTimestamp: json["high_timestamp"] == null ? null : DateTime.parse(json["high_timestamp"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "currency": currency == null ? null : currency,
        "symbol": symbol == null ? null : symbol,
        "name": name == null ? null : name,
        "logo_url": logoUrl == null ? null : logoUrl,
        "rank": rank == null ? null : rank,
        "price": price == null ? null : price,
        "price_date": priceDate == null ? null : priceDate.toIso8601String(),
        "market_cap": marketCap == null ? null : marketCap,
        "circulating_supply": circulatingSupply == null ? null : circulatingSupply,
        "max_supply": maxSupply == null ? null : maxSupply,
        "1d": the1D == null ? null : the1D.toJson(),
        "30d": the30D == null ? null : the30D.toJson(),
        "high": high == null ? null : high,
        "high_timestamp": highTimestamp == null ? null : highTimestamp.toIso8601String(),
    };
}

class The1D {
    final String priceChange;
    final double priceChangePct;
    final String volume;
    final String volumeChange;
    final String volumeChangePct;
    final String marketCapChange;
    final String marketCapChangePct;

    The1D({
        this.priceChange,
        this.priceChangePct,
        this.volume,
        this.volumeChange,
        this.volumeChangePct,
        this.marketCapChange,
        this.marketCapChangePct,
    });

    factory The1D.fromJson(Map<String, dynamic> json) => The1D(
        priceChange: json["price_change"] == null ? null : json["price_change"],
        priceChangePct: json["price_change_pct"] == null ? null : double.tryParse(json["price_change_pct"]) * 100,
        volume: json["volume"] == null ? null : json["volume"],
        volumeChange: json["volume_change"] == null ? null : json["volume_change"],
        volumeChangePct: json["volume_change_pct"] == null ? null : json["volume_change_pct"],
        marketCapChange: json["market_cap_change"] == null ? null : json["market_cap_change"],
        marketCapChangePct: json["market_cap_change_pct"] == null ? null : json["market_cap_change_pct"],
    );

    Map<String, dynamic> toJson() => {
        "price_change": priceChange == null ? null : priceChange,
        "price_change_pct": priceChangePct == null ? null : priceChangePct,
        "volume": volume == null ? null : volume,
        "volume_change": volumeChange == null ? null : volumeChange,
        "volume_change_pct": volumeChangePct == null ? null : volumeChangePct,
        "market_cap_change": marketCapChange == null ? null : marketCapChange,
        "market_cap_change_pct": marketCapChangePct == null ? null : marketCapChangePct,
    };
}
