import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/core.dart';
import 'app.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocList,
      child: MaterialApp(
        title: "Video Application",
        theme: ThemeData(
          primaryColor: primaryColor,
          primarySwatch: primarySwatch,
        ),
        initialRoute: videoPath,
        onGenerateRoute: RouteGenerator.generateRoute,
        // home: Scaffold(body: Center(child: Text('Hello World!'))),
      ),
    );
  }
}
