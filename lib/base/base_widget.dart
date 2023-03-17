import 'package:flutter/material.dart';
import 'package:remora/utils/myLog.dart';
import 'package:remora/utils/sizeConfig.dart';
import 'package:rive/rive.dart';

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

  // lightColor() {
  //   return Theme.of(context).primaryColorLight;
  // }

  Color pcd() {
    return Theme.of(context).primaryColorDark;
  }

  Color pcl() {
    return Theme.of(context).primaryColorLight;
  }

  Color pc() {
    return Theme.of(context).primaryColor;
  }

  Color bc() {
    return Theme.of(context).colorScheme.background;
  }

  imgw(String img,
      {BoxFit? fit, String imgType = "png", double? width, double? height}) {
    return Image.asset(
      "images/$img.$imgType",
      fit: fit,
      height: height,
      width: width,
    );
  }

  txtw(String t,
      {Color? color,
      FontWeight? fontWeight,
      double? size,
      FontStyle? fontStyle,
      bool withOverflow = true}) {
    // color ??= const Color.fromRGBO(0, 0, 0, 0.392);
    TextOverflow? overflow = withOverflow ? TextOverflow.ellipsis : null;
    return Text(
      t,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: size,
          overflow: overflow,
          fontStyle: fontStyle),
    );
  }

  Widget c(
          {Widget? child,
          double? h,
          double? w,
          double? allM,
          double allP = 0,
          double topM = 0,
          double bottomM = 0,
          double leftM = 0,
          double rightM = 0,
          double topP = 0,
          double bottomP = 0,
          double leftP = 0,
          double rightP = 0,
          double radius = 0,
          Alignment? alig,
          Color? color,
          String? image,
          BoxFit? fit = BoxFit.fill,
          Alignment decoAlignment = Alignment.topCenter,
          String imgType = "png",
          // Color c = Colors.transparent,
          List<BoxShadow>? boxShadow,
          BoxShape boxShape = BoxShape.rectangle,
          BorderRadius? borderRadius,
          BoxBorder? border,
          Rect? centerSlice}) =>
      Container(
        alignment: alig,
        margin: allM == null
            ? EdgeInsets.only(
                left: leftM, right: rightM, bottom: bottomM, top: topM)
            : EdgeInsets.all(allM),
        padding: EdgeInsets.only(
            left: leftP, right: rightP, bottom: bottomP, top: topP),
        //.all(allP),
        decoration: BoxDecoration(
          color: color,
          shape: boxShape,
          boxShadow: boxShadow,
          image: image == null
              ? null
              : DecorationImage(
                  image: AssetImage('images/$image.$imgType'),
                  scale: MediaQuery.of(context).devicePixelRatio,
                  centerSlice: centerSlice,
                  fit: fit,
                  alignment: decoAlignment),
          border: border,
          borderRadius: boxShape != BoxShape.rectangle
              ? null
              : borderRadius ?? BorderRadius.circular(radius),
        ),
        height: h,
        width: w,
        child: child,
      );

  Widget get sb => const SizedBox();

  Widget riveAsset({
    required String path,
    void Function(Artboard)? onInit,
    Alignment? alignment,
    List<String>? animations,
    bool antialiasing = true,
    List<RiveAnimationController<dynamic>>? controllers,
    BoxFit? fit,
  }) {
    return RiveAnimation.asset(
      "assets/$path.riv",
      alignment: alignment,
      animations: animations ?? [],
      antialiasing: antialiasing,
      controllers: controllers ?? [],
      fit: fit,
      onInit: onInit,
    );
  }

  void pop([Object? o]) {
    Navigator.of(context).pop(o);
  }

  Future toPage(Widget w) {
    pt(
        message: "Move to Page=======================>${w.toStringShallow()}",
        v: true);
    return Navigator.of(context).push(MaterialPageRoute(builder: (con) {
      return w;
    }));
  }

  void jumpToPage(Widget w) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (con) {
      return w;
    }));
  }

  @override
  Widget build(BuildContext context) {
    pt(message: "build\n", v: true);

    return Scaffold(
      body: baseBuild(context),
    );
  }
}
