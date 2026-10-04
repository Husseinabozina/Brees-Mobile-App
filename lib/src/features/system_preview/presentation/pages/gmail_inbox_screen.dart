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
              top: 44,
              height: 91,
              child: _MailRow(
                avatarText: 'FC',
                avatarAsset: 'assets/images/gmail_fortune_avatar.png',
                title: 'Fortune Company co.',
                subject: 'Important Files!',
                preview: 'Make sure you receive these.',
                time: '11:27 pm',
                starred: true,
                attachments: true,
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 158,
              height: 44,
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
              top: 214,
              height: 40,
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
              top: 268,
              height: 59,
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
              top: 359,
              height: 59,
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
              top: 450,
              height: 59,
              child: _MailRow(
                avatarText: 'TG',
                avatarAsset: 'assets/images/gmail_taylor_avatar.png',
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
              top: 541,
              height: 59,
              child: _MailRow(
                avatarText: 'U',
                avatarAsset: 'assets/images/gmail_unique_avatar.png',
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
    final compact = subtitle.isEmpty;
    return Stack(
      children: [
        Positioned(
          left: 20,
          top: compact ? 4 : 13,
          child: Icon(icon, color: badgeColor, size: 20),
        ),
        Positioned(
          left: 66,
          right: 90,
          top: compact ? 0 : 0,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              height: 22 / 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (!compact)
          Positioned(
            left: 66,
            right: 90,
            top: 22,
            child: Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                height: 19 / 14,
                color: Color(0xFF606267),
              ),
            ),
          ),
        Positioned(
          right: 14,
          top: compact ? 0 : 9,
          child: Container(
            height: 22,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
              color: badgeColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              badge,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                height: 15 / 13,
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
    this.avatarAsset,
    this.avatarColor = const Color(0xFFE7EEF8),
    this.starred = false,
    this.attachments = false,
    this.onTap,
  });

  final String avatarText;
  final String? avatarAsset;
  final String title;
  final String subject;
  final String preview;
  final String time;
  final Color avatarColor;
  final bool starred;
  final bool attachments;
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
            top: 1,
            width: 37,
            height: 37,
            child: avatarAsset == null
                ? CircleAvatar(
                    radius: 18.5,
                    backgroundColor: avatarColor,
                    child: Text(
                      avatarText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        height: 20 / 16,
                      ),
                    ),
                  )
                : ClipOval(
                    child: Image.asset(avatarAsset!, fit: BoxFit.cover),
                  ),
          ),
          Positioned(
            left: 66,
            right: 67,
            top: 0,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF303030),
                fontSize: 16,
                height: 22 / 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            left: 66,
            right: 67,
            top: 23,
            child: Text(
              subject,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF303030),
                fontSize: 14,
                height: 16 / 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 66,
            right: 67,
            top: 43,
            child: Text(
              preview,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                height: 16 / 14,
                color: Color(0xFF5D5C5D),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 5,
            width: 52,
            child: Text(
              time,
              maxLines: 1,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color(0xFF303030),
                fontSize: 11,
                height: 14 / 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            right: 14,
            top: 33,
            child: Icon(
              starred ? Icons.star_rounded : Icons.star_border_rounded,
              color: starred ? const Color(0xFFFFC107) : const Color(0xFFADB3BA),
              size: 22,
            ),
          ),
          if (attachments)
            const Positioned(
              left: 66,
              top: 67,
              child: Row(
                children: [
                  _AttachmentChip(color: Color(0xFF4285F4)),
                  SizedBox(width: 8),
                  _AttachmentChip(color: Color(0xFFEA4335)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _AttachmentChip extends StatelessWidget {
  const _AttachmentChip({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 24,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFC8C8C8)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 8,
            top: 4,
            width: 16,
            height: 16,
            child: Icon(
              Icons.insert_drive_file_rounded,
              size: 16,
              color: color,
            ),
          ),
          const Positioned(
            left: 27,
            top: 4,
            width: 55,
            height: 16,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                'filename',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 14,
                  height: 16 / 14,
                ),
              ),
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
