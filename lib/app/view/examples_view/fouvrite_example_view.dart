import 'package:app_using_provider/app/view_model/provider/examples_provider/favourite_example_provider.dart';
import 'package:app_using_provider/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FouvriteExampleView extends StatefulWidget {
  const FouvriteExampleView({super.key});

  @override
  State<FouvriteExampleView> createState() => _FouvriteExampleViewState();
}

class _FouvriteExampleViewState extends State<FouvriteExampleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Favourite Example"),
          actions: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Consumer<FavouriteExampleProvider>(
                      builder: (context, value, child) {
                        return value.favouriteList.isEmpty
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                height: 400,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.do_not_disturb_off_sharp),
                                    Text("List is empty"),
                                  ],
                                ))
                            : ListView.builder(
                                itemCount: value.favouriteList.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: InkWell(
                                      onTap: () {
                                        value.removeFavourite(
                                            value.favouriteList[index]);
                                      },
                                      child: ListTile(
                                          title: Text(
                                              "ItemNo ${value.favouriteList[index]}"),
                                          leading: Icon(Icons.person),
                                          trailing: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )),
                                    ),
                                  );
                                },
                              );
                      },
                    );
                  },
                );
              },
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
        body: Consumer<FavouriteExampleProvider>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      !value.favouriteList.contains(index)
                          ? value.addFavourite(index)
                          : value.removeFavourite(index);
                    },
                    child: ListTile(
                        title: Text("ItemNo ${index}"),
                        leading: Icon(Icons.person),
                        trailing: value.favouriteList.contains(index)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.red,
                              )),
                  ),
                );
              },
            );
          },
        ));
  }
}
