import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_app/provider/theme_provider.dart';
import 'package:theme_app/secondScreen.dart';
import 'package:theme_app/theme/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (context)=> ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context,ThemeProvider themeProvider,child){
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeProvider.themeData,
            //themeMode: ThemeMode.dark,
            home: const MyHomePage(title: 'First Screen'),
          );
        },

      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool switchVal = false;
  String colors = "Brown";

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Switch(
              value: themeProvider.isDark!, onChanged: (onChanged){
                themeProvider.switchTheme(onChanged,colors);
          }
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: const Text('Green'),
                  leading: Radio(
                    value:  "Green",
                    groupValue: themeProvider.color,
                    onChanged: (value) {
                        colors = value as String;
                        themeProvider.color = colors;
                        themeProvider.switchTheme(themeProvider.isDark!,value);

                    },
                  ),
                ),
                ListTile(
                  title: const Text('Yellow'),
                  leading: Radio(
                    value: "Yellow",
                    groupValue: themeProvider.color,
                    onChanged: (value) {
                      setState(() {
                        colors = value as String;
                        themeProvider.color = colors;
                        themeProvider.switchTheme(themeProvider.isDark!,value);
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Brown'),
                  leading: Radio(
                    value: "Brown",

                    groupValue: themeProvider.color,
                    onChanged: (value) {
                      setState(() {
                        colors = value as String;
                        themeProvider.color = colors;
                        themeProvider.switchTheme(themeProvider.isDark!,value);
                      });
                    },
                  ),
                ),
              ],
            ),
             Container(
              height: 300,
              width: 300,
               child: Card(
                 child: Text(
                   "Large Text for checking purpose"
                 ),
               ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: (){},
                      child: Text("Tushar")
                  ),
                  OutlinedButton(
                      onPressed: (){},
                      child: Text("Soni")
                  ),
                ],
              ),
            ),

            Text(
              'Flutter Developer',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (builder)=>SecondScreen())
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
