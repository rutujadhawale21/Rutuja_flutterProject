import 'package:flutter/material.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.sufixWidget,
    this.validator,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final Widget? sufixWidget;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  bool showHidePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? showHidePassword : false,
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      validator: widget.validator,
      decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showHidePassword != showHidePassword;
                    });
                  },
                  icon: widget.isPassword
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off))
              : widget.sufixWidget,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red)),
          filled: true,
          fillColor: Colors.white),
      onTap: () {},
    );
  }
}
