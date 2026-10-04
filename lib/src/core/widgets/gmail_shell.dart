import 'package:flutter/material.dart';

class GmailShell extends StatelessWidget {
  const GmailShell({
    super.key,
    required this.child,
    this.showSearch = false,
  });

  final Widget child;
  final bool showSearch;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Stack(
        children: [
          const Positioned(
            left: 20,
            top: 14,
            child: Text(
              '9:41',
              style: TextStyle(
                color: Color(0xFF161719),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Positioned(
            right: 16,
            top: 15,
            child: Row(
              children: [
                Icon(Icons.signal_cellular_alt_rounded, size: 16),
                SizedBox(width: 4),
                Icon(Icons.wifi_rounded, size: 16),
                SizedBox(width: 4),
                Icon(Icons.battery_full_rounded, size: 20),
              ],
            ),
          ),
          if (showSearch)
            Positioned(
              left: 11,
              right: 11,
              top: 61,
              height: 46,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      left: 14,
                      top: 11,
                      child: Icon(
                        Icons.menu_rounded,
                        color: Color(0xFF5F6368),
                        size: 22,
                      ),
                    ),
                    const Positioned(
                      left: 47,
                      top: 12,
                      child: Text(
                        'Search in mail',
                        style: TextStyle(
                          color: Color(0xFF5F6368),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 12,
                      top: 8,
                      width: 28,
                      height: 28,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/gmail_profile_avatar.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Positioned.fill(
            top: showSearch ? 118 : 44,
            child: child,
          ),
        ],
      ),
    );
  }
}
