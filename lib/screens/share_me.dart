import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../api.dart';
Iterable us = [];
Iterable idu ;
class ShareOfMe extends StatelessWidget {
   String id;

     ShareOfMe({Key key,this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
       API(
                          url:
                              "http://10.0.2.2:8000/api/findUser/" +id)
                                 
                      .getDataString()
                      .then((value) {
                    us = json.decode(value);
                    print(us);
                   
                           
                  });

                   API(
                          url:
                              "http://10.0.2.2:8000/api/findId/" +us.elementAt(0)["id"].toString())
                                 
                      .getDataString()
                      .then((value) {
                    idu = json.decode(value);
                    print(us);
                   
                           
                  });
  

return Scaffold(
      appBar: AppBar(
        title: Text(us.toString()),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          child: Expanded(
            child: ListView.builder(
              itemCount: idu.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 4.0,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          idu.elementAt(index)["name"].toString(),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        trailing: Icon(Icons.favorite_outline),
                      ),
                      Container(
                        height: 200.0,
                        child: Ink.image(
                          image: NetworkImage(
                              idu.elementAt(index)["img"].toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                           idu.elementAt(index)["description"].toString()),
                      ),
                      ButtonBar(
                        children: [
                          TextButton(
                            child: const Text('LOCATION'),
                            onPressed: () {
                              // local(
                              //     double.parse(s.elementAt(index)["location1"]),
                              //     double.parse(
                              //         s.elementAt(index)["location2"]));
                            },
                          ),
                    
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );

 
  }
}