
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/form_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // 1. Form Key
  final _formKey = GlobalKey<FormState>();

  // 2. Text Editing Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // 3. Gender and Date of Birth
  String? _selectedGender;

  // 4. Password Visibility
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // 5. Loading State
  bool _isSubmitting = false;

  // 6. Calculate Age
  int calculateAge(DateTime dob) {
    final today = DateTime.now();

    int age = today.year - dob.year;

    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      age--;
    }

    return age;
  }

  // 7. Date Picker
  Future<void> _selectDate(FormFieldState<DateTime> field) async {

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      field.didChange(pickedDate);
    }
  }

  // 8. Submit Form
  Future<void> _submitForm() async {

    if (_isSubmitting) return;

    // Hide keyboard
    FocusScope.of(context).unfocus();

    // Validate all fields
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Start loading
    setState(() {
      _isSubmitting = true;
    });

    try {

      // Simulate API request
      await Future.delayed(
        const Duration(seconds: 2),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Registration successful! Welcome ${_nameController.text.trim()}',
          ),
          backgroundColor: Colors.green,
        ),
      );

    } finally {

      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  // 9. Reset Form
  void _resetForm() {

    _formKey.currentState?.reset();

    _nameController.clear();
    _emailController.clear();
    _mobileController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();

    setState(() {
      _selectedGender = null;

      _isPasswordVisible = false;
      _isConfirmPasswordVisible = false;
    });

    FocusScope.of(context).unfocus();
  }

  // 10. Dispose Controllers
  @override
  void dispose() {

    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  // 11. Build UI
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text('User Registration'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [

                const Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                // --------------------------------
                // PERSONAL INFORMATION
                // --------------------------------

                FormSection(
                  title: 'Personal Information',

                  child: CustomTextField(
                    label: 'Full Name',
                    controller: _nameController,
                    maxLength: 50,

                    textCapitalization:
                    TextCapitalization.words,

                    validator: (value) {

                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Please enter your full name';
                      }

                      if (value.trim().length < 3) {
                        return 'Name must contain at least 3 characters';
                      }

                      return null;
                    },
                  ),
                ),

                // --------------------------------
                // CONTACT INFORMATION
                // --------------------------------

                FormSection(
                  title: 'Contact Information',

                  child: Column(
                    children: [

                      // EMAIL
                      CustomTextField(
                        label: 'Email Address',
                        controller: _emailController,

                        keyboardType:
                        TextInputType.emailAddress,

                        validator: (value) {

                          if (value == null ||
                              value.trim().isEmpty) {
                            return 'Please enter your email address';
                          }

                          final emailRegex = RegExp(
                            r'^[\w.+-]+@[\w-]+(\.[\w-]+)+$',
                          );

                          if (!emailRegex.hasMatch(
                            value.trim(),
                          )) {
                            return 'Please enter a valid email address';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // PHONE NUMBER
                      CustomTextField(
                        label: 'Phone Number',
                        controller: _mobileController,

                        keyboardType:
                        TextInputType.number,

                        maxLength: 10,

                        validator: (value) {

                          if (value == null ||
                              value.isEmpty) {
                            return 'Please enter your phone number';
                          }

                          if (!RegExp(
                            r'^[0-9]{10}$',
                          ).hasMatch(value)) {
                            return 'Phone number must contain exactly 10 digits';
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                // --------------------------------
                // ACCOUNT SECURITY
                // --------------------------------

                FormSection(
                  title: 'Account Security',

                  child: Column(
                    children: [

                      // PASSWORD
                      CustomTextField(
                        label: 'Password',
                        controller: _passwordController,

                        obscureText:
                        !_isPasswordVisible,

                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),

                          onPressed: () {
                            setState(() {
                              _isPasswordVisible =
                              !_isPasswordVisible;
                            });
                          },
                        ),

                        onChanged: (value) {
                          if (_confirmPasswordController
                              .text.isNotEmpty) {
                            _formKey.currentState?.validate();
                          }
                        },

                        validator: (value) {

                          if (value == null ||
                              value.isEmpty) {
                            return 'Please enter your password';
                          }

                          if (value.length < 8) {
                            return 'Password must contain at least 8 characters';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // CONFIRM PASSWORD
                      CustomTextField(
                        label: 'Confirm Password',
                        controller:
                        _confirmPasswordController,

                        obscureText:
                        !_isConfirmPasswordVisible,

                        textInputAction:
                        TextInputAction.done,

                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),

                          onPressed: () {
                            setState(() {
                              _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible;
                            });
                          },
                        ),

                        onChanged: (value) {
                          _formKey.currentState?.validate();
                        },

                        onFieldSubmitted: (_) {
                          _submitForm();
                        },

                        validator: (value) {

                          if (value == null ||
                              value.isEmpty) {
                            return 'Please confirm your password';
                          }

                          if (value !=
                              _passwordController.text) {
                            return 'Passwords do not match';
                          }

                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                // --------------------------------
                // ADDITIONAL INFORMATION
                // --------------------------------

                FormSection(
                  title: 'Additional Information',

                  child: Column(
                    children: [

                      // GENDER DROPDOWN
                      DropdownButtonFormField<String>(

                        initialValue: _selectedGender,

                        decoration: const InputDecoration(
                          labelText: 'Gender',
                          border: OutlineInputBorder(),
                        ),

                        items: const [

                          DropdownMenuItem(
                            value: 'Male',
                            child: Text('Male'),
                          ),

                          DropdownMenuItem(
                            value: 'Female',
                            child: Text('Female'),
                          ),

                          DropdownMenuItem(
                            value: 'Other',
                            child: Text('Other'),
                          ),
                        ],

                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },

                        validator: (value) {

                          if (value == null) {
                            return 'Please select your gender';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // DATE OF BIRTH
                      FormField<DateTime>(

                        validator: (value) {

                          if (value == null) {
                            return 'Please select your Date of Birth';
                          }

                          if (calculateAge(value) < 18) {
                            return 'You must be at least 18 years old';
                          }

                          return null;
                        },

                        builder: (field) {

                          return InkWell(

                            onTap: () {
                              _selectDate(field);
                            },

                            child: InputDecorator(

                              decoration: InputDecoration(
                                labelText: 'Date of Birth',

                                border:
                                const OutlineInputBorder(),

                                suffixIcon: const Icon(
                                  Icons.calendar_today,
                                ),

                                errorText: field.errorText,
                              ),

                              child: Text(

                                field.value == null
                                    ? 'Select Date of Birth'
                                    : '${field.value!.day.toString().padLeft(2, '0')}/'
                                    '${field.value!.month.toString().padLeft(2, '0')}/'
                                    '${field.value!.year}',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // --------------------------------
                // TERMS AND CONDITIONS
                // --------------------------------

                FormSection(
                  title: 'Terms and Conditions',

                  child: FormField<bool>(

                    initialValue: false,

                    validator: (value) {

                      if (value != true) {
                        return 'Please accept Terms and Conditions';
                      }

                      return null;
                    },

                    builder: (field) {

                      return Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          CheckboxListTile(
                            contentPadding: EdgeInsets.zero,

                            title: const Text(
                              'I accept Terms and Conditions',
                            ),

                            value: field.value ?? false,

                            onChanged: (value) {
                              field.didChange(value);
                            },
                          ),

                          if (field.errorText != null)

                            Padding(
                              padding:
                              const EdgeInsets.only(left: 12),

                              child: Text(
                                field.errorText!,

                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),

                // --------------------------------
                // REGISTER BUTTON
                // --------------------------------

                ElevatedButton(

                  onPressed:
                  _isSubmitting ? null : _submitForm,

                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                  ),

                  child: _isSubmitting

                      ? const SizedBox(
                    height: 22,
                    width: 22,

                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )

                      : const Text('Register'),
                ),

                const SizedBox(height: 10),

                // --------------------------------
                // RESET BUTTON
                // --------------------------------

                OutlinedButton(

                  onPressed:
                  _isSubmitting ? null : _resetForm,

                  child: const Text('Reset'),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
