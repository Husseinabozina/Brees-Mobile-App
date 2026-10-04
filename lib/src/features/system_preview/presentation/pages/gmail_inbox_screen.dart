import 'package:flutter/material.dart';

import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/gmail_shell.dart';

class GmailInboxScreen extends StatelessWidget {
  const GmailInboxScreen({super.key, required this.onOpenBreesMail});

  final VoidCallback onOpenBreesMail;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: Colors.white,
      child: GmailShell(
        showSearch: true,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(12, 4, 12, 14),
                child: Text(
                  'PRIMARY',
                  style: TextStyle(
                    color: Color(0xFF65676C),
                    fontSize: 14,
                    letterSpacing: 1.33,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const _MailRow(
              avatarText: 'FC',
              title: 'Fortune Company co.',
              subject: 'Important Files!',
              preview: 'Make sure you receive these.',
              time: '11:27 pm',
              starred: true,
            ),
            const _CategoryRow(
              icon: Icons.people_outline_rounded,
              title: 'Social',
              subtitle: 'Twitter, Twitter',
              badge: '2 new',
              badgeColor: Color(0xFF1A73E9),
            ),
            const _CategoryRow(
              icon: Icons.sell_outlined,
              title: 'Promotions',
              subtitle: '',
              badge: '99+ new',
              badgeColor: Color(0xFF198039),
            ),
            _MailRow(
              avatarText: 'Br',
              title: 'Brees:  Forgot password',
              subject: 'When do we meet again?',
              preview: 'I would meet at the Western Mall if you..',
              time: '11:27 pm',
              avatarColor: const Color(0xFF3213DD),
              onTap: onOpenBreesMail,
            ),
            const _MailRow(
              avatarText: 'R',
              title: 'Random Bank Online',
              subject: 'Random Bank Account Balance Update',
              preview: 'Time to check your bank information an..',
              time: 'June 19',
              avatarColor: Color(0xFFB3988E),
            ),
            const _MailRow(
              avatarText: 'TG',
              title: 'Taylor Grey',
              subject: 'Timesheet nextweek?',
              preview: 'Hey what was our timesheet that was for..',
              time: 'May 6',
              starred: true,
              avatarColor: Color(0xFF70C7D5),
            ),
            const _MailRow(
              avatarText: 'U',
              title: 'UniqueYou by SecretKissShop',
              subject: 'Learn new Tricks',
              preview: 'Now is great time to shop great new fash..',
              time: 'May 6',
            ),
            const Spacer(),
            Container(
              height: 70,
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xFFD0D0D0))),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _BottomItem(icon: Icons.mail_outline_rounded, label: 'Mail', active: true),
                  _BottomItem(icon: Icons.videocam_outlined, label: 'Meet'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryRow extends StatelessWidget {
  const _CategoryRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.badgeColor,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String badge;
  final Color badgeColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          const SizedBox(width: 18),
          Icon(icon, color: badgeColor, size: 22),
          const SizedBox(width: 28),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                if (subtitle.isNotEmpty)
                  Text(subtitle, style: const TextStyle(fontSize: 14, color: Color(0xFF606267))),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 14),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(50)),
            child: Text(badge, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}

class _MailRow extends StatelessWidget {
  const _MailRow({
    required this.avatarText,
    required this.title,
    required this.subject,
    required this.preview,
    required this.time,
    this.avatarColor = const Color(0xFFE7EEF8),
    this.starred = false,
    this.onTap,
  });

  final String avatarText;
  final String title;
  final String subject;
  final String preview;
  final String time;
  final Color avatarColor;
  final bool starred;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 82,
        child: Row(
          children: [
            const SizedBox(width: 12),
            CircleAvatar(
              radius: 19,
              backgroundColor: avatarColor,
              child: Text(avatarText, style: const TextStyle(color: Colors.white, fontSize: 16)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  Text(subject, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  Text(preview, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, color: Color(0xFF5D5C5D))),
                ],
              ),
            ),
            SizedBox(
              width: 58,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(time, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Icon(
                    starred ? Icons.star_rounded : Icons.star_border_rounded,
                    color: starred ? const Color(0xFFFFC107) : const Color(0xFFADB3BA),
                    size: 22,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  const _BottomItem({required this.icon, required this.label, this.active = false});

  final IconData icon;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? const Color(0xFFEA4335) : const Color(0xFF666666);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
