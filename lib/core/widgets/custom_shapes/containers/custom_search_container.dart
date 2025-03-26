import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/features/news/screens/search/cubits/search_cubit/search_cubit.dart';

class CustomSearchContainer extends StatefulWidget {
  const CustomSearchContainer({super.key, this.hintText = 'Search...', this.outlineInputBorder = AppColors.primary});

  final String hintText;
  final Color outlineInputBorder;

  @override
  State<CustomSearchContainer> createState() => _CustomSearchContainerState();
}

class _CustomSearchContainerState extends State<CustomSearchContainer> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.length >= 3) {
        context.read<SearchCubit>().searchNews(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: widget.outlineInputBorder),
        ),
      ),
      onChanged: _onSearchChanged,
    );
  }
}
