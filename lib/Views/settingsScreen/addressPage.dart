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
  bool isCollapsed = false;

  void _createAccount() {
    print("Account created!");
  }

  void _toggleCollapse() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.0),
              border: Border.all(
                color: Colors.grey[300]!,
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isDefault) DefaultLabelWidget(),
                SizedBox(height: 8,),
                GestureDetector(
                  onTap: _toggleCollapse, // Toggle collapse state on tap
                  child: HeaderInfoWidget(isCollapsed: isCollapsed), // This is the clickable header
                ),
                const SizedBox(height: 10),

                // Hide DividerWidget when collapsed
                if (!isCollapsed) DividerWidget(),

                // Collapsing/Expanding content with AnimatedCrossFade
                AnimatedCrossFade(
                  firstChild: Container(), // Empty container when collapsed
                  secondChild: FormContainerWidget(
                    onCreateAccount: _createAccount,
                    onSwitchChanged: (bool value) {
                      setState(() {
                        isDefault = value;
                      });
                    },
                  ),
                  crossFadeState: isCollapsed
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 300),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}