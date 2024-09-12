import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) {
        model.initializeApp(context);
      },
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/globe.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 20),

                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}