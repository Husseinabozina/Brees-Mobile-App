import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_button.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../controllers/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
    required this.controller,
    required this.onBack,
    required this.onSuccess,
    required this.onLogin,
  });

  final SignUpController controller;
  final VoidCallback onBack;
  final VoidCallback onSuccess;
  final VoidCallback onLogin;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  double _entrance = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onControllerChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _entrance = 1);
    });
  }

  void _onControllerChanged() => setState(() {});

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    super.dispose();
  }

  Future<void> _submit() async {
    final ok = await widget.controller.submit();
    if (!mounted) return;
    if (ok) {
      widget.onSuccess();
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Complete the form and accept the terms.')),
    );
  }

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
            Positioned(
              left: 0,
              top: 44,
              width: 375,
              height: 44,
              child: Stack(
                children: [
                  const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: BreesColors.ink,
                        fontSize: 16,
                        height: 20 / 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 4,
                    child: GestureDetector(
                      key: const Key('signup-back'),
                      onTap: widget.onBack,
                      child: Container(
                        width: 32,
                        height: 32,
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset('assets/images/signup_back.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 520),
              curve: Curves.easeOutCubic,
              left: 20,
              top: 128 + (1 - _entrance) * 18,
              width: 335,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 420),
                opacity: _entrance,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome to Brees',
                      style: TextStyle(
                        color: BreesColors.heading,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Complete the sign up to get started',
                      style: TextStyle(
                        color: BreesColors.body,
                        fontSize: 14,
                        height: 22 / 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 32),
                    _BreesField(
                      label: 'Name',
                      controller: widget.controller.name,
                    ),
                    const SizedBox(height: 16),
                    _BreesField(
                      label: 'Email',
                      controller: widget.controller.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    _BreesField(
                      label: 'Password',
                      controller: widget.controller.password,
                      obscureText: widget.controller.obscurePassword,
                      trailing: GestureDetector(
                        key: const Key('password-toggle'),
                        onTap: widget.controller.togglePasswordVisibility,
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Image.asset(
                            'assets/images/signup_show.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    GestureDetector(
                      key: const Key('terms-checkbox'),
                      onTap: widget.controller.toggleTerms,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 180),
                            child: widget.controller.acceptedTerms
                                ? Container(
                                    key: const ValueKey('terms-checked'),
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      color: BreesColors.primary,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  )
                                : Image.asset(
                                    'assets/images/signup_checkbox.png',
                                    key: const ValueKey('terms-unchecked'),
                                    width: 22,
                                    height: 22,
                                    fit: BoxFit.contain,
                                  ),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  color: BreesColors.ink,
                                  fontSize: 14,
                                  height: 22 / 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'By signing up, you agree to the ',
                                  ),
                                  TextSpan(
                                    text: 'Terms of\nService and Privacy Policy',
                                    style: TextStyle(color: BreesColors.primary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                  GestureDetector(
                    key: const Key('register-button'),
                    onTap: _submit,
                    child: Container(
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
                  ),
                  Opacity(
                    opacity: widget.controller.isSubmitting ? 0.65 : 1,
                    child: BreesButton(
                      label: widget.controller.isSubmitting
                          ? 'Please wait'
                          : 'Login',
                      width: 186,
                      onPressed: widget.onLogin,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 121,
              bottom: 8,
              width: 134,
              height: 5,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: BreesColors.ink,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BreesField extends StatelessWidget {
  const _BreesField({
    required this.label,
    required this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.trailing,
  });

  final String label;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 12,
            child: Text(
              label,
              style: const TextStyle(
                color: BreesColors.muted,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.12,
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: trailing == null ? 16 : 52,
            top: 22,
            bottom: 2,
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              style: const TextStyle(
                color: Color(0xFF040C22),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.4,
              ),
              decoration: const InputDecoration(
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          if (trailing != null)
            Positioned(right: 0, top: 0, bottom: 0, child: trailing!),
        ],
      ),
    );
  }
}
