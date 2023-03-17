import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:remora/base/base_widget.dart';

class MessagesView extends BaseWidget {
  const MessagesView({super.key});

  @override
  BaseWidgetState<BaseWidget> getState() {
    return _MessagesViewState();
  }
}

class _MessagesViewState extends BaseWidgetState<MessagesView> {
  var jsons = """ 
  [
    {
    
      "name":"Alice",
     "message":"Merci"
  },
   {
    
     "name":"Jack",
     "message":"t'es où"

  },
   {
     "name":"Mathieu",
     "message":"bye"
  },
   {
     "name":"Paul",
     "message":"ok"
  },
   {
     "name":"Tassa",
     "message":"haha"
  },
   {
     "name":"Elena",
     "message":"moi aussi"
  }
  
]
  
  """;
  @override
  Widget build(BuildContext context) {
    List valueMap = json.decode(jsons);

    return Scaffold(
      backgroundColor: pcl(),
      appBar: AppBar(
        title: txtw("MESSAGES", size: xx(8), fontWeight: FontWeight.bold),
        leading: sb,
        centerTitle: true,
        backgroundColor: bc(),
      ),
      body: ListView.builder(
          itemCount: valueMap.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  child: contactBox(valueMap[index]['name'],
                      valueMap[index]['message'], index),
                  onTap: () {},
                ),
                Divider(
                  color: pcl(),
                  thickness: 0,
                  indent: xx(15),
                  height: yy(1),
                ),
              ],
            );
          }),
    );
  }

  Widget contactBox(String name, String msg, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      // onTap: () => toPage(ChatView(
      //   contact: Contact(name: name, image: "$index"),
      // )),
      child: SizedBox(
          height: yy(7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                width: 50,
                height: yy(6.8),
                child: imgw("$index", imgType: "jfif"),
              ),
              SizedBox(
                width: xx(3),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.,
                children: [
                  txtw(name, size: xx(5)),
                  SizedBox(
                    height: xx(2.5),
                  ),
                  txtw(msg, color: Colors.grey, size: xx(3))
                ],
              )),
              Container(
                alignment: Alignment.centerRight,
                child: txtw("12:00", color: Colors.grey, size: xx(3.5)),
              ),
            ],
          )),
    );
  }
}
