import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => changeUI(),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'testApp',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: Provider.of<changeUI>(context).myThemeData,
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch.adaptive(
              value: Provider.of<changeUI>(context).checkvalue(),
              onChanged: (value) {
                Provider.of<changeUI>(context, listen: false)
                    .toggleFunction(value);
              })
        ],
      ),
      body: Container(),
    );
  }
}

class changeUI extends ChangeNotifier {
  ThemeMode myThemeData = ThemeMode.dark;
  bool checkvalue() {
    if (myThemeData == ThemeMode.system) {
      // final brightness = SchedulerBinding.instance.window.platformBrightness;
      return myThemeData == ThemeMode.dark;
    } else {
      return myThemeData == ThemeMode.dark;
    }
  }

  void toggleFunction(bool isOn) {
    if (isOn == true) {
      myThemeData = ThemeMode.dark;
      print('dark');
    } else {
      myThemeData = ThemeMode.light;
      print('light');
    }
    notifyListeners();
  }
}
