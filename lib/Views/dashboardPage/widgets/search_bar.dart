import 'package:flutter/material.dart';

import '../../theme/appColors.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(String) onSearchChanged;

  SearchBarWidget({required this.onSearchChanged});

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController _controller = TextEditingController();

  void _clearSearch() {
    _controller.clear();
    widget.onSearchChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.greenishWhite, AppColors.orangishWhite],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 16,
              offset: Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(
              color: AppColors.oliveGreen,
              shadows: [
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 20.0,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                _controller.text.isEmpty ? Icons.search : Icons.clear,
                color: AppColors.oliveGreen,
              ),
              onPressed: _controller.text.isEmpty ? null : _clearSearch,
              iconSize: 30,
            ),
          ),
          style: TextStyle(
            color: AppColors.oliveGreen,
            shadows: [
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 10.0,
                color: Colors.black.withOpacity(0.3),
              ),
            ],
          ),
          onChanged: (value) {
            widget.onSearchChanged(value);
          },
        ),
      ),
    );
  }
}
