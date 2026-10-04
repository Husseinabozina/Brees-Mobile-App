import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_button.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/brees_top_nav.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/home_indicator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    required this.onBack,
    required this.onForgotPassword,
    required this.onLogin,
  });

  final VoidCallback onBack;
  final VoidCallback onForgotPassword;
  final VoidCallback onLogin;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: BreesColors.canvas,
      child: ColoredBox(
        color: BreesColors.canvas,
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              child: BreesStatusBar(
                foreground: Color(0xFF161719),
                assetPath: 'assets/images/status_dark.png',
              ),
            ),
            BreesTopNav(title: 'Login', onBack: widget.onBack),
            const Positioned(
              left: 20,
              top: 128,
              child: Text(
                'Welcome back',
                style: TextStyle(
                  color: BreesColors.heading,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Positioned(
              left: 20,
              top: 176,
              child: Text(
                'Hey you’re back, fill in your details to get back in',
                style: TextStyle(
                  color: BreesColors.body,
                  fontSize: 14,
                ),
              ),
            ),
            const Positioned(
              left: 20,
              top: 222,
              child: _LoginField(
                label: 'Email',
                value: 'Louis04real@gmail.com',
              ),
            ),
            Positioned(
              left: 20,
              top: 299,
              child: _LoginField(
                label: 'Password',
                value: obscure ? '••••••••••••' : 'portfolio123',
                trailing: GestureDetector(
                  onTap: () => setState(() => obscure = !obscure),
                  child: const Icon(
                    Icons.visibility_rounded,
                    color: BreesColors.primary,
                    size: 22,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 388,
              child: GestureDetector(
                onTap: widget.onForgotPassword,
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: BreesColors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 700,
              width: 335,
              height: 62,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: BreesColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: BreesColors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  BreesButton(
                    label: 'Login',
                    width: 186,
                    onPressed: widget.onLogin,
                  ),
                ],
              ),
            ),
            const HomeIndicator(),
          ],
        ),
      ),
    );
  }
}

class _LoginField extends StatelessWidget {
  const _LoginField({
    required this.label,
    required this.value,
    this.trailing,
  });

  final String label;
  final String value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 61,
      padding: const EdgeInsets.fromLTRB(20, 10, 18, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: BreesColors.muted,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF040C22),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
