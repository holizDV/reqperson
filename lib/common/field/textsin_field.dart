import 'package:flutter/material.dart';

import '../../config/theme/theme.dart';
import 'decoration/field_decoration.dart';

enum TextSinFieldTheme { light, dark }

class TextSinField extends StatefulWidget {
  const TextSinField({
    super.key,
    required this.textController,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.onChange,
    this.readOnly = false,
    this.autovalidateMode,
    this.validator,
    this.textSinFieldTheme = TextSinFieldTheme.light,
  });

  final TextEditingController textController;
  final TextInputType keyboardType;
  final String? hintText;
  final Function(dynamic)? onChange;
  final bool readOnly;
  final TextSinFieldTheme textSinFieldTheme;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;

  @override
  State<TextSinField> createState() => _TextSinFieldState();
}

class _TextSinFieldState extends State<TextSinField> {
  bool _isFocused = false;
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
        keyboardType: widget.keyboardType,
        validator: (value) => _validator(value!),
        autovalidateMode: widget.autovalidateMode,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        textAlignVertical: TextAlignVertical.center,
        decoration: FieldDecoration(
          text: widget.textController.text,
          isFocused: _isFocused,
          isFieldError: _isFieldError,
          fillFieldColor: AppColor.backgroundCard,
        ).copyWith(
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
