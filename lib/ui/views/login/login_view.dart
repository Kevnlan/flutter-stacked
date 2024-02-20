import 'package:flutter/material.dart';
import 'package:flutter_application_stacked/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../startup/startup_viewmodel.dart';

class LoginView extends StackedView<StartupViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.keyboard_backspace_outlined),
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
            verticalSpaceMedium,
            const Text(
              'Login',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
                letterSpacing: -0.33,
              ),
            ),
            verticalSpaceSmall,
            const Text(
              'Login now to track all your expenses and income at a place!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -0.18,
              ),
            ),
            verticalSpaceLarge,
            const Text(
              'Email',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                letterSpacing: -0.18,
              ),
            ),
            verticalSpaceSmall,
            SizedBox(
              width: double.infinity,
              height: 56,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.alternate_email),
                  hintText: 'Ex: abc@example.com',
                  hintStyle: const TextStyle(
                    color: Color(0xFFC7C7C7),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0.09,
                    letterSpacing: -0.18,
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1.50, color: Color(0xFFC7C7C7)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            verticalSpaceMedium,
            const Text(
              'Your Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                letterSpacing: -0.18,
              ),
            ),
            verticalSpaceSmall,
            SizedBox(
              width: double.infinity,
              height: 56,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  hintText: '............',
                  hintStyle: const TextStyle(
                    color: Color(0xFFC7C7C7),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0.09,
                    letterSpacing: -0.18,
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1.50, color: Color(0xFFC7C7C7)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            verticalSpaceSmall,
            const Text(
              'Forgot Password?',
              style: TextStyle(
                color: Color(0xFF565DFA),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                letterSpacing: -0.13,
                decoration: TextDecoration.underline,
              ),
            ),
            verticalSpaceLarge,
            GestureDetector(
              onTap: () {
                viewModel.onPressed("email_login");
              },
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: ShapeDecoration(
                  color: const Color(0xFF1A38F8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.18,
                    ),
                  ),
                ),
              ),
            ),
            verticalSpaceSmall,
            GestureDetector(
              onTap: () {
                viewModel.onPressed("google_signup");
              },
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1.50),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              NetworkImage("https://via.placeholder.com/24x24"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    horizontalSpaceSmall,
                    const Text(
                      'Continue with Google',
                      style: TextStyle(
                        color: Color(0xFF1C1C1C),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            verticalSpaceLarge,
            Center(
              child: GestureDetector(
                onTap: () {
                  viewModel.onPressed("nav_register");
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don’t have an account? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -0.18,
                        ),
                      ),
                      TextSpan(
                        text: 'Register',
                        style: TextStyle(
                          color: Color(0xFF1A38F8),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -0.18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();
}
