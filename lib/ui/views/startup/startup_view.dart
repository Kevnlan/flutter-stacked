import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_application_stacked/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              verticalSpaceMassive,
              // Container(
              //   height: 80,
              //   width: 80,
              //   alignment: Alignment.centerLeft,
              //   child: Image.asset('assets/logos/ecee.png'),
              // ),
              Image.asset(
                'assets/logos/ecee.png',
                height: 80,
                width: 80,
                alignment: Alignment.centerLeft,
              ),
              verticalSpaceMedium,
              const Text(
                'Welcome to',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: -0.26,
                ),
              ),
              verticalSpaceSmall,
              const Text(
                'My App',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w600,
                  height: 0,
                  letterSpacing: -0.26,
                ),
              ),
              verticalSpaceSmall,
              const Text(
                'A place where you can track all your expenses and incomes...',
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
                'Let’s Get Started...',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.32,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                  height: 0.09,
                  letterSpacing: -0.19,
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
                            image: NetworkImage(
                                "https://via.placeholder.com/24x24"),
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
              verticalSpaceSmall,
              GestureDetector(
                onTap: () {
                  viewModel.onPressed("nav_register");
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Icon(Icons.alternate_email),
                      ),
                      horizontalSpaceSmall,
                      Text(
                        'Continue with Email',
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
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
