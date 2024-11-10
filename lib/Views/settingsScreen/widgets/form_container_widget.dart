import 'package:flutter/material.dart';

import '../../theme/appColors.dart';
import '../../welcomePage/widgets/create_account_page_header.dart';
import '../../welcomePage/widgets/create_page_insider_button.dart';
import '../../welcomePage/widgets/gradient_text_field.dart';

class FormContainerWidget extends StatelessWidget {
  final VoidCallback onCreateAccount;

  const FormContainerWidget({Key? key, required this.onCreateAccount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.pureWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CreatePageHeader(),
          const SizedBox(height: 24),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.person, color: Colors.grey[600]),
              ),
              const SizedBox(width: 8),
              Expanded(child: GradientTextField(label: 'Name')),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.person_outline, color: Colors.grey[600]),
              ),
              const SizedBox(width: 8),
              Expanded(child: GradientTextField(label: 'Surname')),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.account_circle, color: Colors.grey[600]),
              ),
              const SizedBox(width: 8),
              Expanded(child: GradientTextField(label: 'Username')),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.email, color: Colors.grey[600]),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: GradientTextField(
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.phone, color: Colors.grey[600]),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: GradientTextField(
                  label: 'Phone Number',
                  keyboardType: TextInputType.phone,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.lock, color: Colors.grey[600]),
              ),
              const SizedBox(width: 8),
              Expanded(child: GradientTextField(label: 'Password')),
            ],
          ),
          const SizedBox(height: 32),

          CreateAccountInsiderButton(onPressed: onCreateAccount),
        ],
      ),
    );
  }
}