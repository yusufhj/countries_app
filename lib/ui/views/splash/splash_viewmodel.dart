import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../countries_list/countries_list_view.dart';

class SplashViewModel extends BaseViewModel {
  Future<void> initializeApp(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context) => const CountriesListView()
      )
    );
  }
}