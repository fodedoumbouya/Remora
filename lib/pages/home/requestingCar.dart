import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:remora/base/base_widget.dart';
import 'package:remora/pages/mainPage.dart';

class RequestingView extends BaseWidget {
  const RequestingView({super.key});

  @override
  BaseWidgetState<BaseWidget> getState() {
    return _RequestingViewState();
  }
}

class _RequestingViewState extends BaseWidgetState<RequestingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pcd(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: c(
              h: yy(50),
              w: sizeConfig().screenWidth,
              // color: Colors.red,
              child: riveAsset(
                path: "movingCar",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: riveAsset(
              path: "loading",
              fit: BoxFit.fitWidth,
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: c(
                topM: yy(30),
                child: txtw("publication ...",
                    color: pcl(), size: xx(7), fontWeight: FontWeight.bold),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: TimeCircularCountdown(
              unit: CountdownUnit.second,
              countdownCurrentColor: pcd(),
              countdownRemainingColor: bc(),
              textStyle: TextStyle(
                  color: pcl(), fontSize: xx(20), fontWeight: FontWeight.bold),
              countdownTotal: 5,
              diameter: 250,
              onUpdated: (unit, remainingTime) => print('Updated'),
              onFinished: () => jumpToPage(const MainRoutePages()),
            ),
          )
        ],
      ),
    );
  }
}
