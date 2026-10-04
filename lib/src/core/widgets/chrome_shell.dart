import 'package:flutter/material.dart';

import '../theme/brees_colors.dart';

class ChromeShell extends StatelessWidget {
  const ChromeShell({
    super.key,
    required this.child,
    this.address = 'getbrees.com',
  });

  final Widget child;
  final String address;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            width: 375,
            height: 94,
            child: ColoredBox(
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
                  Positioned(
                    left: 11,
                    right: 10,
                    bottom: 10,
                    height: 36,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8EAED),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.lock, size: 13),
                              const SizedBox(width: 6),
                              Text(
                                address,
                                style: const TextStyle(
                                  color: BreesColors.ink,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const Positioned(
                            right: 14,
                            child: Icon(
                              Icons.ios_share_rounded,
                              color: Color(0xFF8A8F98),
                              size: 19,
                            ),
                          ),
                        ],
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
            top: 94,
            bottom: 83,
            child: child,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 83,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Color(0xFFD8D8D8))),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.arrow_back_rounded, color: Color(0xFF858B91), size: 32),
                  Icon(Icons.arrow_forward_rounded, color: Color(0xFF858B91), size: 32),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0xFFE8EAED),
                  ),
                  _TabCount(),
                  Icon(Icons.more_horiz_rounded, color: Color(0xFF858B91), size: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabCount extends StatelessWidget {
  const _TabCount();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF858B91), width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Text(
        '4',
        style: TextStyle(
          color: Color(0xFF858B91),
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
