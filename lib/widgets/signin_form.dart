import 'package:flutter/material.dart';

import 'btn.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final emailCtrl = TextEditingController();
  final pwdCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    pwdCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailCtrl,
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF667eea), width: 2),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: pwdCtrl,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF667eea), width: 2),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Center(child: CustomButton(text: 'Sign In', ontap: null)),
      ],
    );
  }
}
