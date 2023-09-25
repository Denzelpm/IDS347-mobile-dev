import 'package:flutter/material.dart';
import 'coin_data.dart';

class ValueScreen extends StatefulWidget {
  const ValueScreen({super.key});

  @override
  State<ValueScreen> createState() => _ValueScreenState();
}

class _ValueScreenState extends State<ValueScreen> {
  String selectedCurrency = 'USD';
  CoinData coinData = CoinData();

  String roundedLtc = '?';
  String roundedBtc = '?';
  String roundedEth = '?';

  @override
  void initState() {
    super.initState();
    updateValue();
  }

  Future updateValue() async {
    var btcRateData = await coinData.getExchangeRate(selectedCurrency, 'BTC');
    var ethRateData = await coinData.getExchangeRate(selectedCurrency, 'ETH');
    var ltcRateData = await coinData.getExchangeRate(selectedCurrency, 'LTC');

    if (btcRateData != null && ltcRateData != null && ethRateData != null) {
      setState(
            () {
          double btcRate = btcRateData['rate'];
          roundedBtc = btcRate.toInt().toString();
          double ltcRate = ltcRateData['rate'];
          roundedLtc = ltcRate.toInt().toString();
          double ethRate = ethRateData['rate'];
          roundedEth = ethRate.toInt().toString();
        },
      );
      return;
    }
  }

  DropdownButton<String> getDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(child: Text(currency), value: currency);
      dropDownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(
              () {
            selectedCurrency = value!;
            updateValue();
            print(selectedCurrency);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: [
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
                    child: Column(
                      children: [
                        Text(
                          '1 BTC = $roundedBtc $selectedCurrency',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
                    child: Column(
                      children: [
                        Text(
                          '1 ETH = $roundedEth $selectedCurrency',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
                    child: Column(
                      children: [
                        Text(
                          '1 LTC = $roundedLtc $selectedCurrency',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getDropDownButton(),
          ),
        ],
      ),
    );
  }
}
