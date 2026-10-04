import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/gmail_shell.dart';

class GmailOpenMailScreen extends StatelessWidget {
  const GmailOpenMailScreen({
    super.key,
    required this.onPrimaryAction,
    required this.onBack,
    this.actionLabel = 'Create new password',
  });

  final VoidCallback onPrimaryAction;
  final VoidCallback onBack;
  final String actionLabel;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: Colors.white,
      child: GmailShell(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 375,
            height: 960,
            child: Stack(
              children: [
                Positioned(
                  left: 12,
                  top: 16,
                  width: 347,
                  height: 24,
                  child: _OpenMailToolbar(onBack: onBack),
                ),
                const Positioned(
                  left: 13,
                  top: 66,
                  width: 349,
                  height: 29,
                  child: _MailTitle(),
                ),
                const Positioned(
                  left: 13,
                  top: 127,
                  width: 349,
                  height: 43,
                  child: _MailSender(),
                ),
                Positioned(
                  left: 13,
                  top: 202,
                  width: 349,
                  height: 715,
                  child: _BreesEmailCard(
                    actionLabel: actionLabel,
                    onPrimaryAction: onPrimaryAction,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OpenMailToolbar extends StatelessWidget {
  const _OpenMailToolbar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          width: 24,
          height: 24,
          child: GestureDetector(
            key: const Key('gmail-open-back'),
            onTap: onBack,
            behavior: HitTestBehavior.opaque,
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF5F6368),
              size: 21,
            ),
          ),
        ),
        const Positioned(
          right: 0,
          top: 0,
          width: 143,
          height: 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.archive_outlined, color: Color(0xFF5F6368), size: 20),
              Icon(Icons.delete_outline_rounded, color: Color(0xFF5F6368), size: 20),
              Icon(Icons.mark_email_unread_outlined, color: Color(0xFF5F6368), size: 20),
              Icon(Icons.more_vert_rounded, color: Color(0xFF5F6368), size: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class _MailTitle extends StatelessWidget {
  const _MailTitle();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          left: 0,
          top: 0,
          width: 249,
          child: Text(
            'Brees; Email Verification',
            maxLines: 1,
            style: TextStyle(
              color: Color(0xFF292929),
              fontSize: 21,
              height: 29 / 21,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          left: 257,
          top: 5.5,
          width: 45,
          height: 18,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Inbox',
              style: TextStyle(
                color: Color(0xFF343434),
                fontSize: 12,
                height: 14 / 12,
              ),
            ),
          ),
        ),
        const Positioned(
          right: 2,
          top: 4,
          child: Icon(
            Icons.star_border_rounded,
            color: Color(0xFF9AA0A6),
            size: 20,
          ),
        ),
      ],
    );
  }
}

class _MailSender extends StatelessWidget {
  const _MailSender();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          left: 0,
          top: 3,
          child: CircleAvatar(
            radius: 18.5,
            backgroundColor: BreesColors.primary,
            child: Text(
              'Br',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        Positioned(
          left: 52,
          top: 0,
          child: Text(
            'GetBrees',
            style: TextStyle(
              color: Color(0xFF303030),
              fontSize: 16,
              height: 22 / 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          left: 54,
          top: 27,
          child: Row(
            children: [
              Text(
                'to me',
                style: TextStyle(
                  color: Color(0xFF5F6267),
                  fontSize: 14,
                  height: 16 / 14,
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.keyboard_arrow_down_rounded, size: 15, color: Color(0xFF5F6267)),
            ],
          ),
        ),
        Positioned(
          right: 66,
          top: 15,
          child: Text(
            'May 6',
            style: TextStyle(
              color: Color(0xFF686B70),
              fontSize: 12,
              height: 14 / 12,
            ),
          ),
        ),
        Positioned(
          right: 33,
          top: 12,
          child: Icon(
            Icons.reply_rounded,
            color: Color(0xFF5F6368),
            size: 20,
          ),
        ),
        Positioned(
          right: 0,
          top: 10,
          child: Icon(
            Icons.more_vert_rounded,
            color: Color(0xFF5F6368),
            size: 21,
          ),
        ),
      ],
    );
  }
}

class _BreesEmailCard extends StatelessWidget {
  const _BreesEmailCard({
    required this.actionLabel,
    required this.onPrimaryAction,
  });

  final String actionLabel;
  final VoidCallback onPrimaryAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F6FE),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 64,
            top: 56,
            child: Text(
              'Brees',
              style: TextStyle(
                color: BreesColors.primary,
                fontSize: 32,
                height: 39 / 32,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const Positioned(
            left: 64,
            top: 151,
            child: Text(
              'Forgot Password!',
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 24,
                height: 29 / 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Positioned(
            left: 64,
            top: 207,
            child: Text(
              'Hi, Collins Donye',
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16,
                height: 22 / 16,
              ),
            ),
          ),
          const Positioned(
            left: 64,
            top: 255,
            width: 221,
            child: Text(
              'Simply click the big blue button\nto create a new password',
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 14,
                height: 22 / 14,
              ),
            ),
          ),
          Positioned(
            left: 64,
            top: 315,
            width: 157,
            height: 40,
            child: FilledButton(
              onPressed: onPrimaryAction,
              style: FilledButton.styleFrom(
                backgroundColor: BreesColors.primary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.zero,
                shape: const StadiumBorder(),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  actionLabel,
                  style: const TextStyle(
                    fontSize: 12,
                    height: 24 / 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 32,
            top: 387,
            width: 285,
            height: 296,
            child: _EmailFooterCard(),
          ),
        ],
      ),
    );
  }
}

class _EmailFooterCard extends StatelessWidget {
  const _EmailFooterCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 32,
            top: 32,
            width: 221,
            height: 160,
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 14,
                  height: 21 / 14,
                ),
                children: [
                  TextSpan(text: 'This email was sent to '),
                  TextSpan(
                    text: 'iamcollinsdonye@gmail.com',
                    style: TextStyle(
                      color: Color(0xFF6875DE),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text:
                        '. If you’d rather not receive this kind of email, you can ',
                  ),
                  TextSpan(
                    text: 'unsubscribe or manage your email preferences.',
                    style: TextStyle(color: Color(0xFF6875DE)),
                  ),
                  TextSpan(
                    text:
                        '\n\nStripe, 510 Townsend Street, San Francisco CA 94103',
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: .5,
            right: .5,
            top: 208,
            height: 16,
            child: ColoredBox(color: Color(0xFFF7F9FC)),
          ),
          const Positioned(
            left: 32,
            top: 240,
            width: 221,
            height: 24,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Text(
                    'Brees',
                    style: TextStyle(
                      color: BreesColors.primary,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.alternate_email_rounded, color: Color(0xFF74849A), size: 20),
                      Icon(Icons.facebook_rounded, color: Color(0xFF74849A), size: 20),
                      Icon(Icons.business_center_outlined, color: Color(0xFF74849A), size: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
