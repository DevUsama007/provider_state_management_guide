import 'package:app_using_provider/app/view_model/provider/examples_provider/count_example_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountExampleUi extends StatefulWidget {
  const CountExampleUi({super.key});

  @override
  State<CountExampleUi> createState() => _CountExampleUiState();
}

class _CountExampleUiState extends State<CountExampleUi> {
  @override
  Widget build(BuildContext context) {
    print("object");
    final countProvider =
        Provider.of<CountExampleProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Count Example"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Icon(
          Icons.commute_rounded,
          color: Colors.white,
        ),
        onPressed: () {
          countProvider.setCount();
        },
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<CountExampleProvider>(
              builder: (context, value, child) {
                return ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: WidgetStatePropertyAll(Size(120, 40)),
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.amberAccent)),
                    onPressed: () {},
                    child: Text(
                      value.count.toString(),
                      style: TextStyle(color: Colors.white),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
