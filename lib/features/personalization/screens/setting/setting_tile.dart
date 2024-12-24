import 'package:cwt_ecommerce_app/features/personalization/screens/setting/switch.dart';
import 'package:cwt_ecommerce_app/utils/constants/image_strings.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class SettingTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String icon;
  final bool isSwitch;
  final VoidCallback? onTap;
  final bool? switchValue;
  final void Function(bool)? onChanged;
  const SettingTile({
    required this.title,
    required this.icon,
    this.switchValue,
    this.onChanged,
    this.subtitle,
    this.onTap,
    this.isSwitch = false,
    super.key,
  });

  @override
  State<SettingTile> createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      onTap: widget.onTap,
      leading: SvgPicture.asset(widget.icon),
      title: Text(widget.title,),
      subtitle: widget.isSwitch
          ? null
          : widget.subtitle != null
              ? Text(widget.subtitle!, )
              : null,
      trailing: widget.isSwitch
          ? CustomSwitch(
              value: widget.switchValue!,
              activeColor: isDarkMode(context)
                  ? Colors.black
                  : Colors.orange,
              onChanged: widget.onChanged!,
            )
          : SvgPicture.asset(
         TImages.user
              //AppAssets.kArrowBackForward,
             // color: AppColors.kSecondary.withOpacity(0.4),
            ),
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
    );
  }
}
