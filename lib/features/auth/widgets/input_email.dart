import 'package:flutter/material.dart';
import 'package:food_app/config/constants/app_colors.dart';
import 'package:food_app/features/shared/inputs/email.dart';
import 'package:food_app/features/shared/widgets/text_field_container.dart';

class InputEmail extends StatefulWidget {
  const InputEmail({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final Email value;
  final void Function(Email value) onChanged;

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  final TextEditingController controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        widget.onChanged(Email.dirty(widget.value.value));
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.value = controller.value.copyWith(
      text: widget.value.value,
      selection: TextSelection.collapsed(
        offset: controller.selection.end,
      ),
    );
    return TextFieldContainer(
      errorMessage: widget.value.errorMessage,
      child: TextFormField(
        style: const TextStyle(
          color: AppColors.text1,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 22 / 14,
        ),
        decoration: const InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          isDense: true,
          hintText: 'example@gmail.com',
          hintStyle: TextStyle(
            color: AppColors.placeholder,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 22 / 14,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        onChanged: (value) {
          widget.onChanged(Email.dirty(value));
        },
        focusNode: _focusNode,
      ),
    );
  }
}
