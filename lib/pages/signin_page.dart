import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFDBFF),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // BACK ARROW
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 22,
                      color: Color(0xFF008C33),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // LOGO
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 125,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/signinlogo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // TITLE
                Text(
                  "Sign in your account",
                  style: GoogleFonts.poppins(
                    fontSize: 26.72,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF008C33),
                  ),
                ),

                const SizedBox(height: 30),

                // PHONE NUMBER LABEL
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Phone Number",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF008C33),
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                // PHONE NUMBER FIELD
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IntlPhoneField(
                    initialCountryCode: 'LB',
                    showDropdownIcon: true,
                    dropdownIcon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF517861)),

                    decoration: InputDecoration(
                      hintText: "Phone Number",
                      hintStyle: GoogleFonts.poppins(
                        color: const Color(0xFF517861),
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    ),

                    style: GoogleFonts.poppins(
                      color: const Color(0xFF517861),
                      fontSize: 16,
                    ),

                    dropdownTextStyle: GoogleFonts.poppins(
                      color: const Color(0xFF517861),
                      fontSize: 16,
                    ),

                    onChanged: (phone) {},
                    onCountryChanged: (country) {},
                  ),
                ),

                const SizedBox(height: 20),

                // PASSWORD LABEL
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF008C33),
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                // PASSWORD FIELD
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    obscureText: _obscurePassword,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF517861),
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "********",
                      hintStyle: GoogleFonts.poppins(
                        color: const Color(0xFF517861),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: const Color(0xFF517861),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                // FORGOT PASSWORD
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Forgot password?",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // SIGN IN BUTTON
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF008C33),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "SIGN IN",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // OR TEXT
                Text(
                  "or sign in with",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color(0xFF517861),
                  ),
                ),

                const SizedBox(height: 12),

                // GOOGLE ICON BUTTON
                Container(
                  height: 44,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/google_icon.png",
                      height: 30,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // SIGN UP LINK
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: const Color(0xFF517861),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        "SIGN UP",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF008C33),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

