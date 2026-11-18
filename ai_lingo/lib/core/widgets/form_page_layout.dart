import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormPageLayout extends StatelessWidget {
  const FormPageLayout({
    super.key,
    required this.header,
    required this.footer,
    this.topPadding,
  });

  final List<Widget> header;
  final List<Widget> footer;
  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Padding(
            padding: EdgeInsets.fromLTRB(12.w, topPadding ?? 100.h, 12.w, 20.h),
            child: IntrinsicHeight(
              child: Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [...header, const Spacer(), ...footer],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
