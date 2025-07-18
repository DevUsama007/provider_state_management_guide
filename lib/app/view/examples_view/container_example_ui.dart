import 'package:app_using_provider/app/view_model/provider/examples_provider/container_example_provider.dart';
import 'package:app_using_provider/app/view_model/provider/examples_provider/count_example_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContainerExampleUi extends StatefulWidget {
  const ContainerExampleUi({super.key});

  @override
  State<ContainerExampleUi> createState() => _ContainerExampleUiState();
}

class _ContainerExampleUiState extends State<ContainerExampleUi> {
  @override
  Widget build(BuildContext context) {
    print("object");
    final countProvider =
        Provider.of<ContainerExampleProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Count Example"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<ContainerExampleProvider>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    Slider(
                      min: 1.0,
                      max: 100.0,
                      value: value.containerradius,
                      onChanged: (newvalue) {
                        value.changeRadius(newvalue);
                        print(value.containerradius);
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 230,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(value.containerradius),
                          color: Colors.orangeAccent
                              .withOpacity(value.containerOpacity)),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'Border Radius: ${value.containerradius == 1.0 ? value.containerradius.toString() : value.containerradius.toString().substring(0, 4)}'),
                          Text(
                              'Color Opacity: ${value.containerOpacity == 1.0 || value.containerOpacity == 0.0 ? value.containerOpacity.toString() : value.containerOpacity.toString().substring(0, 4)}'),
                        ],
                      )),
                    ),
                    Slider(
                      min: 0.0,
                      max: 1.0,
                      value: value.containerOpacity,
                      onChanged: (newOpacity) {
                        value.changeOpacity(newOpacity);
                      },
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
