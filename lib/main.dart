// import 'package:flutter/material.dart';
// import 'package:first_stacked/app/app.bottomsheets.dart';
// import 'package:first_stacked/app/app.dialogs.dart';
// import 'package:first_stacked/app/app.locator.dart';
// import 'package:first_stacked/app/app.router.dart';
// import 'package:stacked_services/stacked_services.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await setupLocator();
//   setupDialogUi();
//   setupBottomSheetUi();
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: Routes.startupView,
//       onGenerateRoute: StackedRouter().onGenerateRoute,
//       navigatorKey: StackedService.navigatorKey,
//       navigatorObservers: [
//         StackedService.routeObserver,
//       ],
//     );
//   }
// }


// set home screen to the counties list view
import 'package:flutter/material.dart';
// import 'ui/views/countries_list/countries_list_view.dart';
import 'ui/views/splash/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countries App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashView(),
    );
  }
}