import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,

      appBar: AppBar(
        title: const Text("User Registration"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.person_add_alt_1,
              size:80,
              color:Colors.blue,
            ),
            const SizedBox(height: 20,),

            const Text(
              'Create Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),

            const CustomTextField(
              label: 'Full Name',
              icon: Icons.person,
            ),

            const SizedBox(height: 15),

            const CustomTextField(
              label: 'Email Address',
              icon: Icons.email,
            ),

            const SizedBox(height: 15),

            const CustomTextField(
              label: 'Mobile Number',
              icon: Icons.phone,
            ),

            const SizedBox(height: 15),

            const CustomTextField(
              label: 'Password',
              icon: Icons.lock,
              isPassword: true,
            ),

            const SizedBox(height: 15),

            const CustomTextField(
              label: 'Confirm Password',
              icon: Icons.lock_outline,
              isPassword: true,
            ),

            const SizedBox(height: 25),

            CustomButton(
              title: 'Register',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Registration button clicked!'),
                  ),
                );
              },
            ),

          ],
        )
      ),
    );
  }
}
