import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<dynamic> users = [] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index] ;
          //final email = user['email'] ;
          final name = user['user']['name'] ;
          //final picture = user['picture']['large'] ;
          return ListTile(
            leading: CircleAvatar(child: Text('${index+1}')),
            title: Text('$name'),
            //subtitle: Text(email),
            //trailing: CircleAvatar(child: Image.network(picture),),
          ) ;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers ,
      ),
    );
  }
  void fetchUsers() async{
    print("here users ********************************") ;
    const url = 'https://api.postman.com/collections/35174432-9a643374-4e58-4fb9-bb52-1e1e8a8d964d?access_key=PMAT-01JDJ7Q60YY9CT16S2AJ5M29NZ' ;
    final uri = Uri.parse(url) ;
    final response = await http.get(uri) ;
    final body = response.body ;
    final json = jsonDecode(body) ;
    setState(() {
      users = json['data'] ;
    });
    print('users fetched ***********************************') ;
  }
}




