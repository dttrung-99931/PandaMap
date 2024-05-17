import 'package:flutter/material.dart';
import 'package:panda_map/widgets/loading_widget.dart';

class MapSearchBarWidget extends StatefulWidget {
  final String? navigateToScreenOnPressed;
  final bool autoFocus;
  final TextEditingController controller;
  final void Function(String? text)? onEditingComplete;
  final void Function(String? text)? onTextChanged;
  final String hint;
  final bool showLoading;
  MapSearchBarWidget({
    Key? key,
    TextEditingController? controller,
    this.navigateToScreenOnPressed,
    this.autoFocus = false,
    this.onEditingComplete,
    this.onTextChanged,
    this.hint = 'Nhập....',
    this.showLoading = false,
  })  : controller = controller ?? TextEditingController(),
        super(key: key);

  @override
  State<MapSearchBarWidget> createState() => _MapSearchBarWidgetState();
}

class _MapSearchBarWidgetState extends State<MapSearchBarWidget> {
  late final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    if (widget.autoFocus) {
      _focusNode.requestFocus();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1))
          ]),
      alignment: Alignment.center,
      child: TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        onEditingComplete: () {
          widget.onEditingComplete?.call(widget.controller.text);
          // Hide keyboard, dont't know why keyboard still showing when edtEdit compelte
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: widget.onTextChanged,
        onTap: widget.navigateToScreenOnPressed != null ? _onPressed : null,
        readOnly: widget.navigateToScreenOnPressed != null,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          suffixIcon: widget.showLoading ? const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: LoadingWidget(center: false),
          ) : null,
          // set size for suffixIcon
          suffixIconConstraints: widget.showLoading ? const BoxConstraints(
            maxWidth: 24 + 8, // 8 padding right 
            maxHeight: 24,
          ) : null,
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
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.black.withOpacity(.5)),
        ),
        style: TextStyle(color: Colors.black.withOpacity(.9)),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }

  void _onPressed() {}
}
