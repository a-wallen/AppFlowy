import 'package:appflowy/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flowy_infra/image.dart';
import 'package:flowy_infra_ui/style_widget/text.dart';
import 'package:flutter/material.dart';

import 'theme_upload_button.dart';
import 'theme_upload_view.dart';

class ThemeUploadFailureWidget extends StatelessWidget {
  const ThemeUploadFailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context)
          .colorScheme
          .error
          .withOpacity(ThemeUploadWidget.fadeOpacity),
      padding: ThemeUploadWidget.padding,
      child: Column(
        children: [
          svgWidget(
            'home/close',
            size: ThemeUploadWidget.iconSize,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          FlowyText.medium(
            LocaleKeys.settings_appearance_themeUpload_failure.tr(),
          ),
          ThemeUploadWidget.elementSpacer,
          ThemeUploadButton(color: Theme.of(context).colorScheme.error),
        ],
      ),
    );
  }
}
