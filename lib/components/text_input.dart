import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputFormField extends StatefulWidget {

  final ValueChanged<String> onChanged;
  final List<TextInputFormatter> inputFormatters;
  final FormFieldValidator<String> validator;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLength;
  final String initialValue;
  final bool obscureText;
  final Widget suffixIcon;
  final Widget preffixIcon;
  final double fontSize;
  final FocusNode focusNode;
  final bool enabled;
  final bool darkTheme;
  final TextEditingController controller;
  final int maxLines;
  final EdgeInsets contentPadding;
  final TextAlign textAlign;
  final VoidCallback onEditingComplete;
  final TextInputAction textInputAction;
  final BorderRadius borderRadius;
  final TextCapitalization textCapitalization;
  final Color darkThemeColorBorderColor;

  TextInputFormField({
    @required this.onChanged,
    this.inputFormatters,
    this.validator,
    this.hintText,
    @required this.keyboardType,
    this.maxLength,
    this.initialValue,
    this.obscureText = false,
    this.fontSize = 15,
    this.focusNode,
    this.suffixIcon,
    this.preffixIcon,
    this.enabled,
    this.darkTheme,
    this.darkThemeColorBorderColor = const Color(0xFF303030),
    this.textAlign,
    this.controller,
    this.contentPadding,
    this.maxLines = 1,
    this.onEditingComplete,
    this.textInputAction,
    this.borderRadius,
    this.textCapitalization = TextCapitalization.none
  }) :  assert(onChanged != null),
        assert(keyboardType != null);
  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInputFormField>{
  Color darkThemeColorBorderColor;
  @override
  void initState() {
    super.initState();
    darkThemeColorBorderColor = widget.darkThemeColorBorderColor;
  }
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return TextFormField(
      onEditingComplete: widget.onEditingComplete == null? () => node.nextFocus() : widget.onEditingComplete,
      textInputAction: widget.textInputAction == null? TextInputAction.next : widget.textInputAction,
      maxLines: widget.maxLines,
      controller: widget.controller,
      focusNode: widget.focusNode,
      initialValue: widget.initialValue,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator == null? _nullValidator() : widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      enabled: widget.enabled,
      textAlign: widget.textAlign == null? TextAlign.start : widget.textAlign,
      textCapitalization: widget.textCapitalization,
      decoration: InputDecoration(
        counterText: "",
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.preffixIcon,
        contentPadding: widget.contentPadding == null? EdgeInsets.symmetric(horizontal: 25, vertical: 15) : widget.contentPadding,
        fillColor: widget.darkTheme == false || widget.darkTheme == null ? Colors.white : Colors.black,
        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: widget.darkTheme == false || widget.darkTheme == null ? Color(0xFFCCCCCC) : Colors.white,
            height: 1
        ),
        errorBorder: _outLineStyle(),
        focusedErrorBorder: _outLineStyle(),
        enabledBorder: _outLineStyle(),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: widget.darkTheme == false || widget.darkTheme == null ? Colors.black : Colors.white
            ),
            borderRadius: widget.borderRadius == null? BorderRadius.circular(100) : widget.borderRadius
        ),

      ),
      style: TextStyle(
          fontFamily: "Jost Medium",
          fontSize: widget.fontSize,
          color: widget.darkTheme == false || widget.darkTheme == null ? Colors.black : Colors.white
      ),
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
    );
  }

  OutlineInputBorder _outLineStyle(){
    return OutlineInputBorder(
        borderSide: BorderSide(
            width: 2,
            color: widget.darkTheme == false || widget.darkTheme == null ? Color(0xFFCCCCCC) : darkThemeColorBorderColor
        ),
        borderRadius: widget.borderRadius == null? BorderRadius.circular(100) : widget.borderRadius
    );
  }

  _nullValidator(){
    return null;
  }
}