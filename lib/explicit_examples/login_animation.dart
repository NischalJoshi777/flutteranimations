import 'package:flutter/material.dart';

class LoginScreenAnimation extends StatefulWidget {
  const LoginScreenAnimation({super.key});

  @override
  State<LoginScreenAnimation> createState() => _LoginScreenAnimationState();
}

class _LoginScreenAnimationState extends State<LoginScreenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedController;
  late Animation<double> myAnimatedOpacity;
  late Animation<double> scaleTransitions;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    animatedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    myAnimatedOpacity = Tween<double>(begin: 0, end: 1).animate(
      animatedController,
    );
    slideAnimation =
        Tween<Offset>(begin: const Offset(1, -1), end: Offset.zero).animate(
      CurvedAnimation(parent: animatedController, curve: Curves.ease),
    );
    scaleTransitions =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animatedController,
      curve: Curves.slowMiddle,
    ));
    animatedController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: myAnimatedOpacity,
              child: const FlutterLogo(
                size: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SlideTransition(
                position: slideAnimation,
                child: ScaleTransition(
                  scale: scaleTransitions,
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
