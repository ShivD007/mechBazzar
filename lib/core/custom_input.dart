import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechBazzar/core/app_colors.dart';

class CustomInput extends StatelessWidget {
  final bool isReadOnly;
  final bool isEnable;
  final String placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool autofocus;
  final bool labelTextFlag;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final VoidCallback? onEditingCompleteAction;
  final ValueChanged<String>? onSubmittedAction;
  final VoidCallback? onTapAction;
  final bool? isObscure;
  final ValueChanged<String>? onChangedAction;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int? minLine, maxLines;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final double? dBorderRadius;
  final bool? showBorderColor;
  final int? maxLength;
  final bool? showCounter;
  final bool? isdense;
  final bool? showCounterInside;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Widget? suffix;
  final TextStyle? labelStyle;
  final FocusNode? focusNode;

  CustomInput(
      {Key? key,
      this.placeholder = "",
      this.suffixIcon,
      this.prefixIcon,
      this.autofocus = false,
      this.controller,
      this.labelText = "",
      this.labelTextFlag = false,
      this.onEditingCompleteAction,
      this.labelStyle,
      this.onSubmittedAction,
      this.onTapAction,
      this.onChangedAction,
      this.isObscure = false,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.minLine = 1,
      this.maxLines = 1,
      this.inputFormatters,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.isReadOnly = false,
      this.isEnable = true,
      this.dBorderRadius,
      this.showBorderColor = true,
      this.maxLength,
      this.showCounter = false,
      this.showCounterInside = false,
      this.horizontalPadding,
      this.verticalPadding,
      this.suffix,
      this.isdense = false,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onEditingCompleteAction,
      onTap: onTapAction,
      focusNode: focusNode,
      onChanged: onChangedAction,
      onFieldSubmitted: onSubmittedAction,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      enabled: isEnable,
      readOnly: isReadOnly,
      cursorColor: Colors.black12,
      textAlignVertical: TextAlignVertical.center,
      validator: validator,
      obscureText: isObscure!,
      controller: controller,
      autofocus: autofocus,
      minLines: minLine,
      maxLines: maxLines,
      autovalidateMode: autovalidateMode,
      maxLength: maxLength,
      inputFormatters: inputFormatters ?? [],

      // textAlignVertical: const TextAlignVertical(y: 0.6),
      decoration: InputDecoration(
        errorMaxLines: 2,
        counter: showCounter! ? null : Offstage(),
        filled: true,
        suffix: suffix,
        isDense: isdense,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(
          minHeight: 32.h,
          minWidth: 32.w,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.COLOR_GREEN,
        suffixText: !showCounterInside!
            ? null
            : '${controller!.text.length.toString()}/${maxLength.toString()}',
        labelText: labelTextFlag ? labelText : null,
        hoverColor: Colors.black12,
        focusColor: Colors.black12,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dBorderRadius ?? 12.r),
          borderSide: BorderSide(
              color: Colors.black45, width: 1.5, style: BorderStyle.solid),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dBorderRadius ?? 12.r),
          borderSide: BorderSide(
              color: Colors.black45, width: 1.5, style: BorderStyle.solid),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dBorderRadius ?? 12.r),
          borderSide: BorderSide(
              color: Colors.black45, width: 1.5, style: BorderStyle.solid),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dBorderRadius ?? 12.r),
          borderSide: BorderSide(
              color: Colors.black45, width: 1.5, style: BorderStyle.solid),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dBorderRadius ?? 12.r),
          borderSide: BorderSide(
              color: Colors.red, width: 1.5, style: BorderStyle.solid),
        ),
        hintText: labelTextFlag ? null : placeholder,
        // contentPadding: EdgeInsets.only(
        //     left: horizontalPadding != null ? horizontalPadding!.h : 16.h,
        //     right:
        //         horizontalPadding != null ? (horizontalPadding! - 2).h : 16.h,
        //     top: verticalPadding ?? 12.h,
        //     bottom: verticalPadding ?? 12.h),
      ),
    );
  }
}
