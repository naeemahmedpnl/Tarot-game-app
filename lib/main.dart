import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarrot/utils/route/route.dart';
import 'package:tarrot/utils/route/routes_name.dart';

import 'firebase_options.dart';
import 'provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providersConst,
      builder: (context, child) {
        return MaterialApp(
          title: 'Torot',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
            ),
            appBarTheme: const AppBarTheme(
              elevation: 0.9,
            ),
            useMaterial3: true,
          ),
          initialRoute: RouteName.tarrotReader,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
