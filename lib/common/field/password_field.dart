import 'package:flutter/material.dart';

import '../../config/theme/theme.dart';
import 'decoration/field_decoration.dart';

enum PasswordFieldTheme { light, dark }

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.textController,
    this.hintText,
    this.onChange,
    this.readOnly = false,
    this.validator,
    this.autovalidateMode,
    this.passwordFieldTheme = PasswordFieldTheme.dark,
  });

  final TextEditingController textController;
  final String? hintText;
  final Function(dynamic)? onChange;
  final bool readOnly;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final PasswordFieldTheme passwordFieldTheme;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isFocused = false;
  bool _isPasswordVisible = false;
  bool _isFieldError = false;

  @override
  void initState() {
    widget.textController.addListener(_controllerListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.textController.removeListener(_controllerListener);
    super.dispose();
  }

  void _onChanged(String value) {
    if (widget.autovalidateMode == null) {}
    if (widget.onChange != null) widget.onChange!(value);
  }

  void _controllerListener() {
    setState(() => _onChanged(widget.textController.text));
  }

  _validator(String value) {
    if (widget.validator != null) {
      final result = widget.validator!(value);
      _isFieldError = (result != null) ? true : false;
      return result;
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (isFocused) => setState(() => _isFocused = isFocused),
      child: TextFormField(
        controller: widget.textController,
        readOnly: widget.readOnly,
        style:
            Typograph.text14Regular.copyWith(color: AppColor.specialAlwaysDark),
        keyboardType: TextInputType.visiblePassword,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        obscuringCharacter: "●",
        obscureText: !_isPasswordVisible,
        validator: (value) => _validator(value!),
        autovalidateMode: widget.autovalidateMode,
        onChanged: _onChanged,
        textAlignVertical: TextAlignVertical.center,
        decoration: FieldDecoration(
          text: widget.textController.text,
          isFocused: _isFocused,
          isFieldError: _isFieldError,
          fillFieldColor: AppColor.backgroundCard,
        ).copyWith(
          hintText: widget.hintText,
          suffixIcon: GestureDetector(
            onTap: () => setState(
              () => _isPasswordVisible = !_isPasswordVisible,
            ),
            child: Icon(
              _isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: AppColor.foregroundPrimaryText,
              size: AppSize.s18,
            ),
          ),
        ),
      ),
    );
  }
}
