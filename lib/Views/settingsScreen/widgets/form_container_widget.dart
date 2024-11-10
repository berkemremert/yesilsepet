import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/settingsScreen/widgets/text_input_field.dart';

import '../../theme/appColors.dart';
import '../../welcomePage/widgets/create_account_page_header.dart';
import '../../welcomePage/widgets/create_page_insider_button.dart';
import '../../welcomePage/widgets/gradient_text_field.dart';

class FormContainerWidget extends StatelessWidget {
  final VoidCallback onCreateAccount;
  final Icon? nameIcon;
  final Icon? surnameIcon;
  final Icon? usernameIcon;
  final Icon? emailIcon;
  final Icon? phoneIcon;
  final Icon? passwordIcon;
  final bool isDefault; // Track the switch state
  final ValueChanged<bool> onSwitchChanged; // Callback when switch state changes

  const FormContainerWidget({
    Key? key,
    required this.onCreateAccount,
    this.nameIcon = const Icon(Icons.person, color: Colors.grey),
    this.surnameIcon = const Icon(Icons.location_pin, color: Colors.grey),
    this.usernameIcon = const Icon(Icons.location_city_rounded, color: Colors.grey),
    this.emailIcon = const Icon(Icons.keyboard, color: Colors.grey),
    this.phoneIcon = const Icon(Icons.map_sharp, color: Colors.grey),
    this.passwordIcon = const Icon(Icons.phone, color: Colors.grey),
    this.isDefault = false, // Default value for the switch state
    required this.onSwitchChanged, // Accept a callback to change the switch state
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: nameIcon, // Use the passed icon
              ),
              const SizedBox(width: 8),
              Expanded(child: TextInputAddress(label: 'Name')),
            ],
          ),
          const SizedBox(height: 6),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: surnameIcon, // Use the passed icon
              ),
              const SizedBox(width: 8),
              Expanded(child: TextInputAddress(label: 'Address')),
            ],
          ),
          const SizedBox(height: 6),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: usernameIcon, // Use the passed icon
              ),
              const SizedBox(width: 8),
              Expanded(child: TextInputAddress(label: 'City')),
            ],
          ),
          const SizedBox(height: 6),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: emailIcon, // Use the passed icon
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextInputAddress(
                  label: 'Zip Code',
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: phoneIcon, // Use the passed icon
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextInputAddress(
                  label: 'Country',
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: passwordIcon, // Use the passed icon
              ),
              const SizedBox(width: 8),
              Expanded(child: TextInputAddress(label: 'Phone Number')),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: 15,
                  height: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isDefault ? AppColors.green : AppColors.lightGray, // Change color based on the switch state
                        width: 3, // Set the thickness of the box
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: isDefault
                        ? const Icon(Icons.check, size: 12, color: Colors.white) // Checkmark icon when active
                        : null, // No icon when inactive
                  ),
                ),
              ),
              SizedBox(width: 20),
              const Text(
                'Make Default',
                style: TextStyle(
                  fontSize: 12, // Smaller font size
                  color: AppColors.darkGray, // Lighter gray color for the text
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}