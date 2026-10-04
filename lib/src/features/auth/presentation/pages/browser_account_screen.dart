import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/chrome_shell.dart';
import '../../../../core/widgets/design_canvas.dart';

class BrowserAccountScreen extends StatefulWidget {
  const BrowserAccountScreen({
    super.key,
    required this.message,
    required this.onPressed,
    required this.onBack,
    this.showPasswordForm = false,
  });

  final String message;
  final VoidCallback onPressed;
  final VoidCallback onBack;
  final bool showPasswordForm;

  @override
  State<BrowserAccountScreen> createState() => _BrowserAccountScreenState();
}

class _BrowserAccountScreenState extends State<BrowserAccountScreen> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _animate = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: Colors.white,
      child: ChromeShell(
        onBack: widget.onBack,
        child: AnimatedOpacity(
          opacity: _animate ? 1 : 0,
          duration: const Duration(milliseconds: 420),
          child: Transform.translate(
            offset: Offset(0, _animate ? 0 : 16),
            child: widget.showPasswordForm
                ? ColoredBox(
                    color: BreesColors.canvas,
                    child: _PasswordForm(onPressed: widget.onPressed),
                  )
                : _SuccessContent(
                    message: widget.message,
                    onPressed: widget.onPressed,
                  ),
          ),
        ),
      ),
    );
  }
}

class _SuccessContent extends StatelessWidget {
  const _SuccessContent({
    required this.message,
    required this.onPressed,
  });

  final String message;
  final VoidCallback onPressed;

  bool get _passwordReset => message.contains('password has been reset');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 154.94,
          top: 174.87,
          width: 65.11,
          height: 65.08,
          child: Image.asset(
            'assets/images/success_check.png',
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          top: _passwordReset ? 263.95 : 264.95,
          child: const Text.rich(
            TextSpan(
              style: TextStyle(
                color: BreesColors.heading,
                fontSize: 20,
                height: 28 / 20,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(text: 'Hi! '),
                TextSpan(
                  text: 'John',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          left: _passwordReset ? 20 : 69,
          right: _passwordReset ? 20 : 69,
          top: _passwordReset ? 307.95 : 294.95,
          height: _passwordReset ? 44 : 22,
          child: Text(
            message,
            maxLines: _passwordReset ? 2 : 1,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: BreesColors.heading,
              fontSize: 16,
              height: 22 / 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Positioned(
          left: 54,
          top: _passwordReset ? 393.95 : 355.95,
          width: 267,
          height: 62,
          child: FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: BreesColors.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.zero,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: const StadiumBorder(),
            ),
            child: const Text(
              'Go to Bress app',
              style: TextStyle(
                fontSize: 16,
                height: 20 / 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PasswordForm extends StatelessWidget {
  const _PasswordForm({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 20,
          top: 88,
          width: 75,
          height: 75,
          child: Image.asset(
            'assets/images/password_lock.png',
            fit: BoxFit.contain,
          ),
        ),
        const Positioned(
          left: 20,
          top: 187,
          width: 335,
          height: 29,
          child: Text(
            'Set your password',
            style: TextStyle(
              color: BreesColors.heading,
              fontSize: 24,
              height: 29 / 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Positioned(
          left: 20,
          top: 224,
          width: 335,
          height: 52,
          child: Text(
            'Please create your new account password for Bress',
            style: TextStyle(
              color: BreesColors.heading,
              fontSize: 16,
              height: 26 / 16,
            ),
          ),
        ),
        const Positioned(
          left: 20,
          top: 308,
          child: _BrowserField(label: 'Password'),
        ),
        const Positioned(
          left: 20,
          top: 385,
          child: _BrowserField(label: 'Retype Password'),
        ),
        Positioned(
          left: 20,
          top: 478,
          width: 335,
          height: 62,
          child: FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: BreesColors.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.zero,
              elevation: 0,
              shadowColor: Colors.transparent,
              shape: const StadiumBorder(),
            ),
            child: const Text(
              'Continue',
              style: TextStyle(
                fontSize: 16,
                height: 20 / 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BrowserField extends StatelessWidget {
  const _BrowserField({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 7),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: BreesColors.muted, fontSize: 10, fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          const Text('••••••••••••', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 1.1)),
        ],
      ),
    );
  }
}
