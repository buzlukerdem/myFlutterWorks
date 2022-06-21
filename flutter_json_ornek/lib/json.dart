import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_ornek/model/user_model.dart';

class JsonApp extends StatefulWidget {
  JsonApp({Key? key}) : super(key: key);

  @override
  State<JsonApp> createState() => _JsonAppState();
}

class _JsonAppState extends State<JsonApp> {
  Future<List<UserModel>> _getUserList() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/users');
      late final List<UserModel> _userList;
      if (response.statusCode == 200) {
        _userList =
            (response.data as List).map((e) => UserModel.fromMap(e)).toList();
      }
      return _userList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  late final Future<List<UserModel>> _userList;
  @override
  void initState() {
    super.initState();
    _userList = _getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json'),
      ),
      body: Center(
        child: FutureBuilder<List<UserModel>>(
          future: _userList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var userList = snapshot.data!;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  var user = userList[index];
                  return ListTile(
                    title: Text(user.username),
                    subtitle: Text(user.address.toString()),
                    leading: Text(user.id.toString()),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
