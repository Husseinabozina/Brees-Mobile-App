import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theme/brees_colors.dart';
import '../../../../core/widgets/brees_status_bar.dart';
import '../../../../core/widgets/brees_top_nav.dart';
import '../../../../core/widgets/design_canvas.dart';
import '../../../../core/widgets/home_indicator.dart';
import '../widgets/finance_bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.onHome,
    required this.onBudget,
    required this.onInsights,
    required this.onEditProfile,
    required this.onSettings,
    required this.onHelpCenter,
  });

  final VoidCallback onHome;
  final VoidCallback onBudget;
  final VoidCallback onInsights;
  final VoidCallback onEditProfile;
  final VoidCallback onSettings;
  final VoidCallback onHelpCenter;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: BreesColors.primary,
      child: ColoredBox(
        color: BreesColors.primary,
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              child: BreesStatusBar(
                foreground: Colors.white,
                assetPath: 'assets/images/status_white.png',
              ),
            ),
            const Positioned(
              left: 20,
              top: 58,
              child: Text(
                'Profile',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            Positioned(
              right: 20,
              top: 58,
              child: GestureDetector(
                key: const Key('profile-edit'),
                onTap: onEditProfile,
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Color(0xFFD8D2FF),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 21,
              top: 112,
              width: 80,
              height: 80,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile_avatar.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
              left: 117,
              top: 132,
              child: Text(
                'Donye Collins',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Positioned(
              left: 117,
              top: 160,
              child: Text(
                'Iamcollinsdonye@gmail.com',
                style: TextStyle(
                  color: Color(0xFFE8E4FF),
                  fontSize: 12,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 215,
              width: 375,
              height: 597,
              child: Container(
                decoration: const BoxDecoration(
                  color: BreesColors.canvas,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 24,
                      right: 24,
                      top: 33,
                      child: Column(
                        children: [
                          _ProfileMenuRow(
                            icon: Icons.person_rounded,
                            label: 'My Account',
                            onTap: onEditProfile,
                          ),
                          _ProfileMenuRow(
                            icon: Icons.settings_rounded,
                            label: 'Settings',
                            onTap: onSettings,
                          ),
                          _ProfileMenuRow(
                            icon: Icons.help_rounded,
                            label: 'Help Center',
                            onTap: onHelpCenter,
                          ),
                          const _ProfileMenuRow(
                            icon: Icons.phone_rounded,
                            label: 'Contact',
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      left: 29,
                      right: 29,
                      bottom: 121,
                      child: Text(
                        'You joined Brees on September 2021. It’s been 1 month\nsince then and our mission is still the same, help you\nbetter manage your finance like a brees.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFB3B6C2),
                          fontSize: 12,
                          height: 18 / 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 82,
              child: FinanceBottomNav(
                activeTab: FinanceTab.profile,
                light: true,
                onHome: onHome,
                onBudget: onBudget,
                onInsights: onInsights,
                onProfile: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileMenuRow extends StatelessWidget {
  const _ProfileMenuRow({
    required this.icon,
    required this.label,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 72,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 8,
              width: 48,
              height: 48,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E5FF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF7467E9),
                  size: 22,
                ),
              ),
            ),
            Positioned(
              left: 64,
              top: 22,
              child: Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF15141F),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Positioned(
              right: 2,
              top: 20,
              child: Icon(
                Icons.chevron_right_rounded,
                color: Color(0xFFCAD0D8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({
    super.key,
    required this.onBack,
    required this.onSave,
  });

  final VoidCallback onBack;
  final VoidCallback onSave;

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
                foreground: Color(0xFF121826),
                assetPath: 'assets/images/status_dark.png',
              ),
            ),
            BreesTopNav(title: 'My Account', onBack: onBack),
            Positioned(
              left: 128,
              top: 156,
              width: 120,
              height: 120,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/profile_avatar.png',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: -2,
                    bottom: -1,
                    child: Container(
                      width: 44,
                      height: 44,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF776BE9),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: const Icon(
                        Icons.photo_camera_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              left: 20,
              top: 356,
              child: _ProfileField(label: 'Name', value: 'Donye Collins'),
            ),
            const Positioned(
              left: 20,
              top: 444,
              child: _ProfileField(
                label: 'Email',
                value: 'Louis04real@gmail.com',
              ),
            ),
            const Positioned(
              left: 20,
              top: 532,
              child: _ProfileField(
                label: 'Phone Number',
                value: '+23408146185683',
              ),
            ),
            Positioned(
              left: 20,
              top: 688,
              width: 335,
              height: 64,
              child: FilledButton(
                key: const Key('profile-save'),
                onPressed: onSave,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFE9E9FF),
                  foregroundColor: const Color(0xFF4A44C6),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const HomeIndicator(color: Color(0xFFE0E3E9)),
          ],
        ),
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  const _ProfileField({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 13,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF8F94A3),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 34,
            right: 20,
            child: Text(
              value,
              maxLines: 1,
              style: const TextStyle(
                color: Color(0xFF040C22),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
    required this.onBack,
    required this.onPassword,
    required this.onNotifications,
  });

  final VoidCallback onBack;
  final VoidCallback onPassword;
  final VoidCallback onNotifications;

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
                foreground: Color(0xFF121826),
                assetPath: 'assets/images/status_dark.png',
              ),
            ),
            BreesTopNav(title: 'Settings', onBack: onBack),
            const Positioned(
              left: 24,
              top: 130,
              child: Text(
                'General',
                style: TextStyle(color: Color(0xFF6C727F), fontSize: 14),
              ),
            ),
            Positioned(
              left: 24,
              top: 170,
              width: 327,
              child: _SettingsRow(
                label: 'Reset Password',
                onTap: onPassword,
              ),
            ),
            Positioned(
              left: 24,
              top: 218,
              width: 327,
              child: _SettingsRow(
                label: 'Notifications',
                onTap: onNotifications,
              ),
            ),
            const Positioned(
              left: 24,
              top: 298,
              child: Text(
                'Security',
                style: TextStyle(color: Color(0xFF6C727F), fontSize: 14),
              ),
            ),
            const Positioned(
              left: 24,
              top: 337,
              width: 327,
              child: _SettingsRow(
                label: 'Privacy Policy',
                subtitle: 'Choose what data you share with us',
              ),
            ),
            Positioned(
              left: 24,
              top: 632,
              width: 327,
              height: 64,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFD9DDF0)),
                  foregroundColor: BreesColors.primary,
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 741,
              child: Text(
                'Brees © 2021 v1.0',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFADB3BE), fontSize: 14),
              ),
            ),
            const HomeIndicator(color: Color(0xFFE0E3E9)),
          ],
        ),
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({required this.label, this.subtitle, this.onTap});

  final String label;
  final String? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: subtitle == null ? 40 : 58,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF121826),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (subtitle != null)
              Positioned(
                left: 0,
                top: 30,
                child: Text(
                  subtitle!,
                  style: const TextStyle(
                    color: Color(0xFF6C727F),
                    fontSize: 12,
                  ),
                ),
              ),
            const Positioned(
              right: 0,
              top: 0,
              child: Icon(Icons.chevron_right_rounded, size: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordSettingsScreen extends StatelessWidget {
  const PasswordSettingsScreen({
    super.key,
    required this.onBack,
    required this.onSave,
  });

  final VoidCallback onBack;
  final VoidCallback onSave;

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
                foreground: Color(0xFF121826),
                assetPath: 'assets/images/status_dark.png',
              ),
            ),
            BreesTopNav(title: 'Password', onBack: onBack),
            const Positioned(
              left: 20,
              top: 140,
              child: _PasswordField(
                label: 'Old Password',
                hint: 'Enter old password',
              ),
            ),
            const Positioned(
              left: 20,
              top: 228,
              child: _PasswordField(
                label: 'New Password',
                hint: 'Enter new password',
              ),
            ),
            const Positioned(
              left: 20,
              top: 316,
              child: _PasswordField(
                label: 'Retype New Password',
                hint: 'Retype new password',
              ),
            ),
            Positioned(
              left: 20,
              top: 688,
              width: 335,
              height: 64,
              child: FilledButton(
                onPressed: onSave,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFE9E9FF),
                  foregroundColor: const Color(0xFF4A44C6),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const HomeIndicator(color: Color(0xFFE0E3E9)),
          ],
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({required this.label, required this.hint});

  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 13,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF8F94A3),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 34,
            child: Text(
              hint,
              style: const TextStyle(
                color: Color(0xFF9EA4AF),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({
    super.key,
    required this.onBack,
  });

  final VoidCallback onBack;

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool transaction = true;
  bool insight = false;
  bool sort = false;

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
                foreground: Color(0xFF121826),
                assetPath: 'assets/images/status_dark.png',
              ),
            ),
            BreesTopNav(title: 'Notifications', onBack: widget.onBack),
            Positioned(
              left: 24,
              right: 24,
              top: 130,
              child: Column(
                children: [
                  _NotificationToggleRow(
                    label: 'Transaction alert',
                    value: transaction,
                    onChanged: (value) => setState(() => transaction = value),
                  ),
                  _NotificationToggleRow(
                    label: 'Insight alert',
                    value: insight,
                    onChanged: (value) => setState(() => insight = value),
                  ),
                  _NotificationToggleRow(
                    label: 'Sort Transactions alert',
                    value: sort,
                    onChanged: (value) => setState(() => sort = value),
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

class _NotificationToggleRow extends StatelessWidget {
  const _NotificationToggleRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF15141F),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: const Color(0xFF456CF5),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFFE5E7EB),
          ),
        ],
      ),
    );
  }
}

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({
    super.key,
    required this.onBack,
    required this.onTopic,
  });

  final VoidCallback onBack;
  final VoidCallback onTopic;

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: const Color(0xFF210EA4),
      child: ColoredBox(
        color: const Color(0xFF210EA4),
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              child: BreesStatusBar(
                foreground: Colors.white,
                assetPath: 'assets/images/status_white.png',
              ),
            ),
            Positioned(
              left: 20,
              top: 61,
              child: GestureDetector(
                onTap: onBack,
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withValues(alpha: .18),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 20,
              top: 130,
              child: Text(
                'Have a burning Question?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 182,
              width: 335,
              height: 53,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Stack(
                  children: [
                    Positioned(
                      left: 18,
                      top: 16,
                      child: Icon(
                        Icons.search_rounded,
                        color: Color(0xFFA8B5FF),
                        size: 21,
                      ),
                    ),
                    Positioned(
                      left: 50,
                      top: 17,
                      child: Text(
                        'Search transactions',
                        style: TextStyle(
                          color: Color(0xFF9CA0AA),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 278,
              width: 375,
              height: 534,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      left: 164,
                      top: 16,
                      width: 47,
                      height: 5,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFE0E3E9),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 20,
                      top: 52,
                      child: Text(
                        'Topics',
                        style: TextStyle(
                          color: Color(0xFF210EA4),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 20,
                      top: 52,
                      child: Text(
                        'View all',
                        style: TextStyle(
                          color: BreesColors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 90,
                      width: 335,
                      height: 186,
                      child: _HelpTopicCard(
                        title: 'How to sort transactions on Brees?',
                        asset: 'assets/images/bank_kuda.png',
                        onTap: onTopic,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 292,
                      width: 335,
                      height: 186,
                      child: _HelpTopicCard(
                        title: 'How to add bank account to Brees?',
                        asset: 'assets/images/budget_piggy.png',
                        onTap: onTopic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HelpTopicCard extends StatelessWidget {
  const _HelpTopicCard({
    required this.title,
    required this.asset,
    required this.onTap,
  });

  final String title;
  final String asset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7FF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 24,
              top: 24,
              right: 22,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF263154),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Positioned(
              left: 24,
              top: 59,
              width: 243,
              child: Text(
                'You can add your multiple bank accounts including, Piggyvest savings, Crypto wallets, ...',
                style: TextStyle(
                  color: Color(0xFF3E4968),
                  fontSize: 14,
                  height: 24 / 14,
                ),
              ),
            ),
            const Positioned(
              left: 24,
              bottom: 25,
              child: Text(
                'View Topic',
                style: TextStyle(
                  color: Color(0xFF210EA4),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ),
            Positioned(
              right: 15,
              bottom: 12,
              width: 86,
              height: 86,
              child: Image.asset(asset, fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}

class HelpCenterTopicScreen extends StatelessWidget {
  const HelpCenterTopicScreen({
    super.key,
    required this.onBack,
  });

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    const paragraph =
        'You can add your multiple bank accounts including, Piggyvest savings, Crypto wallets. You can add your multiple bank accounts including, Piggyvest savings, Crypto walletsYou can add your multiple bank accounts including, Piggyvest savings, Crypto wallets.';

    return DesignCanvas(
      background: BreesColors.canvas,
      child: ColoredBox(
        color: BreesColors.canvas,
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              child: BreesStatusBar(
                foreground: Color(0xFF121826),
                assetPath: 'assets/images/status_dark.png',
              ),
            ),
            BreesTopNav(title: 'Topic details', onBack: onBack),
            const Positioned(
              left: 20,
              top: 132,
              child: Text(
                'How to add bank account to Brees?',
                style: TextStyle(
                  color: Color(0xFF210EA4),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Positioned(
              left: 20,
              top: 175,
              width: 335,
              child: Text(
                paragraph,
                style: TextStyle(
                  color: Color(0xFF6C727F),
                  fontSize: 14,
                  height: 21 / 14,
                ),
              ),
            ),
            const Positioned(
              left: 20,
              top: 319,
              width: 335,
              child: Text(
                paragraph,
                style: TextStyle(
                  color: Color(0xFF6C727F),
                  fontSize: 14,
                  height: 21 / 14,
                ),
              ),
            ),
            const Positioned(
              left: 20,
              top: 463,
              width: 335,
              child: Text(
                paragraph,
                style: TextStyle(
                  color: Color(0xFF6C727F),
                  fontSize: 14,
                  height: 21 / 14,
                ),
              ),
            ),
            const Positioned(
              left: 20,
              top: 620,
              child: Text(
                'Did that help solve your question?',
                style: TextStyle(
                  color: Color(0xFF210EA4),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 657,
              child: Row(
                children: [
                  _FeedbackButton(label: 'Yes', onTap: () {}),
                  const SizedBox(width: 8),
                  _FeedbackButton(label: 'No', onTap: () {}),
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

class _FeedbackButton extends StatelessWidget {
  const _FeedbackButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
        decoration: BoxDecoration(
          color: BreesColors.primary.withValues(alpha: .1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: BreesColors.primary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class HomeLoadingScreen extends StatefulWidget {
  const HomeLoadingScreen({
    super.key,
    required this.onFinished,
    required this.onHome,
    required this.onBudget,
    required this.onInsights,
    required this.onProfile,
  });

  final VoidCallback onFinished;
  final VoidCallback onHome;
  final VoidCallback onBudget;
  final VoidCallback onInsights;
  final VoidCallback onProfile;

  @override
  State<HomeLoadingScreen> createState() => _HomeLoadingScreenState();
}

class _HomeLoadingScreenState extends State<HomeLoadingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();
    _timer = Timer(const Duration(milliseconds: 1500), widget.onFinished);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DesignCanvas(
      background: BreesColors.primary,
      child: ColoredBox(
        color: BreesColors.primary,
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              child: BreesStatusBar(
                foreground: Colors.white,
                assetPath: 'assets/images/status_white.png',
              ),
            ),
            Positioned(
              left: 163,
              top: 370,
              width: 50,
              height: 50,
              child: RotationTransition(
                turns: _controller,
                child: const Icon(
                  Icons.progress_activity_rounded,
                  color: Color(0xFFAFA5FF),
                  size: 44,
                ),
              ),
            ),
            const Positioned(
              left: 20,
              right: 20,
              top: 431,
              child: Text(
                'Please wait, content of the page is loading...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFDCD8FF),
                  fontSize: 14,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 82,
              child: FinanceBottomNav(
                activeTab: FinanceTab.home,
                onHome: widget.onHome,
                onBudget: widget.onBudget,
                onInsights: widget.onInsights,
                onProfile: widget.onProfile,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
