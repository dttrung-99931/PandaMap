import 'package:flutter/material.dart';

class MapSearchBarWidget extends StatelessWidget {
  final String? navigateToScreenOnPressed;
  final bool autoFocus;
  final TextEditingController controller;
  final void Function(String? text)? onEditingComplete;
  final void Function(String? text)? onTextChanged;
  final String hint;

  MapSearchBarWidget({
    Key? key,
    TextEditingController? controller,
    this.navigateToScreenOnPressed,
    this.autoFocus = false,
    this.onEditingComplete,
    this.onTextChanged,
    this.hint = 'Nhập....',
  })  : controller = controller ?? TextEditingController(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.8),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black54),
      ),
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        onEditingComplete: () {
          onEditingComplete?.call(controller.text);
        },
        onChanged: onTextChanged,
        onTap: navigateToScreenOnPressed != null ? _onPressed : null,
        autofocus: autoFocus,
        readOnly: navigateToScreenOnPressed != null,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          border: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              Icons.search,
              size: 20,
              color: Colors.black45,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxWidth: 36,
            minWidth: 36,
          ),
          isDense: true,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black.withOpacity(.5)),
        ),
        style: TextStyle(color: Colors.black.withOpacity(.9)),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }

  void _onPressed() {}
}
