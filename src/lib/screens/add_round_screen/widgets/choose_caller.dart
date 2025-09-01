import 'package:flutter/material.dart';
import '../../../themes/app_theme.dart';

class ChooseCaller extends StatelessWidget {
  final int selectedChoice;
  final Color selectedColor;
  final Color notSelectedColor;
  final Function(int id) onTap;

  const ChooseCaller(
      {super.key,
      required this.selectedChoice,
      required this.selectedColor,
      required this.notSelectedColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        InkWell(
            onTap: () => onTap(0),
            child: Padding(
              padding: AppTheme.chooseCallerItemPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: AppTheme.chooseCallerCircleAvatarRadius,
                    backgroundColor: (selectedChoice == 0)
                        ? selectedColor
                        : notSelectedColor,
                  ),
                 const SizedBox(
                    width: AppTheme.chooseCallerIconTextSpacing,
                  ),
                  Text(
                    "ZOVE",
                    style: AppTheme.chooseCallerTextStyle.copyWith(
                        color: (selectedChoice == 0)
                            ? selectedColor
                            : notSelectedColor),
                  )
                ],
              ),
            )),
        const Spacer(),
       const SizedBox(
          width: AppTheme.chooseCallerHorizontalSpacing,
        ),
        const Spacer(),
        InkWell(
            onTap: () => onTap(1),
            child: Padding(
              padding: AppTheme.chooseCallerItemPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: AppTheme.chooseCallerCircleAvatarRadius,
                    backgroundColor: (selectedChoice == 1)
                        ? selectedColor
                        : notSelectedColor,
                  ),
                 const SizedBox(
                    width: AppTheme.chooseCallerIconTextSpacing,
                  ),
                  Text(
                    "ZOVE",
                    style: AppTheme.chooseCallerTextStyle.copyWith(
                        color: (selectedChoice == 1)
                            ? selectedColor
                            : notSelectedColor),
                  )
                ],
              ),
            )),
        const Spacer(),
      ],
    );
  }
}
