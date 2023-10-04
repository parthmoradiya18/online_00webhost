import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_00webhost/view.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  Map?m;
  Home([this.m]);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.m!=null){
      Name.text=widget.m!['name'];
      Contact.text=widget.m!['contact'];
      Email.text=widget.m!['email'];
      // image=widget.m!['image'];
    }
  }
  TextEditingController Name = TextEditingController();
  TextEditingController Contact = TextEditingController();
  TextEditingController Email = TextEditingController();
  ImagePicker picker = ImagePicker();
  XFile? image;
  bool temp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("online 000webhost"),
      ),
      body: Column(
        children: [
          Card(
              color: Colors.grey,
              margin: EdgeInsets.all(5),
              child: TextField(
                controller: Name,
                decoration: InputDecoration(labelText: "Enter Name"),
              )),
          Card(
              color: Colors.grey,
              margin: EdgeInsets.all(5),
              child: TextField(
                controller: Contact,
                decoration: InputDecoration(labelText: "Enter Contact"),
              )),
          Card(
              color: Colors.grey,
              margin: EdgeInsets.all(5),
              child: TextField(
                controller: Email,
                decoration: InputDecoration(labelText: "Enter Email"),
              )),

          Row(children: [
            ElevatedButton(onPressed: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text("your choice image"),
                  actions: [
                    IconButton(onPressed: () async {
                      image = await picker.pickImage(source: ImageSource.camera);
                      temp=true;
                      setState(() {
                      });
                    }, icon: Icon(Icons.camera)),
                    IconButton(onPressed: () async {
                      image = await picker.pickImage(source: ImageSource.gallery);
                      temp=true;
                      setState(() {
                      });
                    }, icon: Icon(Icons.browse_gallery)),
                  ],
                );
              },);
            }, child: Icon(Icons.image)),
            Container(
              height: 100,
              width: 100,
              child: (temp)
                  ? Image.file(File(image!.path))
                  : Icon(Icons.account_circle_rounded),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black)),
            ),
          ],),
          ElevatedButton(
              onPressed: () async {

                String name, contact,email;
                name = Name.text;
                contact = Contact.text;
                email=Email.text;
                String img_path=base64Encode(await image!.readAsBytes());
                if(widget.m!=null){
                  var url = Uri.parse(
                      'https://parthmoradiya.000webhostapp.com/online_update.php');
                  var response = await http.post(url, body: {'id':'${widget.m!['id']}','name': '$name', 'contact': '$contact','email':'$email','image':'$img_path'});
                  print('Response status: ${response.statusCode}');
                  print('Response body: ${response.body}');
                }else{
                  var url = Uri.parse(
                      'https://parthmoradiya.000webhostapp.com/online_add.php');
                  var response = await http.post(url, body: {'name': '$name', 'contact': '$contact','email':'$email','image':'$img_path'});
                  print('Response status: ${response.statusCode}');
                  print('Response body: ${response.body}');
                }
              },
              child: (widget.m!=null)?Text("Update"):Text("Add")),
          
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return view();
            },));
          }, child: Text("view"))
        ],
      ),
    );
  }
}
