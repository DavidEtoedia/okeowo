import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final navigator = Nav();

class Nav {
  /// Navigator state key
  final key = GlobalKey<NavigatorState>();

  /// Navigator's current state
  NavigatorState? get state => key.currentState;

  /// Navigator's current context
  BuildContext get context => state!.context;

  /// Smooth navigation from Splash
  // Future navigateFromSplash(
  //   Widget route, {
  //   bool isDialog = false,
  // }) {
  //   popView();
  //   // logger.i('Nav: Current Route -> ${(route.runtimeType)}');
  //   return state!.push(PageTransition(
  //     type: PageTransitionType.fade,
  //     duration: Duration(milliseconds: 2000),
  //     child: route,
  //   ));
  // }

  /// Push a named route
  void pushTop(String routeName) {
    // logger.i('Nav: Current Route -> ${(routeName)}');

    state!.pushNamed(routeName);
  }

  /// Push a replacement route
  void replaceTop(
    Widget page, {
    bool isDialog = false,
    bool isTransparent = false,
  }) {
    final route = _materialRoute(
      page,
      isDialog: isDialog,
      isTransparent: isTransparent,
    );
    state!.pushReplacement(route);
  }

  /// Push a  route and replace the root route
  void replaceRoot(
    Widget root, {
    bool isDialog = false,
    bool isTransparent = false,
  }) {
    final route = _materialRoute(
      root,
      isDialog: isDialog,
      isTransparent: isTransparent,
    );
    state?.pushAndRemoveUntil(route, (route) => false);
  }

  /// Push a  route
  void pushTo(
    Widget page,
    PageTransitionAnimation pageTransitionAnimation,
    bool isCustom, {
    bool isDialog = false,
    bool isTransparent = false,
    String? routeName,
  }) {
    final route = _materialRoute(page,
        isDialog: isDialog, isTransparent: isTransparent, routeName: routeName);

    final custom = getPageRoute(pageTransitionAnimation, enterPage: page);
    state?.push(isCustom ? custom : route);
  }

  /// Pop to initial route
  void popToFirst() => state!.popUntil((route) => route.isFirst);

  /// Pop/remove current route
  void popView() => state!.pop();

  /// If ui can pop/remove current route
  bool get canPop => state!.canPop();

  /// Custom material route
  MaterialPageRoute<Object> _materialRoute(
    Widget? widget, {
    String? routeName,
    bool isDialog = false,
    bool isTransparent = false,
  }) {
    // logger.i('Nav: Current Route -> ${(widget.runtimeType)}');

    return isTransparent
        ? TransparentRoute(
            builder: (context) => widget!,
            settings: RouteSettings(name: widget.toString()),
          ) as MaterialPageRoute<Object>
        : MaterialPageRoute(
            fullscreenDialog: isDialog,
            builder: (BuildContext context) => widget!,
            settings: RouteSettings(name: routeName ?? widget.toString()),
          );
  }
}

extension MyNavigator on BuildContext {
  // void navigateFromSplash(
  //   Widget route, {
  //   bool isDialog = false,
  // }) =>
  //     navigator.navigateFromSplash(
  //       route,
  //       isDialog: isDialog,
  //     );

  void navigateReplace(
    Widget route, {
    bool isDialog = false,
    bool isTransparent = false,
  }) =>
      navigator.replaceTop(
        route,
        isDialog: isDialog,
        isTransparent: isTransparent,
      );
  void navigateReplaceRoot(
    Widget route, {
    bool isDialog = false,
    bool isTransparent = false,
  }) =>
      navigator.replaceRoot(
        route,
        isDialog: isDialog,
        isTransparent: isTransparent,
      );

  void navigate(Widget route,
          {bool isDialog = false,
          bool isTransparent = false,
          PageTransitionAnimation pageTransitionAnimation =
              PageTransitionAnimation.cupertino,
          bool isCustom = false,
          String? routeName}) =>
      navigator.pushTo(route, pageTransitionAnimation, isCustom,
          isDialog: isDialog,
          isTransparent: isTransparent,
          routeName: routeName);

  void popToFirst() => navigator.popToFirst();

  void popView() => navigator.popView();

  bool get canPop => navigator.canPop;
}

class FadeInRoute<T> extends MaterialPageRoute<T> {
  FadeInRoute({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == '/') return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return FadeTransition(opacity: animation, child: child);
  }
}

class TransparentRoute extends PageRoute<void> {
  TransparentRoute({
    required this.builder,
    RouteSettings? settings,
  }) : super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 350);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: SlideTransition(
          transformHitTests: false,
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(0.0, -1.0),
            ).animate(secondaryAnimation),
            child: result,
          ),
        ),
      ),
    );
  }
}

dynamic getPageRoute(PageTransitionAnimation transitionAnimation,
    {RouteSettings? settings, Widget? enterPage, Widget? exitPage}) {
  switch (transitionAnimation) {
    case PageTransitionAnimation.cupertino:
      return settings == null
          ? CupertinoPageRoute(builder: (BuildContext context) => enterPage!)
          : CupertinoPageRoute(
              settings: settings,
              builder: (BuildContext context) => enterPage!);
    default:
      return exitPage == null
          ? _SinglePageRoute(
              page: enterPage,
              transitionAnimation: transitionAnimation,
              routeSettings: settings)
          : _AnimatedPageRoute(
              enterPage: enterPage,
              exitPage: exitPage,
              transitionAnimation: transitionAnimation,
              routeSettings: settings);
  }
}

class _SinglePageRoute extends PageRouteBuilder {
  final Widget? page;
  final PageTransitionAnimation? transitionAnimation;
  final RouteSettings? routeSettings;
  _SinglePageRoute({this.page, this.transitionAnimation, this.routeSettings})
      : super(
            settings: routeSettings,
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                page!,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                _getAnimation(context, animation, secondaryAnimation, child,
                    transitionAnimation!));
}

Widget _getAnimation(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget? child,
  PageTransitionAnimation transitionAnimation,
) {
  switch (transitionAnimation) {
    case PageTransitionAnimation.cupertino:
      break;
    case PageTransitionAnimation.slideRight:
      return _slideRightRoute(context, animation, secondaryAnimation, child);
    case PageTransitionAnimation.scale:
      return _scaleRoute(context, animation, secondaryAnimation, child);
    case PageTransitionAnimation.rotate:
      return _rotationRoute(context, animation, secondaryAnimation, child);
    case PageTransitionAnimation.sizeUp:
      return _sizeRoute(context, animation, secondaryAnimation, child);
    case PageTransitionAnimation.fade:
      return _fadeRoute(context, animation, secondaryAnimation, child);
    case PageTransitionAnimation.scaleRotate:
      return _scaleRotate(context, animation, secondaryAnimation, child);
    case PageTransitionAnimation.slideUp:
      return _slideUp(context, animation, secondaryAnimation, child);
    case PageTransitionAnimation.slideLeft:
      return _slideLeftRoute(context, animation, secondaryAnimation, child);
  }
  return Container();
}

enum PageTransitionAnimation {
  cupertino,
  slideRight,
  slideLeft,
  scale,
  rotate,
  sizeUp,
  fade,
  scaleRotate,

  slideUp
}

Widget _slideRightRoute(BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget? child) =>
    SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(animation),
        child: child);

Widget _slideLeftRoute(BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget? child) =>
    SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(animation),
        child: child);

Widget _slideUp(BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget? child) =>
    SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(animation),
        child: child);

Widget _scaleRoute(BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget? child) =>
    ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
        child: child);

Widget _rotationRoute(BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget? child) =>
    RotationTransition(
        turns: Tween<double>(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(parent: animation, curve: Curves.linear)),
        child: child);

Widget _sizeRoute(BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget? child) =>
    Align(
      child: SizeTransition(sizeFactor: animation, child: child),
    );

Widget _fadeRoute(BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget? child) =>
    FadeTransition(opacity: animation, child: child);

Widget _scaleRotate(BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget? child) =>
    ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
        child: RotationTransition(
            turns: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.linear)),
            child: child));

class _AnimatedPageRoute extends PageRouteBuilder {
  final Widget? enterPage;
  final Widget? exitPage;
  final PageTransitionAnimation? transitionAnimation;
  final RouteSettings? routeSettings;
  _AnimatedPageRoute(
      {this.exitPage,
      this.enterPage,
      this.transitionAnimation,
      this.routeSettings})
      : super(
          settings: routeSettings,
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              enterPage!,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              Stack(
            children: <Widget>[
              _getAnimation(context, animation, secondaryAnimation, exitPage,
                  transitionAnimation!),
              _getAnimation(context, animation, secondaryAnimation, enterPage,
                  transitionAnimation)
            ],
          ),
        );
}
