import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';
import '../view_model/all_user_view_model.dart';

class AllUserView extends StatefulWidget {
  const AllUserView({super.key});

  @override
  State<AllUserView> createState() => _AllUserViewState();
}

class _AllUserViewState extends State<AllUserView> {
  @override
  Widget build(BuildContext context) {
    final _allUserProvider = Provider.of<AllUserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("All Users"),
          backgroundColor: Colors.yellowAccent,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _allUserProvider.fetchAllUsers(context);
              },
            ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Here are all the users",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 217, 217, 217)),
                  child: Center(
                    child: Consumer<AllUserViewModel>(
                      builder: (context, value, child) {
                        return value.status == Status.LOADING
                            ? Center(
                                child: CircularProgressIndicator(
                                color: Colors.white,
                              ))
                            : value.status == Status.ERROR
                                ? Text(value.error)
                                : ListView.builder(
                                    itemCount:
                                        value.allUsersModel?.data?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage(value
                                                .allUsersModel!
                                                .data![index]
                                                .avatar
                                                .toString()),
                                          ),
                                          title: Text(value.allUsersModel!
                                              .data![index].firstName
                                              .toString()),
                                          subtitle: Text(value
                                              .allUsersModel!.data![index].email
                                              .toString()),
                                        ),
                                      );
                                    },
                                  );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        )

        //  _allUserProvider.status == Status.LOADING
        //     ? Center(child: CircularProgressIndicator())
        //     : _allUserProvider.status == Status.ERROR
        //         ? Center(child: Text(_allUserProvider.error))
        //         : ListView.builder(
        //             itemCount: _allUserProvider.allUsersModel?.data?.length ?? 0,
        //             itemBuilder: (context, index) {
        //               final user = _allUserProvider.allUsersModel!.data![index];
        //               return ListTile(
        //                 leading: CircleAvatar(
        //                   backgroundImage: NetworkImage(user.avatar ?? ''),
        //                 ),
        //                 title: Text(user.firstName ?? 'No Name'),
        //                 subtitle: Text(user.email ?? 'No Email'),
        //               );
        //             },
        //           ),
        );
  }
}
