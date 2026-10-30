import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
  });

  final String? prefixIcon;
  final String? suffixIcon;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffFFFFFF),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19),
          borderSide: BorderSide(color: Colors.grey.shade300, width: .7),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(19),
          borderSide: BorderSide(color: Colors.grey.shade300, width: .7),
        ),
        hint: Text(hintText ?? '', style: TextStyle(color: Color(0xff757575))),
        prefixIcon: prefixIcon != null
            ? Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Align(
                  alignment: .centerRight,
                  child: SvgPicture.asset(
                    prefixIcon!,
                    color: Color(0xff757575),
                    width: 10,
                    height: 10,
                  ),
                ),
            )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                  alignment: .centerRight,
                  child: SvgPicture.asset(
                    suffixIcon!,
                    color: Color(0xff757575),
                    width: 18,
                    height: 18,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
