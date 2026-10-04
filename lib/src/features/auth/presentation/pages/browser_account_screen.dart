import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_button.dart';
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
                ? _PasswordForm(onPressed: widget.onPressed)
                : _SuccessContent(message: widget.message, onPressed: widget.onPressed),
          ),
        ),
      ),
    );
  }
}

class _SuccessContent extends StatelessWidget {
  const _SuccessContent({required this.message, required this.onPressed});

  final String message;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 3),
        Image.asset('assets/images/success_check.png', width: 68, height: 68),
        const SizedBox(height: 26),
        const Text.rich(
          TextSpan(
            style: TextStyle(color: BreesColors.heading, fontSize: 20, fontWeight: FontWeight.w500),
            children: [
              TextSpan(text: 'Hi! '),
              TextSpan(text: 'John', style: TextStyle(fontWeight: FontWeight.w700)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: BreesColors.heading, fontSize: 16, height: 1.35),
          ),
        ),
        const SizedBox(height: 42),
        BreesButton(label: 'Go to Bress app', width: 267, onPressed: onPressed),
        const Spacer(flex: 5),
      ],
    );
  }
}

class _PasswordForm extends StatelessWidget {
  const _PasswordForm({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 88, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/password_lock.png', width: 75, height: 75),
          const SizedBox(height: 26),
          const Text(
            'Set your password',
            style: TextStyle(color: BreesColors.heading, fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          const Text(
            'Please create your new account password\nfor Bress',
            style: TextStyle(color: BreesColors.heading, fontSize: 16, height: 1.6),
          ),
          const SizedBox(height: 30),
          const _BrowserField(label: 'Password'),
          const SizedBox(height: 16),
          const _BrowserField(label: 'Retype Password'),
          const SizedBox(height: 32),
          BreesButton(label: 'Continue', width: 335, onPressed: onPressed),
        ],
      ),
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
