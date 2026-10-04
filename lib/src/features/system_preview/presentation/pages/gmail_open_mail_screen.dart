import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_button.dart';
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(13, 12, 13, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      key: const Key('gmail-open-back'),
                      onTap: onBack,
                      behavior: HitTestBehavior.opaque,
                      child: const SizedBox(
                        width: 36,
                        height: 36,
                        child: Icon(Icons.arrow_back_rounded, color: Color(0xFF5F6368)),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.archive_outlined, color: Color(0xFF5F6368)),
                    const SizedBox(width: 24),
                    const Icon(Icons.delete_outline_rounded, color: Color(0xFF5F6368)),
                    const SizedBox(width: 24),
                    const Icon(Icons.mark_email_unread_outlined, color: Color(0xFF5F6368)),
                    const SizedBox(width: 24),
                    const Icon(Icons.more_vert_rounded, color: Color(0xFF5F6368)),
                  ],
                ),
                const SizedBox(height: 28),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Brees; Email Verification',
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        child: Text('Inbox', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                    SizedBox(width: 18),
                    Icon(Icons.star_border_rounded, color: Color(0xFF9AA0A6)),
                  ],
                ),
                const SizedBox(height: 28),
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 19,
                      backgroundColor: BreesColors.primary,
                      child: Text('Br', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('GetBrees', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        Text('to me⌄', style: TextStyle(color: Color(0xFF5F6267), fontSize: 14)),
                      ],
                    ),
                    Spacer(),
                    Text('May 6', style: TextStyle(color: Color(0xFF686B70), fontSize: 12)),
                    SizedBox(width: 16),
                    Icon(Icons.reply_rounded, color: Color(0xFF5F6368)),
                    SizedBox(width: 14),
                    Icon(Icons.more_vert_rounded, color: Color(0xFF5F6368)),
                  ],
                ),
                const SizedBox(height: 28),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(32, 56, 32, 32),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F6FF),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Brees',
                        style: TextStyle(
                          color: BreesColors.primary,
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 54),
                      const Text(
                        'Forgot Password!',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 26),
                      const Text('Hi, Collins Donye', style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 24),
                      const Text(
                        'Simply click the big blue button\nto create a new password',
                        style: TextStyle(fontSize: 14, height: 1.6),
                      ),
                      const SizedBox(height: 18),
                      BreesButton(
                        label: actionLabel,
                        width: 157,
                        height: 40,
                        onPressed: onPrimaryAction,
                      ),
                      const SizedBox(height: 32),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text.rich(
                          TextSpan(
                            style: TextStyle(fontSize: 14, height: 1.45, color: Color(0xFF333333)),
                            children: [
                              TextSpan(text: 'This email was sent to\n'),
                              TextSpan(text: 'iamcollinsdonye@gmail.com', style: TextStyle(color: Color(0xFF6875DE), decoration: TextDecoration.underline)),
                              TextSpan(text: '. If you’d rather not receive this kind of email, you can '),
                              TextSpan(text: 'unsubscribe or manage your email preferences.', style: TextStyle(color: Color(0xFF6875DE))),
                              TextSpan(text: '\n\nStripe, 510 Townsend Street, San Francisco CA 94103'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        children: [
                          Text('Brees', style: TextStyle(color: BreesColors.primary, fontSize: 22, fontWeight: FontWeight.w900)),
                          Spacer(),
                          Icon(Icons.alternate_email_rounded, color: Color(0xFF74849A)),
                          SizedBox(width: 24),
                          Icon(Icons.facebook_rounded, color: Color(0xFF74849A)),
                          SizedBox(width: 24),
                          Icon(Icons.business_center_outlined, color: Color(0xFF74849A)),
                        ],
                      ),
                    ],
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
