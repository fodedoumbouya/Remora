import 'package:flutter/material.dart';
import 'package:remora/utils/myLog.dart';
import 'package:remora/utils/sizeConfig.dart';

abstract class BaseWidget extends StatefulWidget {
  const BaseWidget({super.key});

  // @override
  // State<BaseWidget> createState() => _BaseWidgetState();

  @override
  BaseWidgetState createState() {
    return getState();
  }

  BaseWidgetState getState();
}

// BaseWidgetState<T extends BaseWidget> extends State<T>
//     with WidgetsBindingObserver {
class BaseWidgetState<T extends BaseWidget> extends State<T>
    with WidgetsBindingObserver {
  @override
  void initState() {
    pt(message: "main initState", v: true);
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});

    super.initState();
  }

  void onCreate() {}
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  baseBuild(BuildContext context) {}
  SizeConfig sizeConfig() {
    return SizeConfig(cxt: context);
  }

  double xx(double x) {
    return sizeConfig().safeBlockHorizontal * x;
    //sw() / 1080.0 * x;
  }

  double yy(double y) {
    return sizeConfig().safeBlockVertical * y;
    //sh() / 2220 * y;
  }

  pt(
      {required Object message,
      bool e = false,
      bool w = false,
      bool wtf = false,
      bool d = false,
      bool v = false}) {
    String msg = (w || e)
        ? "\n-----------------------------------------------------------------------\n\n$message \n-----------------------------------------------------------------------\n\n"
        : message.toString();
    if (e) {
      AppLog.e(msg);
    } else if (w) {
      AppLog.w(msg);
    } else if (wtf) {
      AppLog.wtf(msg);
    } else if (d) {
      AppLog.d(msg);
    } else if (v) {
      AppLog.v(msg);
    } else {
      AppLog.i(msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    pt(message: "build\n", v: true);

    return Scaffold(
      body: baseBuild(context),
    );
  }
}
