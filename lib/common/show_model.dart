import 'package:f_riverpot_connected_firebase/models/todo_model.dart';
import 'package:f_riverpot_connected_firebase/provider/service_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../provider/date_time_provider.dart';
import '../provider/radio_provider.dart';
import '../widgets/date_time_widget.dart';
import '../widgets/radio_widget.dart';
import '../widgets/textfield_widget.dart';
import 'package:f_riverpot_connected_firebase/appstyle.dart';

class AddNewTaskModel extends ConsumerWidget {
  AddNewTaskModel({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateProvider);
    final radioCategory = ref.watch(dateProvider);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        height: 0.8 * MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                "New Task Todo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey,
            ),
            Gap(12),
            Text(
              "Title Task",
              style: AppStyle.headingOne,
            ),
            Gap(6),
            TextFieldWidget(
              hintText: "Add Name Task",
              maxLines: 1,
              txtController: titleController,
            ),
            Gap(12),
            Text('Description', style: AppStyle.headingOne),
            Gap(12),
            TextFieldWidget(
              hintText: "Add Description",
              maxLines: 5,
              txtController: descriptionController,
            ),
            Gap(12),
            Text("Category", style: AppStyle.headingOne),
            Row(
              children: [
                Expanded(
                    child: RadioWidget(
                        onChangeValue: () => ref
                            .read(radioProvider.notifier)
                            .update((state) => 1),
                        valueInput: 1,
                        titleRadio: "WRK",
                        categColor: Colors.green.shade200)),
                Expanded(
                  child: RadioWidget(
                      onChangeValue: () =>
                          ref.read(radioProvider.notifier).update((state) => 2),
                      valueInput: 2,
                      titleRadio: 'WRK',
                      categColor: Colors.blueAccent),
                ),
                Expanded(
                  child: RadioWidget(
                      onChangeValue: () =>
                          ref.read(radioProvider.notifier).update((state) => 3),
                      valueInput: 3,
                      titleRadio: 'GEN',
                      categColor: Colors.amberAccent),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateTimeWidget(
                  titleText: "Date",
                  valueText: dateProv,
                  iconSection: CupertinoIcons.calendar,
                  onTap: () async {
                    final getValue = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2025));

                    if (getValue != null) {
                      final format = DateFormat.yMd();
                      ref
                          .read(dateProvider.notifier)
                          .update((state) => format.format(getValue));
                    }
                  },
                ),
                Gap(22),
                DateTimeWidget(
                  titleText: "Time",
                  valueText: ref.watch(timeProvider),
                  iconSection: CupertinoIcons.clock,
                  onTap: () async {
                    final getTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (getTime != null) {
                      ref
                          .read(timeProvider.notifier)
                          .update((state) => getTime.format(context));
                    }
                  },
                ),
              ],
            ),
            Gap(20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      onPrimary: Colors.blue.shade800,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: Colors.blue.shade800,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel"),
                  ),
                ),
                Gap(20),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      onPrimary: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: Colors.blue.shade800,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      final getRadioValue = ref.read(radioProvider);
                      String category = '';

                      switch (getRadioValue) {
                        case 1:
                          category = 'Learning';
                          break;
                        case 2:
                          category = 'Working';
                          break;
                        case 3:
                          category = 'General';
                          break;
                      }
                      // Logic for Save

                      ref.read(serviceProvider).addNewTask(TodoModel(
                            titleTask: titleController.text,
                            description: descriptionController.text,
                            category: category,
                            dateTask: ref.read(dateProvider),
                            timeTask: ref.read(timeProvider),
                          ));
                    },
                    child: Text("Create"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
