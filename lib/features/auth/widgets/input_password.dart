import 'package:flutter/material.dart';
import 'package:food_app/config/constants/app_colors.dart';
import 'package:food_app/features/shared/inputs/password.dart';
import 'package:food_app/features/shared/widgets/text_field_container.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final Password value;
  final void Function(Password value) onChanged;

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  final TextEditingController controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      showPassword = false;
    });
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        widget.onChanged(Password.dirty(widget.value.value));
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
      child: Row(
        children: [
          Expanded(
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
                hintText: 'Password',
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
              controller: controller,
              onChanged: (value) {
                widget.onChanged(Password.dirty(value));
              },
              obscureText: !showPassword,
              focusNode: _focusNode,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: Icon(
              showPassword ? Icons.visibility : Icons.visibility_off,
              color: AppColors.eye,
            ),
          )
        ],
      ),
    );
  }
}
