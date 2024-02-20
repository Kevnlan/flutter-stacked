import 'package:flutter/material.dart';
import 'package:flutter_application_stacked/ui/common/helpers.dart';
import 'package:flutter_application_stacked/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../startup/startup_viewmodel.dart';

class SignupView extends StackedView<StartupViewModel> {
  const SignupView({Key? key}) : super(key: key);

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
          onPressed: () {
            viewModel.onPressed("back");
          },
          icon: const Icon(Icons.keyboard_backspace_outlined),
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
                verticalSpaceMedium,
                const Text(
                  'Register',
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
                  'Create an account to access all the features of Linear!',
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
                Form(
                  key: viewModel.formKey,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                                            const Text(
                        'Firstname',
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
                          controller: viewModel.firstnameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.person_outline_rounded),
                            hintText: 'Ex. Kevin',
                            hintStyle: const TextStyle(
                              color: Color(0xFFC7C7C7),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0.09,
                              letterSpacing: -0.18,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1.50, color: Color(0xFFC7C7C7)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      verticalSpaceMedium,
                                            const Text(
                        'Lastname',
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
                          controller: viewModel.lastnameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.person_outline_rounded),
                            hintText: 'Ex. James',
                            hintStyle: const TextStyle(
                              color: Color(0xFFC7C7C7),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0.09,
                              letterSpacing: -0.18,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1.50, color: Color(0xFFC7C7C7)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      verticalSpaceMedium,
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
                          controller: viewModel.emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                            if (!validateEmail(value)) {
                              return 'enter a valid email';
                            }
                            return null;
                          },
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
                              borderSide: const BorderSide(
                                  width: 1.50, color: Color(0xFFC7C7C7)),
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
                          controller: viewModel.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }

                            return null;
                          },
                          obscureText: !viewModel.showPassword,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            suffixIcon: IconButton(
                              icon: Icon(viewModel.showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                viewModel.toggleBoolean(viewModel.showPassword);
                              },
                            ),
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
                              borderSide: const BorderSide(
                                  width: 1.50, color: Color(0xFFC7C7C7)),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                      verticalSpaceLarge,
                      GestureDetector(
                        onTap: () {
                          viewModel.onPressed("email_register");
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
                              'Register',
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
                      verticalSpaceLarge,
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            viewModel.onPressed("nav_login");
                          },
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account? ',
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
                                  text: 'Login',
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
              ],
            ),
          ),
          if (viewModel.processingData)
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Loading ...', style: TextStyle(fontSize: 16)),
                  horizontalSpaceSmall,
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 6,
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();
}
