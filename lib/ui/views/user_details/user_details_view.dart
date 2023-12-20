import 'package:flutter/material.dart';
import 'package:flutter_application_stacked/models/user.dart';
import 'package:flutter_application_stacked/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'user_details_viewmodel.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key, required this.user, required this.userID});

  final User user;
  final String userID;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserDetailsViewModel>.reactive(
      viewModelBuilder: () => UserDetailsViewModel(),
      disposeViewModel: false,
      onViewModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceMedium,
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        user.picture,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  const Center(
                    child: Text(
                      'Personal Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      const Text(
                        "Name:",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      horizontalSpaceTiny,
                      RichText(
                        text: TextSpan(
                          text: user.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' ${user.firstName} ${user.lastName}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceTiny,
                  Row(
                    children: [
                      const Text(
                        "Email:",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      horizontalSpaceTiny,
                      Text(
                        user.email,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceTiny,
                  Row(
                    children: [
                      const Text(
                        "Phone Number:",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      horizontalSpaceTiny,
                      Text(
                        user.phone,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceTiny,
                  Row(
                    children: [
                      const Text(
                        "Gender:",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      horizontalSpaceTiny,
                      Text(
                        user.gender,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceTiny,
                  Row(
                    children: [
                      const Text(
                        "Date of Birth:",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      horizontalSpaceTiny,
                      Text(
                        viewModel.dateFormat.format(user.dateOfBirth),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceTiny,
                  Row(
                    children: [
                      const Text(
                        "Registration Date:",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      horizontalSpaceTiny,
                      Text(
                        viewModel.dateFormat.format(user.registerDate),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceTiny,
                  Row(
                    children: [
                      const Text(
                        "Update date:",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      horizontalSpaceTiny,
                      Text(
                        viewModel.dateFormat.format(user.updatedDate),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  const Center(
                    child: Text(
                      'Location Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      const Text(
                        "Country:",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      horizontalSpaceTiny,
                      Text(
                        user.location.country,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceTiny,
                  Row(
                    children: [
                      const Text(
                        "State:",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      horizontalSpaceTiny,
                      Text(
                        user.location.state,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceTiny,
                  Row(
                    children: [
                      const Text(
                        "City:",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      horizontalSpaceTiny,
                      Text(
                        user.location.city,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceTiny,
                  Row(
                    children: [
                      const Text(
                        "Timezone:",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      horizontalSpaceTiny,
                      Text(
                        user.location.timezone,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
