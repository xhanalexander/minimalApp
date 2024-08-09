import 'package:flutter/material.dart';
import 'package:minimalapp/view/home_view.dart';
import 'package:minimalapp/view_models/json_view_models.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => JsonViewModels()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeView(),
        },
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(
            primary: Colors.purple,
            secondary: Colors.purple,
            surface: Colors.purple,
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}
