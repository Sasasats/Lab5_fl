import 'package:flutter/material.dart';
import 'services.dart';
import 'users.dart';

class JsonParsing extends StatefulWidget {
  @override
  _JsonParsingState createState() => _JsonParsingState();
}

class _JsonParsingState extends State<JsonParsing> {
  List<User> _users;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withAlpha(175),
        centerTitle: true,
        title: Text(_loading ? 'Идет загрузка...' : 'Список людей'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: null == _users ? 0 : _users.length,
            itemBuilder: (context, index) {
              User user = _users[index];
              return Align(
                child: FlatButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => AlertDialog(
                              title: Text("     Подробная информация"),
                              titlePadding:
                                  EdgeInsets.only(top: 20.0, bottom: 10.0),
                              content: Text("Имя: " +
                                  user.name +
                                  "\nНикнейм: " +
                                  user.username +
                                  "\nEmail: " +
                                  user.email +
                                  "\nПочтовый индекс: " +
                                  user.address.zipcode +
                                  "\nГород: " +
                                  user.address.city +
                                  "\nУлица: " +
                                  user.address.street +
                                  "\nКвартира:" +
                                  user.address.suite +
                                  "\nТелефон: " +
                                  user.phone +
                                  "\nВебсайт:  " +
                                  user.website),
                            ));
                  },
                  child: Text(user.name),
                ),
              );
            }),
      ),
    );
  }
}
