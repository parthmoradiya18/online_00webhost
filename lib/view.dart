import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_00webhost/data.dart';
import 'package:online_00webhost/main.dart';
class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  getdata() async {
    var url =
    Uri.parse('https://parthmoradiya.000webhostapp.com/online_select.php');
    var response = await http.get(url);
    List l = jsonDecode(response.body);
    print(l);
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("view"),),
        body: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done) {
              List l = snapshot.data as List;
              print(l);
              return ListView.builder(
                itemCount: l.length,
                itemBuilder: (context, index) {
                  data d = data.fromJson(l[index]);
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage("https://files.000webhost.com/myimage1/${d.image}")),
                    title: Text("${d.name}"),
                    subtitle: Text("${d.contact}\n${d.email}"),
                    trailing: Wrap(
                      children: [
                        IconButton(
                            onPressed: () async {
                              var url = Uri.parse(
                                  'https://parthmoradiya.000webhostapp.com/online_delete.php?id=${l[index]['id']}');
                              var response = await http.get(url);
                              print(response.body);
                              setState(() {});
                            },
                            icon: Icon(Icons.delete)),
                        IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Home(l[index]);
                                },
                              ));
                            },
                            icon: Icon(Icons.edit)),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )
    );

  }
}


