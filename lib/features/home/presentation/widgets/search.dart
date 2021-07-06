import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:factories/features/home/presentation/bloc/bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/core/ui/app_colors.dart';
import 'package:factories/core/ui/widgets/sliver_header_delegate.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      sliver: SliverPersistentHeader(
        pinned: true,
        delegate: SliverCustomHeaderDelegate(
          height: 200.h,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            alignment: Alignment.center,
            child: CupertinoTextField(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withOpacity(.25),
                    blurRadius: 10,
                  ),
                ],
              ),
              onChanged: HomeBLoC.of(context).searchChanged,
              placeholder: 'Search Factories',
              placeholderStyle:
                  Helpers.searchStyle.copyWith(color: AppColors.grey),
              style: Helpers.searchStyle,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              prefix: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(Icons.search, color: AppColors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
