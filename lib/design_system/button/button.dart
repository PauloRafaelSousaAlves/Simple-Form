import 'package:flutter/material.dart';
import 'package:simple_form/design_system/color/ds_colors.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    Key? key,
    this.width,
    this.height,
    this.text,
    required this.color,
    this.textColor,
    this.onTap,
    required this.enable,
    required this.enableBorder,
    this.padding,
    this.icon,
    this.paddingIcon,
    this.buttonText,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? text;
  final String? buttonText;
  final Color color;
  final Color? textColor;
  final VoidCallback? onTap;
  final bool enable;
  final bool enableBorder;
  final EdgeInsetsGeometry? padding;
  final Icon? icon;

  final EdgeInsetsGeometry? paddingIcon;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0),
      child: GestureDetector(
        onTap: widget.enable ? widget.onTap : null,
        child: Container(
          alignment: Alignment.bottomCenter,
          height: widget.height,
          width: widget.width ?? double.infinity,
          decoration: getDecoration(),
          child: getButton(),
        ),
      ),
    );
  }

  getDecoration() {
    return BoxDecoration(
      color: widget.color,
      border: widget.enableBorder ? Border.all(color: DSColors.grey60) : null,
    );
  }

  getButton() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: widget.paddingIcon ?? const EdgeInsets.all(0),
            child: widget.icon ?? const SizedBox(),
          ),
          getText(),
        ],
      ),
    );
  }

  getText() {
    return widget.buttonText ??
        Text(
          widget.text!,
          style: TextStyle(
            color: widget.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        );
  }
}
