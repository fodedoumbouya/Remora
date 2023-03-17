import 'package:flutter/material.dart';
import 'package:remora/base/base_widget.dart';

class DriverHome extends BaseWidget {
  const DriverHome({super.key});

  @override
  BaseWidgetState<BaseWidget> getState() {
    return _DriverHomeState();
  }
}

class _DriverHomeState extends BaseWidgetState<DriverHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: c(
              h: yy(50),
              w: sizeConfig().screenWidth,
              color: bc(),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
        ),
        Positioned(
            top: yy(10), left: xx(5), child: const Icon(Icons.arrow_back_ios)),
        Positioned(
          top: yy(22.7),
          left: xx(3),
          child: Container(
            height: yy(18),
            width: xx(10),
            color: Colors.transparent,
            child: RotatedBox(
              quarterTurns: 1,
              child: Divider(
                color: pcd(),
                thickness: 5,
              ),
            ),
          ),
        ),
        Positioned(
            top: yy(20), left: xx(5), child: const Icon(Icons.circle_outlined)),
        Positioned(top: yy(40), left: xx(5), child: const Icon(Icons.circle)),
        Positioned(
            top: yy(15),
            left: xx(15),
            child: dest(
                time: "12:00", city: "Corte", rdv: "Rendez-vous à la gare")),
        Positioned(
            top: yy(35),
            left: xx(15),
            child:
                dest(time: "13:35", city: "Ajaccio", rdv: "Au centre ville")),
        Positioned(
          top: yy(55),
          left: xx(15),
          child: c(
              h: yy(12),
              w: xx(70),
              // color: Colors.black,
              child: Row(
                children: [
                  c(
                      h: xx(25),
                      w: xx(25),
                      image: "500",
                      imgType: "jpg",
                      borderRadius: BorderRadius.circular(xx(30))),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      txtw("Eduard", fontWeight: FontWeight.bold, size: xx(10)),
                      txtw("4.99 ⭐️ (347 Commentaires)", size: xx(3))
                    ],
                  ))
                ],
              )),
        ),
        Positioned(
          top: yy(70),
          left: xx(15),
          child: c(
            h: yy(10),
            w: xx(70),
            child: txtw(
                "Voulez-vous faire le trajet avec Eduard qui est enseignant comme vous à l'Université de Corse",
                fontStyle: FontStyle.italic,
                size: xx(4),
                withOverflow: false),
          ),
        ),
        Positioned(
          top: yy(85),
          left: xx(25),
          child: c(
              h: xx(15),
              w: xx(50),
              color: bc(),
              radius: xx(20),
              alig: Alignment.center,
              boxShadow: [
                BoxShadow(
                    blurRadius: xx(5), color: bc(), offset: const Offset(1, 1))
              ],
              child: txtw(
                "Accepter",
                size: xx(7),
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    ));
  }

  Widget dest(
      {required String time, required String city, required String rdv}) {
    return c(
        h: yy(10),
        w: xx(60),
        child: Column(
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                txtw(time, fontWeight: FontWeight.bold, size: xx(8)),
                txtw(city, color: Colors.white60, size: xx(7)),
              ],
            )),
            txtw(rdv, color: Colors.white60, size: xx(5)),
          ],
        ));
  }
}
