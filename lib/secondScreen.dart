import 'package:flutter/material.dart';


class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Second Screen"),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              child: Card(
                child: Text(
                    "This is Second Screen"
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

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
