import 'package:flutter/material.dart';

import '../../../auth/data/repositories/demo_auth_repository.dart';
import '../../../auth/domain/usecases/register_user.dart';
import '../../../auth/presentation/controllers/sign_up_controller.dart';
import '../../../auth/presentation/pages/sign_up_screen.dart';
import '../../../auth/presentation/pages/sign_up_success_screen.dart';
import 'launch_screen.dart';
import 'onboarding_screen.dart';

enum BreesStep { launch, onboarding, signUp, signUpSuccess }

class BreesFlow extends StatefulWidget {
  const BreesFlow({super.key, this.initialStep = BreesStep.launch});

  final BreesStep initialStep;

  @override
  State<BreesFlow> createState() => _BreesFlowState();
}

class _BreesFlowState extends State<BreesFlow> {
  late BreesStep _step;
  late final SignUpController _signUpController;

  @override
  void initState() {
    super.initState();
    _step = widget.initialStep;
    _signUpController = SignUpController(
      RegisterUser(DemoAuthRepository()),
    );
  }

  @override
  void dispose() {
    _signUpController.dispose();
    super.dispose();
  }

  void _go(BreesStep step) => setState(() => _step = step);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 420),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        final offset = Tween(
          begin: const Offset(0.035, 0),
          end: Offset.zero,
        ).animate(animation);
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offset, child: child),
        );
      },
      child: switch (_step) {
        BreesStep.launch => LaunchScreen(
            key: const ValueKey('launch'),
            onFinished: () => _go(BreesStep.onboarding),
          ),
        BreesStep.onboarding => OnboardingScreen(
            key: const ValueKey('onboarding'),
            onCompleted: () => _go(BreesStep.signUp),
          ),
        BreesStep.signUp => SignUpScreen(
            key: const ValueKey('signup'),
            controller: _signUpController,
            onBack: () => _go(BreesStep.onboarding),
            onSuccess: () => _go(BreesStep.signUpSuccess),
          ),
        BreesStep.signUpSuccess => SignUpSuccessScreen(
            key: const ValueKey('signup-success'),
            onContinue: () => _go(BreesStep.signUp),
          ),
      },
    );
  }
}
