import 'package:blablacar_part2/widgets/actions/bla_icon_button.dart';
import 'package:flutter/material.dart';

import '../../../model/ride_pref/ride_pref.dart';
import '../../../theme/theme.dart';
import '../../ride_pref/widgets/ride_pref_form.dart';

class RidePrefModal extends StatefulWidget {
  const RidePrefModal({super.key, required this.currentPreference});
  // TODO 7 : We should pass the current prefs to this moda;
  final RidePreference currentPreference;

  @override
  State<RidePrefModal> createState() => _RidePrefModalState();
}

class _RidePrefModalState extends State<RidePrefModal> {
  late RidePreference updatedPreference;
  @override
  void initState() {
    super.initState();
    // Initialize updatedPreference with the current preferences
    updatedPreference = widget.currentPreference;
  }

  void onBackSelected() {
    Navigator.of(context).pop();
  }

  void onSubmit(RidePreference newPreference) {
    // TODO 9 : We should pop this modal, with the new current preference
    // Set the updated preference to the new value
    updatedPreference = newPreference;
    // Pop this modal with the updated preference
    Navigator.of(context).pop(updatedPreference);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back icon
            BlaIconButton(onPressed: onBackSelected, icon: Icons.close),
            SizedBox(height: BlaSpacings.m),

            // Title
            Text(
              "Edit your search",
              style: BlaTextStyles.title.copyWith(color: BlaColors.textNormal),
            ),

            // Form
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: RidePrefForm(
                  // initialPreference:
                  //     null, // TODO 7 : The form should be displayed with the modal current prefs
                  initialPreference: updatedPreference,
                  onSubmit: onSubmit,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
