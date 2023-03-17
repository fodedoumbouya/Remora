import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remora/base/base_widget.dart';
import 'package:remora/pages/home/driverHome.dart';

class ProfileView extends BaseWidget {
  const ProfileView({super.key});

  @override
  BaseWidgetState<BaseWidget> getState() {
    return _ProfileViewState();
  }
}

class _ProfileViewState extends BaseWidgetState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: yy(5),
          left: 0,
          right: 0,
          child: c(
              h: yy(30),
              allM: xx(3),
              w: sizeConfig().screenWidth,
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                    blurRadius: xx(5),
                    color: Colors.black,
                    offset: const Offset(1, 1))
              ],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => toPage(const DriverHome()),
                    child: c(
                        h: xx(30),
                        w: xx(30),
                        color: Colors.red,
                        image: "2",
                        imgType: "jfif",
                        fit: BoxFit.fitWidth,
                        borderRadius: BorderRadius.circular(xx(20))),
                  ),
                  txtw("Eduard Chenselove",
                      fontWeight: FontWeight.bold, size: xx(5)),
                  txtw("Etudiant",
                      fontWeight: FontWeight.w300,
                      size: xx(5),
                      color: Colors.grey),
                ],
              )),
        ),
        Positioned(
            top: yy(40), left: xx(8), child: txtw("Hobbies", size: xx(6))),
        Positioned(
          top: yy(42.5),
          left: 0,
          right: 0,
          child: c(
              h: yy(30),
              allM: xx(3),
              w: sizeConfig().screenWidth,
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                    blurRadius: xx(5),
                    color: Colors.black,
                    offset: const Offset(1, 1))
              ],
              child: Column(
                children: [
                  hobbyBox(txt: "Basketball", icon: FontAwesomeIcons.baseball),
                  hobbyBox(txt: "Lire", icon: FontAwesomeIcons.book),
                  hobbyBox(
                      //Photography
                      txt: "Chanson, Corse pop-music",
                      icon: FontAwesomeIcons.music),
                  hobbyBox(txt: "Photography", icon: FontAwesomeIcons.camera),
                ],
              )),
        ),
        Positioned(
            top: yy(77), left: xx(8), child: txtw("Notification", size: xx(6))),
        Positioned(
            top: yy(85), left: xx(8), child: txtw("Parametre", size: xx(6))),
      ],
    ));
  }

  Widget hobbyBox({required String txt, required IconData icon}) {
    return c(
        h: yy(7.5),
        // color: Colors.white,
        alig: Alignment.center,
        leftM: xx(5),
        child: Row(
          children: [
            FaIcon(icon),
            SizedBox(
              width: xx(5),
            ),
            txtw(txt)
          ],
        ));
  }
}
