import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool termsAccepted = false;

  String selectedGender = "Male";
  String selectedAge = "13";
  String selectedHabit = "sports";

  bool showOtherHabitField = false;
  TextEditingController otherHabitController = TextEditingController();

  final List<String> teenAges = [
    "13", "14", "15", "16", "17", "18", "19"
  ];

  final List<String> genderList = [
    "Male",
    "Female",
  ];

  final List<String> habitList = [
    "sports",
    "drawing",
    "singing",
    "writing",
    "journaling",
    "reading",
    "other",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFDBFF),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

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

              const SizedBox(height: 20),

              // TITLE
              Text(
                "Create your account",
                style: GoogleFonts.poppins(
                  fontSize: 26.72,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF008C33),
                ),
              ),

              const SizedBox(height: 25),

              // NAME
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xFF008C33),
                  ),
                ),
              ),
              const SizedBox(height: 6),

              _buildInput("ex: yara baydoun"),

              const SizedBox(height: 15),

              // EMAIL
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xFF008C33),
                  ),
                ),
              ),
              const SizedBox(height: 6),

              _buildInput("ex: yara.baydoun@email.com"),

              const SizedBox(height: 15),

              // PHONE NUMBER
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Phone Number",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xFF008C33),
                  ),
                ),
              ),

              Row(
                children: [
                  // PHONE FIELD — takes most of the space
                  Expanded(
                    flex: 4, // phone field gets more width
                    child: _buildPhoneField(),
                  ),

                  const SizedBox(width: 8),

                  // SEND CODE BUTTON — smaller + shorter text size
                  SizedBox(
                    height: 50, // matches phone field height visually
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF008C33),
                        padding: const EdgeInsets.symmetric(horizontal: 12), // smaller width
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Send code",
                        style: GoogleFonts.poppins(
                          fontSize: 12,   // 🔥 smaller text to fit nicely
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),


              const SizedBox(height: 15),

              // PASSWORD
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xFF008C33),
                  ),
                ),
              ),

              const SizedBox(height: 6),

              _buildPasswordField(),

              const SizedBox(height: 15),

              // CONFIRM PASSWORD
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Confirm password",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xFF008C33),
                  ),
                ),
              ),

              const SizedBox(height: 6),

              _buildConfirmPasswordField(),

              const SizedBox(height: 15),

              // GENDER
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gender",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Color(0xFF008C33),
                  ),
                ),
              ),

              const SizedBox(height: 6),

              _buildDropdown(genderList, selectedGender, (val) {
                setState(() {
                  selectedGender = val!;
                });
              }),

              const SizedBox(height: 15),

              // AGE
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Age",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Color(0xFF008C33),
                  ),
                ),
              ),

              const SizedBox(height: 6),

              _buildDropdown(teenAges, selectedAge, (val) {
                setState(() {
                  selectedAge = val!;
                });
              }),

              const SizedBox(height: 15),

              // LOCATION
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Location",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Color(0xFF008C33),
                  ),
                ),
              ),

              const SizedBox(height: 6),

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Tap to pick a location",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // HABIT
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Habit",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Color(0xFF008C33),
                  ),
                ),
              ),

              const SizedBox(height: 6),

              _buildHabitDropdown(),

              const SizedBox(height: 15),

              // TERMS
              Row(
                children: [
                  Checkbox(
                    value: termsAccepted,
                    activeColor: const Color(0xFF008C33),
                    onChanged: (value) {
                      setState(() => termsAccepted = value!);
                    },
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: "I understood the ",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: const Color(0xFF517861),
                        ),
                        children: [
                          TextSpan(
                            text: "terms & policy.",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: const Color(0xFF008C33),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 15),

              // SIGN UP BUTTON
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
                    "SIGN UP",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // SIGN IN TEXT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account? ",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: const Color(0xFF517861),
                    ),
                  ),
                  Text(
                    "SIGN IN",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF008C33),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // INPUT FIELD
  Widget _buildInput(String hint) {
    return TextField(
      style: GoogleFonts.poppins(
        color: const Color(0xFF517861),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          color: const Color(0xFF517861),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // PHONE FIELD
  Widget _buildPhoneField() {
    return IntlPhoneField(
      initialCountryCode: "LB",
      dropdownTextStyle: GoogleFonts.poppins(
        color: const Color(0xFF517861),
      ),
      style: GoogleFonts.poppins(
        color: const Color(0xFF517861),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Phone Number",
        hintStyle: GoogleFonts.poppins(
          color: const Color(0xFF517861),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // PASSWORD FIELD
  Widget _buildPasswordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        obscureText: obscurePassword,
        style: GoogleFonts.poppins(color: const Color(0xFF517861)),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "********",
          hintStyle: GoogleFonts.poppins(color: const Color(0xFF517861)),
          suffixIcon: IconButton(
            icon: Icon(
              obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: const Color(0xFF517861),
            ),
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          ),
        ),
      ),
    );
  }

  // CONFIRM PASSWORD FIELD
  Widget _buildConfirmPasswordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        obscureText: obscureConfirmPassword,
        style: GoogleFonts.poppins(color: const Color(0xFF517861)),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "********",
          hintStyle: GoogleFonts.poppins(color: const Color(0xFF517861)),
          suffixIcon: IconButton(
            icon: Icon(
              obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
              color: const Color(0xFF517861),
            ),
            onPressed: () {
              setState(() {
                obscureConfirmPassword = !obscureConfirmPassword;
              });
            },
          ),
        ),
      ),
    );
  }

  // GENERIC DROPDOWN
  Widget _buildDropdown(List<String> items, String selected, Function(String?) onChange) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: selected,
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down),
        style: GoogleFonts.poppins(
          color: const Color(0xFF517861),
          fontSize: 16,
        ),
        items: items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChange,
      ),
    );
  }

  // HABIT DROPDOWN WITH OTHER FIELD
  Widget _buildHabitDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton<String>(
            value: selectedHabit,
            isExpanded: true,
            underline: const SizedBox(),
            icon: const Icon(Icons.keyboard_arrow_down),
            style: GoogleFonts.poppins(
              color: const Color(0xFF517861),
              fontSize: 16,
            ),
            items: habitList.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedHabit = value!;
                showOtherHabitField = (value == "other");
              });
            },
          ),
        ),

        if (showOtherHabitField) ...[
          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: otherHabitController,
              style: GoogleFonts.poppins(
                color: const Color(0xFF517861),
                fontSize: 16,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Please specify your habit",
                hintStyle: GoogleFonts.poppins(
                  color: const Color(0xFF517861),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
