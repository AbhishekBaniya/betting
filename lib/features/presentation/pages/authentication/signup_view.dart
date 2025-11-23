import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:salesbetting/features/presentation/app_routes/app_navigators.dart';
import 'package:salesbetting/features/presentation/app_routes/app_routes.dart';

import '../../../../core/utils/extensions/responsive_num_extensions.dart';
import '../../../../core/utils/services/responsive_service.dart';
import '../../controller/auth/app_auth_controller.dart';
import '../../widgets/app_textformfield_widget.dart';
/*class SignupView extends StatelessWidget {
  final AppAuthController authController = Get.put(AppAuthController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign Up", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Full Name')),
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => authController.signupWithEmail(
                  nameController.text, emailController.text, passwordController.text),
              child: Text("Sign Up"),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => Get.back(),
              child: Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}*/

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final AppAuthController authController = Get.put(AppAuthController());

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController zipController = TextEditingController();

  String? gender;
  DateTime? selectedDob;

  @override
  Widget build(BuildContext context) {
    SizeService.instance.init(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: ResponsiveEdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.h),

                // Full Name
                AppTextFormFieldWidget(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return "Name required";
                    return null;
                  },
                ),
                SizedBox(height: 15.h),

                // Email
                AppTextFormFieldWidget(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return "Email required";
                    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value)) return "Invalid email";
                    return null;
                  },
                ),
                SizedBox(height: 15.h),

                // Password
                AppTextFormFieldWidget(
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Password required";
                    if (value.length < 6) return "Min 6 characters";
                    return null;
                  },
                ),
                SizedBox(height: 15.h),

                // Gender
                Row(
                  children: [
                    Text("Gender: ", style: TextStyle(fontSize: 16.sp)),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Row(
                        children: [
                          Radio<String>(
                            value: "Male",
                            groupValue: gender,
                            onChanged: (value) => setState(() => gender = value),
                          ),
                          Text("Male"),
                          Radio<String>(
                            value: "Female",
                            groupValue: gender,
                            onChanged: (value) => setState(() => gender = value),
                          ),
                          Text("Female"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),

                // DOB picker
                AppTextFormFieldWidget(
                  controller: dobController,
                  readOnly: true,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: "Date of Birth",
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedDob = picked;
                        dobController.text = DateFormat('yyyy-MM-dd').format(picked);
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) return "DOB required";
                    return null;
                  },
                ),
                SizedBox(height: 15.h),

                // Phone
                AppTextFormFieldWidget(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Mobile Number",
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Phone required";
                    final phoneRegex = RegExp(r'^\+?\d{10,15}$');
                    if (!phoneRegex.hasMatch(value)) return "Invalid phone";
                    return null;
                  },
                ),
                SizedBox(height: 15.h),

                // Address
                AppTextFormFieldWidget(
                  controller: addressController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    hintText: "Address",
                    prefixIcon: Icon(Icons.home),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Address required";
                    return null;
                  },
                ),
                SizedBox(height: 15.h),

                // Country
                AppTextFormFieldWidget(
                  controller: countryController,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    hintText: "Country",
                    prefixIcon: Icon(Icons.flag),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Country required";
                    return null;
                  },
                ),
                SizedBox(height: 15.h),

                // Zip code
                AppTextFormFieldWidget(
                  controller: zipController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "ZIP Code",
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "ZIP required";
                    final zipRegex = RegExp(r'^\d{4,10}$');
                    if (!zipRegex.hasMatch(value)) return "Invalid ZIP";
                    return null;
                  },
                ),
                SizedBox(height: 20.h),

                // Signup Button
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authController.signupWithEmail(
                          nameController.text.trim(),
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    ),
                    child: Text("Sign Up", style: TextStyle(fontSize: 16.sp)),
                  ),
                ),

                TextButton(
                  onPressed: () => AppNavigator().navigateToAndReplace(AppRoutes.login),
                  child: Text(
                    "Already have an account? Login",
                    style: scaledTextStyle(size: 14, weight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


