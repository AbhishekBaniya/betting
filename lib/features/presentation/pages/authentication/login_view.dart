import 'package:alert_info/alert_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesbetting/features/presentation/app_routes/app_navigators.dart';
import 'package:salesbetting/features/presentation/app_routes/app_routes.dart';
import 'package:salesbetting/features/presentation/pages/dashboard/achievement_badge.dart';
import 'package:salesbetting/features/presentation/widgets/app_textformfield_widget.dart';

import '../../../../core/utils/extensions/responsive_num_extensions.dart';
import '../../../../core/utils/services/responsive_service.dart';
import '../../controller/auth/app_auth_controller.dart';

// class LoginView extends StatelessWidget {
//   final authController = Get.put(AppAuthController());
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController otpController = TextEditingController();
//   String? _verificationId;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: 80),
//               Text("Login to Sales Bets", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
//               SizedBox(height: 30),
//
//               // Email Login
//               AppTextFormFieldWidget(controller: emailController, keyboardType: TextInputType.emailAddress, enabled: true,),
//               //TextField(controller: , decoration: InputDecoration(labelText: 'Email')),
//               TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
//               ElevatedButton(
//                 onPressed: () => authController.loginWithEmail(emailController.text, passwordController.text),
//                 child: Text("Login with Email"),
//               ),
//               SizedBox(height: 20),
//
//               // Google Login
//               ElevatedButton(
//                 onPressed: () => authController.signInWithGoogle(),
//                 child: Text("Login with Google"),
//               ),
//               SizedBox(height: 20),
//
//               // Phone OTP
//               TextField(controller: phoneController, decoration: InputDecoration(labelText: 'Mobile Number')),
//               ElevatedButton(
//                 onPressed: () => authController.loginWithPhone(phoneController.text, (verificationId) {
//                   _verificationId = verificationId;
//                   Get.snackbar("OTP Sent", "Check your SMS");
//                 }),
//                 child: Text("Send OTP"),
//               ),
//               if (_verificationId != null) ...[
//                 TextField(controller: otpController, decoration: InputDecoration(labelText: 'Enter OTP')),
//                 ElevatedButton(
//                   onPressed: () => authController.verifyOTP(_verificationId!, otpController.text),
//                   child: Text("Verify OTP"),
//                 ),
//               ],
//
//               SizedBox(height: 20),
//               TextButton(
//                 onPressed: () => Get.toNamed('/signup'),
//                 child: Text("Don't have an account? Sign Up"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final authController = Get.put(AppAuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  String? _verificationId;

  @override
  Widget build(BuildContext context) {
    SizeService.instance.init(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: ResponsiveEdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalGap(80.h),
                Text(
                  "Login to Sales Bets",
                  style: scaledTextStyle(
                      size: 28, weight: FontWeight.bold, letterSpacing: 0.5),
                ),
                verticalGap(30.h),

                // Email
                AppTextFormFieldWidget(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: "Email",
                  prefixIcon: Icon(Icons.email_outlined,),),
                  enabled: true,
                ),
                verticalGap(15.h),

                // Password
                AppTextFormFieldWidget(
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(hintText: "Password",
                  prefixIcon: Icon(Icons.lock_outline,),)
                ),
                verticalGap(15.h),

                // Email login button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 5,
                  ),
                  onPressed: () => authController.loginWithEmail(
                      emailController.text, passwordController.text),
                  child: Text(
                    "Login with Email",
                    style: scaledTextStyle(size: 16, weight: FontWeight.bold),
                  ),
                ),
                verticalGap(20.h),

                Text(
                  "OR",
                  style: scaledTextStyle(size: 16, weight: FontWeight.bold),
                ),
                verticalGap(20.h),

                // Google login
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 3,
                  ),
                  onPressed: () => AppNavigator().navigateToAndReplace(AppRoutes.dashboard,)/*authController.signInWithGoogle()*/,
                  icon: Icon(Icons.g_mobiledata, size: 64,),
                  label: Text(
                    "Login with Google",
                    style: scaledTextStyle(size: 16, weight: FontWeight.w600),
                  ),
                ),
                verticalGap(20.h),
                Text(
                  "OR",
                  style: scaledTextStyle(size: 16, weight: FontWeight.bold),
                ),
                verticalGap(20.h),

                // Phone OTP
                AppTextFormFieldWidget(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: "Mobile Number",
                  prefixIcon: Icon(Icons.phone_android_outlined,),),
                ),
                verticalGap(10.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  onPressed: () => authController.loginWithPhone(
                    phoneController.text,
                        (verificationId) {
                      setState(() {
                        _verificationId = verificationId;
                      });

                      AlertInfo.show(
                        context: context,
                        text: 'Otp Sent',
                        icon: Icons.person,
                        typeInfo: TypeInfo.success,
                      );
                    },
                  ),
                  child: Text(
                    "Send OTP",
                    style: scaledTextStyle(size: 16, weight: FontWeight.bold),
                  ),
                ),
                verticalGap(15.h),

                // OTP field
                if (_verificationId != null) ...[
                  AppTextFormFieldWidget(
                    controller: otpController,
                    keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter OTP",),
                  ),
                  verticalGap(10.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      backgroundColor: Colors.greenAccent[700],
                    ),
                    onPressed: () => authController.verifyOTP(
                        _verificationId!, otpController.text),
                    child: Text(
                      "Verify OTP",
                      style: scaledTextStyle(size: 16, weight: FontWeight.bold),
                    ),
                  ),
                  verticalGap(15.h),
                ],

                TextButton(
                  onPressed: () => AppNavigator().navigateToAndReplace(AppRoutes.signUp,),
                  child: Text(
                    "Don't have an account? Sign Up",
                    style: scaledTextStyle(size: 14, weight: FontWeight.w500),
                  ),
                ),
                verticalGap(40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


