import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json_converter;
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget{
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState 
    extends State<CurrencyConverterMaterialPage> {

      static const api_key = String.fromEnvironment('API_KEY');

      static const List<String> currencies = [
      "USD", "AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG", "AZN",
      "BAM", "BBD", "BDT", "BGN", "BHD", "BIF", "BMD", "BND", "BOB", "BRL", "BSD",
      "BTN", "BWP", "BYN", "BZD", "CAD", "CDF", "CHF", "CLP", "CNY", "COP", "CRC",
      "CUP", "CVE", "CZK", "DJF", "DKK", "DOP", "DZD", "EGP", "ERN", "ETB", "EUR",
      "FJD", "FKP", "FOK", "GBP", "GEL", "GGP", "GHS", "GIP", "GMD", "GNF", "GTQ",
      "GYD", "HKD", "HNL", "HRK", "HTG", "HUF", "IDR", "ILS", "IMP", "INR", "IQD",
      "IRR", "ISK", "JEP", "JMD", "JOD", "JPY", "KES", "KGS", "KHR", "KID", "KMF",
      "KRW", "KWD", "KYD", "KZT", "LAK", "LBP", "LKR", "LRD", "LSL", "LYD", "MAD",
      "MDL", "MGA", "MKD", "MMK", "MNT", "MOP", "MRU", "MUR", "MVR", "MWK", "MXN",
      "MYR", "MZN", "NAD", "NGN", "NIO", "NOK", "NPR", "NZD", "OMR", "PAB", "PEN",
      "PGK", "PHP", "PKR", "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF", "SAR",
      "SBD", "SCR", "SDG", "SEK", "SGD", "SHP", "SLE", "SLL", "SOS", "SRD", "SSP",
      "STN", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP", "TRY", "TTD", "TVD",
      "TWD", "TZS", "UAH", "UGX", "UYU", "UZS", "VES", "VND", "VUV", "WST", "XAF",
      "XCD", "XCG", "XDR", "XOF", "XPF", "YER", "ZAR", "ZMW", "ZWL"
    ];
  
  double result = 0;
  double input = 0;
  final TextEditingController textEditingController = TextEditingController();
  static final List<DropdownMenuEntry<String>> menuEntries = UnmodifiableListView<DropdownMenuEntry<String>>(
    currencies.map<DropdownMenuEntry<String>>((String name) => DropdownMenuEntry(
              value: name,
              label: name,
              labelWidget: Center(
                child: Text(name, style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                ),)
              ),
              style: const ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(Color.fromRGBO(211, 218, 217, 1)),
                backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(68, 68, 78, 1)),
              ))),
  );

  String selectedCurrencyFrom = "USD";
  String selectedCurrencyTo = "INR"; 

  Future<double> convert() async {
    if(textEditingController.text == "")
    {
      return -1;
    }

    var url = Uri.https('v6.exchangerate-api.com','v6/${api_key}/latest/$selectedCurrencyFrom');

    var resp = await http.get(url);

  if(kDebugMode){
    print(selectedCurrencyFrom);
    print(selectedCurrencyTo);
  }

    return json_converter.jsonDecode(resp.body)['conversion_rates'][selectedCurrencyTo];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter', style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: Color.fromRGBO(26, 26, 26, 1),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${result != 0 ? '$input $selectedCurrencyFrom = ${result.toStringAsFixed(2)} $selectedCurrencyTo' : "I'll work as your currency exchange rate buddy!"}',
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 232, 219, 1),
              ),
              textAlign: TextAlign.center,
            ),
            // Text field is input
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Color.from(alpha: 1, red: 0, green: 0, blue: 0),
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in $selectedCurrencyFrom',
                  hintStyle: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                  prefixIcon: Icon(Icons.attach_money_rounded),
                  prefixIconColor: Color.fromRGBO(0, 0, 0, 1),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.brown,
                      width: 5.0,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40)
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.brown,
                      width: 3.0,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40)
                    ),
                  ),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                
              ),
            ),

            DropdownMenu<String>(
              dropdownMenuEntries: menuEntries,
              initialSelection: 'USD',
              textStyle: TextStyle(
                color: Colors.white,
                
              ),
              menuHeight: 300,
              width: 200,
              enableSearch: true,
              requestFocusOnTap: true,
              enableFilter: true,
              onSelected: (value) {
                
                FocusManager.instance.primaryFocus?.unfocus();
                setState(() {
                      selectedCurrencyFrom = value!;
                      result = 0;
                      
                  });
              },
            ),

            const SizedBox(height: 20),

            DropdownMenu<String>(
              dropdownMenuEntries: menuEntries,
              initialSelection: 'INR',
              textStyle: TextStyle(
                color: Colors.white,
              ),
              menuHeight: 300,
              width: 200,
              enableSearch: true,
              requestFocusOnTap: true,
              enableFilter: true,
              onSelected: (value) {

                FocusManager.instance.primaryFocus?.unfocus();
                setState(() {
                      selectedCurrencyTo = value!;
                      result = 0;
                  });
              },
            ),

            const SizedBox(height: 20),
            // buttons

            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextButton(onPressed: () async {
                final res = await convert();
                final data = res;
                  setState(() {
                      input = double.parse(textEditingController.text);
                      result = double.parse(textEditingController.text) * data;
                  });
                },
                style: const ButtonStyle(
                  elevation: WidgetStatePropertyAll(15),
                  backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(113, 90, 90, 1)),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, 50),
                  )
                ),
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Text(
                    'Convert',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ),
            )
          ],
        ), 
      ),
    );
  }
}
  