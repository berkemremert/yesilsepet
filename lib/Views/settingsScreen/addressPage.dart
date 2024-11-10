import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/settingsScreen/widgets/default_label_widget.dart';
import 'package:yesilsepet/Views/settingsScreen/widgets/divider_widget.dart';
import 'package:yesilsepet/Views/settingsScreen/widgets/form_container_widget.dart';
import 'package:yesilsepet/Views/settingsScreen/widgets/header_info_widget.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  bool isDefault = true;

  void _createAccount() {
    print("Account created!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDefault) DefaultLabelWidget(),
          HeaderInfoWidget(),
          DividerWidget(),
          FormContainerWidget(onCreateAccount: _createAccount),
        ],
      ),
    );
  }
}
