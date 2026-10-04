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
                padding: const EdgeInsets.symmetric(horizontal: 14),
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
                child: const Row(
                  children: [
                    Icon(Icons.menu_rounded, color: Color(0xFF5F6368)),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Search in mail',
                        style: TextStyle(
                          color: Color(0xFF5F6368),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Color(0xFFD7D7D7),
                      child: Icon(Icons.person, size: 18),
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
