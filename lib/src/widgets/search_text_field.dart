import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../base/utils/constants/color_constant.dart';
import '../base/utils/constants/fontsize_constant.dart';

class SearchTextField extends StatefulWidget {
  final String hint;
  final String? label;
  final FocusNode focusNode;
  final TextInputType type;
  final String? trailingIcon;
  final int? maxLength;
  final bool enabled;
  final bool isObscureText;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController controller;
  final Function(String?)? onSaved;
  final String? Function(String?)? validateFunction;
  final Function? endIconClick;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final int maxLines;
  final bool autoFocus;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? onSuffixIconPressed;
  final double borderRadius;
  final Color textColor;
  final Color? fillColor;
  final Color borderColor;
  final Color hintColor;
  final Color? cursorColor;
  final String? fontFamily;
  final Function()? onTap;
  final bool readOnly;
  final TextCapitalization textCapitalization;

  const SearchTextField(
      {Key? key,
      required this.hint,
      required this.focusNode,
      required this.type,
      this.trailingIcon,
      this.isObscureText = false,
      required this.textInputAction,
      this.enabled = true,
      this.onSaved,
      this.maxLength,
      this.validateFunction,
      this.endIconClick,
      this.onFieldSubmitted,
      this.textInputFormatter,
      this.onChanged,
      required this.controller,
      this.maxLines = 1,
      this.autoFocus = false,
      this.prefixIcon,
      this.suffixIcon,
      this.onSuffixIconPressed,
      this.label,
      this.borderRadius = 0,
      required this.textColor,
      this.fillColor,
      required this.borderColor,
      required this.hintColor,
      this.cursorColor = primaryColor,
      this.onTap,
      this.fontFamily = "EBGaramond",
      required this.textCapitalization,
      this.readOnly = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchTextFieldState();
}

class SearchTextFieldState extends State<SearchTextField> {
  bool _obscureText = true;
  String? text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: widget.cursorColor,
      autofocus: widget.autoFocus,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      maxLength: widget.maxLength,
      focusNode: widget.focusNode,
      textCapitalization: widget.textCapitalization,
      enabled: widget.enabled,
      style: TextStyle(
          color: widget.enabled ? widget.textColor : primaryTextColor,
          fontSize: fontSize16,
          fontWeight: fontWeightRegular,
          fontFamily: widget.fontFamily ?? 'EBGaramond'),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        fillColor: widget.fillColor ?? themeColor,
        filled: true,
        labelText: widget.hint,
        labelStyle: TextStyle(
            color: widget.hintColor,
            fontSize: fontSize14,
            fontFamily: widget.fontFamily ?? 'EBGaramond'),
        hintStyle: TextStyle(
            color: widget.hintColor,
            fontSize: fontSize14,
            fontFamily: widget.fontFamily ?? 'EBGaramond'),
        counter: const Offstage(),
        contentPadding: const EdgeInsets.all(12.0),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: redColor, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: widget.borderColor, width: 1)),
        disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: widget.borderColor, width: 1)),
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: widget.borderColor, width: 1)),
        errorMaxLines: 3,
        errorStyle: const TextStyle(color: redColor),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: widget.borderColor, width: 1),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          gapPadding: 10.0,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: redColor, width: 1),
        ),
        prefixIcon: widget.prefixIcon != null ? _prefixIconCheck() : null,
        prefixText: " ",
        suffixIcon: widget.isObscureText
            ? _passwordIcon()
            : widget.suffixIcon != null
                ? _suffixIconCheck()
                : null,
      ),
      maxLines: widget.maxLines,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validateFunction,
      onSaved: widget.onSaved,
      inputFormatters: widget.textInputFormatter,
      keyboardType: widget.type,
      obscureText: widget.isObscureText ? _obscureText : false,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
    );
  }

  _prefixIconCheck() => Padding(
        padding: const EdgeInsetsDirectional.all(2),
        child: Container(
          child: Icon(
            widget.prefixIcon,
            color: blackColor,
            size: 30,
          ),
        ),
      );

  _suffixIconCheck() => GestureDetector(
        onTap: widget.onSuffixIconPressed,
        child: Padding(
          padding: const EdgeInsetsDirectional.all(2),
          child: Icon(
            widget.suffixIcon,
            size: 20,
          ),
        ),
      );

  _passwordIcon() => InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: SizedBox(
          height: 15,
          width: 15,
          child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,
              color: primaryTextColor),
        ),
      );
}
