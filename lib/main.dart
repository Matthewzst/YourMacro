import 'package:flutter/material.dart';

void main() {
  runApp(const YourMacroApp());
}

class YourMacroApp extends StatelessWidget {
  const YourMacroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YourMacro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF181818),
        primaryColor: const Color(0xFFB3002D),
        colorScheme: ColorScheme.dark(
          surface: const Color(0xFF181818),
          primary: const Color(0xFFB3002D),
        ),
      ),
      home: const AuthScreenController(),
    );
  }
}

class AuthScreenController extends StatefulWidget {
  const AuthScreenController({super.key});

  @override
  State<AuthScreenController> createState() => _AuthScreenControllerState();
}

class _AuthScreenControllerState extends State<AuthScreenController> {
  bool isLoginView = true;

  void toggleView() {
    setState(() {
      isLoginView = !isLoginView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 40.0, left: 24.0, right: 24.0, bottom: 24.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 340),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: isLoginView
                    ? LoginScreen(key: const ValueKey('Login'), onSwitchToRegister: toggleView)
                    : RegisterScreen(key: const ValueKey('Register'), onSwitchToLogin: toggleView),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthHeader extends StatelessWidget {
  final String title;

  const AuthHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'YourMacro',
          style: TextStyle(
            color: Color(0xFFC70039),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class LoginScreen extends StatefulWidget {
  final VoidCallback onSwitchToRegister;

  const LoginScreen({super.key, required this.onSwitchToRegister});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const AuthHeader(title: 'Zaloguj się'),
        const SizedBox(height: 128),
        
        const CustomTextField(label: 'Email'),
        const SizedBox(height: 16),
        
        PasswordTextField(
          label: 'Hasło',
          obscureText: _obscurePassword,
          onToggleVisibility: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        const SizedBox(height: 32),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB3002D),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: () {},
            child: const Text('Zaloguj', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ),
        const SizedBox(height: 16),

        Center(
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Nie pamiętam hasła',
              style: TextStyle(color: Colors.grey, fontSize: 13, decoration: TextDecoration.underline),
            ),
          ),
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: SocialButton(
                icon: Icons.g_mobiledata,
                label: 'Google',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SocialButton(
                icon: Icons.facebook,
                label: 'Facebook',
                onTap: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),

        Center(
          child: GestureDetector(
            onTap: widget.onSwitchToRegister,
            child: RichText(
              text: const TextSpan(
                text: 'Nie masz konta? ',
                style: TextStyle(color: Colors.grey, fontSize: 14),
                children: [
                  TextSpan(
                    text: 'Zarejestruj się',
                    style: TextStyle(
                      color: Color(0xFFC70039),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RegisterScreen extends StatefulWidget {
  final VoidCallback onSwitchToLogin;

  const RegisterScreen({super.key, required this.onSwitchToLogin});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePasswords = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const AuthHeader(title: 'Zarejestruj się'),
        const SizedBox(height: 96),
        
        const CustomTextField(label: 'Nazwa'),
        const SizedBox(height: 16),

        const CustomTextField(label: 'Email'),
        const SizedBox(height: 16),
        
        PasswordTextField(
          label: 'Hasło',
          obscureText: _obscurePasswords,
          onToggleVisibility: () {
            setState(() {
              _obscurePasswords = !_obscurePasswords;
            });
          },
        ),
        const SizedBox(height: 16),

        PasswordTextField(
          label: 'Powtórz hasło',
          obscureText: _obscurePasswords,
          onToggleVisibility: () {
            setState(() {
              _obscurePasswords = !_obscurePasswords;
            });
          },
        ),
        const SizedBox(height: 24),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB3002D),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: () {},
            child: const Text('Zarejestruj', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ),
        const SizedBox(height: 18),

        Center(
          child: GestureDetector(
            onTap: widget.onSwitchToLogin,
            child: RichText(
              text: const TextSpan(
                text: 'Masz już konto? ',
                style: TextStyle(color: Colors.grey, fontSize: 14),
                children: [
                  TextSpan(
                    text: 'Zaloguj się',
                    style: TextStyle(
                      color: Color(0xFFC70039),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Zwykłe pole tekstowe (np. Email, Nazwa)
class CustomTextField extends StatelessWidget {
  final String label;

  const CustomTextField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF1E1E1E),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Color(0xFFB3002D), width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Color(0xFFB3002D), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Color(0xFFE60039), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),
        ),
      ],
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final VoidCallback onToggleVisibility;

  const PasswordTextField({
    super.key,
    required this.label,
    required this.obscureText,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          obscureText: obscureText,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF1E1E1E),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: Colors.grey,
                size: 20,
              ),
              onPressed: onToggleVisibility,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Color(0xFFB3002D), width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Color(0xFFB3002D), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(color: Color(0xFFE60039), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color(0xFF222222),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      onPressed: onTap,
      icon: Icon(icon, color: Colors.white, size: 22),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}