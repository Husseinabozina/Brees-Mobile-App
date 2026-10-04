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
        child: Stack(
          children: [
            const Positioned(
              left: 12,
              top: 4,
              child: Text(
                'PRIMARY',
                style: TextStyle(
                  color: Color(0xFF65676C),
                  fontSize: 14,
                  height: 18 / 14,
                  letterSpacing: 1.33,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 34,
              height: 82,
              child: _MailRow(
                avatarText: 'FC',
                title: 'Fortune Company co.',
                subject: 'Important Files!',
                preview: 'Make sure you receive these.',
                time: '11:27 pm',
                starred: true,
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 116,
              height: 56,
              child: _CategoryRow(
                icon: Icons.people_outline_rounded,
                title: 'Social',
                subtitle: 'Twitter, Twitter',
                badge: '2 new',
                badgeColor: Color(0xFF1A73E9),
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 172,
              height: 56,
              child: _CategoryRow(
                icon: Icons.sell_outlined,
                title: 'Promotions',
                subtitle: '',
                badge: '99+ new',
                badgeColor: Color(0xFF198039),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 228,
              height: 82,
              child: _MailRow(
                avatarText: 'Br',
                title: 'Brees:  Forgot password',
                subject: 'When do we meet again?',
                preview: 'I would meet at the Western Mall if you..',
                time: '11:27 pm',
                avatarColor: const Color(0xFF3213DD),
                onTap: onOpenBreesMail,
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 310,
              height: 82,
              child: _MailRow(
                avatarText: 'R',
                title: 'Random Bank Online',
                subject: 'Random Bank Account Balance Update',
                preview: 'Time to check your bank information an..',
                time: 'June 19',
                avatarColor: Color(0xFFB3988E),
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 392,
              height: 82,
              child: _MailRow(
                avatarText: 'TG',
                title: 'Taylor Grey',
                subject: 'Timesheet nextweek?',
                preview: 'Hey what was our timesheet that was for..',
                time: 'May 6',
                starred: true,
                avatarColor: Color(0xFF70C7D5),
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 474,
              height: 82,
              child: _MailRow(
                avatarText: 'U',
                title: 'UniqueYou by SecretKissShop',
                subject: 'Learn new Tricks',
                preview: 'Now is great time to shop great new fash..',
                time: 'May 6',
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 70,
              child: _GmailBottomNav(),
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
    return Stack(
      children: [
        Positioned(
          left: 18,
          top: 17,
          child: Icon(icon, color: badgeColor, size: 22),
        ),
        Positioned(
          left: 68,
          right: 86,
          top: subtitle.isEmpty ? 19 : 8,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              height: 20 / 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (subtitle.isNotEmpty)
          Positioned(
            left: 68,
            right: 86,
            top: 31,
            child: Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                height: 18 / 14,
                color: Color(0xFF606267),
              ),
            ),
          ),
        Positioned(
          right: 14,
          top: 14,
          child: Container(
            height: 28,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: badgeColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              badge,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                height: 16 / 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
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
      behavior: HitTestBehavior.opaque,
      child: Stack(
        children: [
          Positioned(
            left: 12,
            top: 22,
            width: 38,
            height: 38,
            child: CircleAvatar(
              radius: 19,
              backgroundColor: avatarColor,
              child: Text(
                avatarText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 20 / 16,
                ),
              ),
            ),
          ),
          Positioned(
            left: 66,
            right: 67,
            top: 8,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                height: 20 / 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            left: 66,
            right: 67,
            top: 31,
            child: Text(
              subject,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                height: 18 / 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 66,
            right: 67,
            top: 52,
            child: Text(
              preview,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                height: 18 / 14,
                color: Color(0xFF5D5C5D),
              ),
            ),
          ),
          Positioned(
            right: 12,
            top: 10,
            width: 48,
            child: Text(
              time,
              maxLines: 1,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 11,
                height: 14 / 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            right: 18,
            top: 41,
            child: Icon(
              starred ? Icons.star_rounded : Icons.star_border_rounded,
              color: starred ? const Color(0xFFFFC107) : const Color(0xFFADB3BA),
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}

class _GmailBottomNav extends StatelessWidget {
  const _GmailBottomNav();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFD0D0D0))),
      ),
      child: const Stack(
        children: [
          Positioned(
            left: 54,
            top: 11,
            width: 58,
            height: 49,
            child: _BottomItem(
              icon: Icons.mail_outline_rounded,
              label: 'Mail',
              active: true,
            ),
          ),
          Positioned(
            right: 54,
            top: 11,
            width: 58,
            height: 49,
            child: _BottomItem(
              icon: Icons.videocam_outlined,
              label: 'Meet',
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomItem extends StatelessWidget {
  const _BottomItem({
    required this.icon,
    required this.label,
    this.active = false,
  });

  final IconData icon;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final color = active ? const Color(0xFFEA4335) : const Color(0xFF666666);
    return Stack(
      children: [
        Positioned(
          left: 17,
          top: 0,
          child: Icon(icon, color: color, size: 24),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 14,
              height: 18 / 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
