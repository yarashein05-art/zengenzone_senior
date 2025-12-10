import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController ringController;

  @override
  void initState() {
    super.initState();

    ringController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Navigate after 3 seconds
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    ringController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // 🖼️ Full-screen background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            // put content near the top, not in the middle
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70), // move everything down a bit from top

              // 🔵 Top rotating Zen ring
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3), // background circle color
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: AnimatedBuilder(
                    animation: ringController,
                    builder: (_, __) {
                      return Transform.rotate(
                        angle: ringController.value * 6.3,
                        child: CustomPaint(
                          painter: ZenRingPainter(),
                        ),
                      );
                    },
                  ),
                ),
              ),


              const SizedBox(height: 16),

              Text(
                'One Zen, One Gen',
                style: GoogleFonts.goblinOne(
                  fontSize: 24,
                  fontWeight: FontWeight.w600, // semi-bold
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              Text(
                'Welcome to ZenGen Zone!',
                style: GoogleFonts.buda(
                  fontSize: 24,
                  fontWeight: FontWeight.w300, // Light
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),



            ],
          ),
        ),
      ),
    );
  }
}


// ========================
// Zen Ring Painter (top)
// ========================

class ZenRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint ring = Paint()
      ..color = Color(0xFF00B140)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Half circle spinner
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      0,
      3.14,
      false,
      ring,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
