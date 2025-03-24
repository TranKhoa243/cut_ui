import 'dart:math';
import '../../base/base_page_mixin.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> rotateY;

  @override
  initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    rotateY = Tween<double>(
      begin: .0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    ));
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.rotationY(rotateY.value * 2 * pi),
                child: Image.asset(
                  AppImages.icAppLogo,
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              );
            }),
      ),
    );
  }
}
