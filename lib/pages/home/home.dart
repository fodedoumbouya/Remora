import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:remora/base/base_widget.dart';
import 'package:remora/widgets/searchBar/searchBar.dart';

class Home extends BaseWidget {
  const Home({super.key});

  @override
  BaseWidgetState<BaseWidget> getState() {
    return _HomeState();
  }
}

class _HomeState extends BaseWidgetState<Home> {
  var jsons = """ 
  [
    {
    
      "title":"En atttent",
      "sub":"En cours de demande",
      "km":"3,5",
      "photo":"16",
      "demande": true
  },
   {
    
      "title":"Bob",
      "sub":"Tu es une bonne personne",
      "km":"3,5",
       "photo":"13",
      "demande": false

  },
   {
    
      "title":"Alice",
      "sub":"c'est un plaisir",
      "km":"102,5",
       "photo":"12",
      "demande": false
  }
  
]
  
  """;

  @override
  Widget build(BuildContext context) {
    List valueMap = json.decode(jsons);
    return Scaffold(
      backgroundColor: pcd(),
      body: Column(
        children: [
          c(
            h: yy(33),
            w: sizeConfig().screenWidth,
            // color: Colors.red,
            // borderRadius: BorderRadius.only(
            //     bottomRight: Radius.circular(xx(5)),
            //     bottomLeft: Radius.circular(xx(5))),
            child: riveAsset(path: "movingCar", fit: BoxFit.cover),
          ),
          c(
              h: yy(10),
              w: sizeConfig().screenWidth,
              color: pcl(),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(xx(7)),
                  topRight: Radius.circular(xx(7))),
              child: const ShowSearchBar("Search Votre Destination")),
          Expanded(
              child: c(
            color: pcl(),
            child: c(
                w: sizeConfig().screenWidth,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(xx(7)),
                    topRight: Radius.circular(xx(7))),
                color: pcd(),
                child: Column(
                  children: [
                    c(
                        alig: Alignment.center,
                        color: bc(),
                        h: yy(7),
                        w: sizeConfig().screenWidth,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(xx(7)),
                            topRight: Radius.circular(xx(7))),
                        child: txtw("Recent Activities",
                            color: pcd(), size: xx(7))),
                    Expanded(
                        child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: valueMap.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: boxActivity(
                            title: valueMap[index]['title'],
                            subTitle: valueMap[index]["sub"],
                            km: "${valueMap[index]['km']} km",
                            img: "${valueMap[index]['photo']}",
                            isRquest: valueMap[index]['demande'],
                          ),
                        );
                      },
                    ))
                  ],
                )),
          )),
        ],
      ),
    );
  }

  Widget boxActivity(
      {required String title,
      required String subTitle,
      required String km,
      required String img,
      required bool isRquest}) {
    return Column(
      children: [
        c(
          h: yy(10),
          w: sizeConfig().screenWidth,
          color: pcd(),
          child: ListTile(
            leading: c(
              w: xx(16), //const CircularProgressIndicator()
              child: ClipRRect(
                  child: isRquest
                      ? riveAsset(path: "spinning-gears")
                      : imgw(img, imgType: "jfif", fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(xx(2)))),
            ),
            title: txtw(title, color: isRquest ? Colors.red : pcl()),
            subtitle: txtw(subTitle, color: isRquest ? Colors.red : pcl()),
            trailing: txtw(km, color: isRquest ? Colors.red : pcl()),
          ),
        ),
        Divider(
          color: const Color.fromRGBO(51, 51, 51, 1),
          indent: xx(25),
          height: 0,
        ),
      ],
    );
  }
}
