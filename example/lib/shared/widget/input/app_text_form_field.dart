import 'dart:async';

import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.decoration = const InputDecoration(),
    // this.initialValue,
    this.enabled,
    this.onChanged,
    this.controller,
    this.value,
  });
  // : assert(initialValue == null || controller == null);

  // final String? initialValue;
  final String? value;
  final bool? enabled;
  final InputDecoration? decoration;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late TextEditingController controller;

  late StreamController<String?> _updateController;

  late StreamSubscription<String?> _updateSubscription;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController(text: widget.value);
    _updateController = StreamController<String?>();
    _updateSubscription = _updateController.stream.listen(_listenUpdate);
  }

  void _listenUpdate(String? event) {
    if (!mounted) return;
    controller.text = event ?? '';
  }

  @override
  void dispose() {
    _updateSubscription.cancel();
    _updateController.close();
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AppTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.value != null &&
        controller.text != widget.value &&
        !_updateController.isClosed) {
      _updateController.add(widget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      decoration: widget.decoration,
      onChanged: widget.onChanged,
      controller: controller,
    );
  }
}
