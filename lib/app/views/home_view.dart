import 'package:conversor_curso/app/components/currency_box.dart';
import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController homeController;
  final TextEditingController fromText = TextEditingController();
  final TextEditingController toText = TextEditingController();

  @override
  void initState() {
    super.initState();
    homeController = HomeController(fromText: fromText, toText: toText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, right: 20, left: 20, bottom: 20),
          child: ListView(
            children: [
              Image.asset(
                'assets/images/Logo.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 30),
              CurrencyBox(
                items: homeController.currencies,
                selectedItem: homeController.fromCurrency,
                controller: fromText,
                onChanged: (model) {
                  setState(() {
                    homeController.fromCurrency = model;
                  });
                },
              ),
              SizedBox(height: 10),
              CurrencyBox(
                items: homeController.currencies,
                selectedItem: homeController.toCurrency,
                controller: toText,
                onChanged: (model) {
                  setState(() {
                    homeController.toCurrency = model;
                  });
                },
              ),
              SizedBox(height: 50),
              RaisedButton(
                child: Text('CONVERTER'),
                color: Colors.amber,
                onPressed: () {
                  homeController.convert();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
