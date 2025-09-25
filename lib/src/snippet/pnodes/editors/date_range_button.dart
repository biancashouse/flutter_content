// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:intl/intl.dart';

class DateRange {
  int? from;
  int? until;

  DateRange({this.from, this.until});
}

class DateRangeButton extends StatefulWidget {
  final int? from;
  final int? until;
  final ValueChanged<DateRange> onChangeF;
  final ScrollControllerName? scName;

  const DateRangeButton({
    this.from,
    this.until,
    required this.onChangeF,
    required this.scName,
    super.key,
  });

  @override
  State<DateRangeButton> createState() => _DateRangeButtonState();
}

class _DateRangeButtonState extends State<DateRangeButton> {
  late DateTime startOfPeriod;
  late DateTime endOfPeriod;
  late CalendarDatePicker2WithActionButtonsConfig config;

  @override
  void initState() {
    super.initState();
    startOfPeriod = widget.from != null
        ? DateTime.fromMillisecondsSinceEpoch(widget.from!)
        : DateTime.now();
    endOfPeriod = widget.until != null
        ? DateTime.fromMillisecondsSinceEpoch(widget.until!)
        : DateTime.now().add(const Duration(days: 7));
    if (endOfPeriod.isBefore(startOfPeriod)) startOfPeriod = endOfPeriod;
    config = _pickerConfig();

    // demo auto-show
    // fco.afterMsDelayDo(1000, () {
    //   FCO.om.showOP(const Key('monkey'));
    // });
  }

  @override
  void dispose() {
    if (!mounted) return;
    fco.logger.i('*** disposing DateRangeButton');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CalloutConfig calloutConfig = CalloutConfig(
      cId: 'DateRange',
      // targetGKF: () => gk,
      initialCalloutW: 425,
      initialCalloutH: 400,
      decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
      decorationBorderRadius: 16,
      targetPointerType: TargetPointerType.bubble()  ,
      initialTargetAlignment: Alignment.topRight,
      initialCalloutAlignment: Alignment.centerLeft,
      finalSeparation: 50,
      scrollControllerName: widget.scName,
    );

    return WrappedCallout(
      calloutConfig: calloutConfig,
      calloutBoxContentBuilderF: _boxContent,
      targetBuilderF: _target,
    );
  }

  Widget _target(BuildContext ctx) => Padding(
        padding: const EdgeInsets.all(15),
        child: ElevatedButton(
          onPressed: () {
            fco.unhideParentCallout(ctx, animateSeparation: true);
          },
          child: widget.from != widget.until
              // ? Text('From ${timeago.format(dialogCalendarPickerValue.value[0]!)} ${dialogCalendarPickerValue.value[0]!} \nUntil ${timeago.format(dialogCalendarPickerValue.value[1]!)} ${dialogCalendarPickerValue.value[1]!}')
              ? Text(
                  '${DateFormat('MMMMd').format(startOfPeriod)}\n'
                  '${DateFormat('MMMMd').format(endOfPeriod)}',
                )
              : const Text('polling period'),
        ),
      );

  Widget _boxContent(BuildContext ctx) => _datePicker(
        context: ctx,
        config: config,
        dialogSize: const Size(325, 400),
        borderRadius: BorderRadius.circular(15),
        value: [startOfPeriod, endOfPeriod],
        dialogBackgroundColor: Colors.white,
      );

  CalendarDatePicker2WithActionButtonsConfig _pickerConfig() {
    const dayTextStyle =
        TextStyle(color: Colors.black, fontWeight: FontWeight.w700);
    final weekendTextStyle =
        TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600);
    final anniversaryTextStyle = TextStyle(
      color: Colors.red[400],
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
    );
    return CalendarDatePicker2WithActionButtonsConfig(
      dayTextStyle: dayTextStyle,
      calendarType: CalendarDatePicker2Type.range,
      selectedDayHighlightColor: Colors.purple[800],
      closeDialogOnCancelTapped: true,
      firstDayOfWeek: 1,
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      controlsTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      centerAlignModePicker: true,
      customModePickerIcon: const SizedBox(),
      selectedDayTextStyle: dayTextStyle.copyWith(color: Colors.white),
      dayTextStylePredicate: ({required date}) {
        TextStyle? textStyle;
        if (date.weekday == DateTime.saturday ||
            date.weekday == DateTime.sunday) {
          textStyle = weekendTextStyle;
        }
        if (DateUtils.isSameDay(date, DateTime(2021, 1, 25))) {
          textStyle = anniversaryTextStyle;
        }
        return textStyle;
      },
      dayBuilder: ({
        required date,
        textStyle,
        decoration,
        isSelected,
        isDisabled,
        isToday,
      }) {
        Widget? dayWidget;
        if (date.day % 3 == 0 && date.day % 9 != 0) {
          dayWidget = Container(
            decoration: decoration,
            child: Center(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Text(
                    MaterialLocalizations.of(context).formatDecimal(date.day),
                    style: textStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27.5),
                    child: Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: isSelected == true
                            ? Colors.white
                            : Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return dayWidget;
      },
      yearBuilder: ({
        required year,
        decoration,
        isCurrentYear,
        isDisabled,
        isSelected,
        textStyle,
      }) {
        return Center(
          child: Container(
            decoration: decoration,
            height: 36,
            width: 72,
            child: Center(
              child: Semantics(
                selected: isSelected,
                button: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      year.toString(),
                      style: textStyle,
                    ),
                    if (isCurrentYear == true)
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _datePicker({
    required BuildContext context,
    required CalendarDatePicker2WithActionButtonsConfig config,
    required Size dialogSize,
    List<DateTime?> value = const [],
    BorderRadius? borderRadius,
    // Color? barrierColor = Colors.black54,
    // bool useSafeArea = true,
    Color? dialogBackgroundColor,
  }) =>
      SizedBox(
        width: dialogSize.width,
        height: max(dialogSize.height, 410),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CalendarDatePicker2WithActionButtons(
              value: value,
              config: config.copyWith(openedFromDialog: false),
              onCancelTapped: () {
                fco.hideParentCallout(context);
              },
              onOkTapped: () {
                fco.hideParentCallout(context);
              },
              onValueChanged: (List<DateTime?> newDTs) {
                // ignore: avoid_print
                fco.logger.i(_getValueText(
                  config.calendarType,
                  newDTs,
                ));
                startOfPeriod = newDTs[0] ?? DateTime.now();
                endOfPeriod = newDTs[1] ?? startOfPeriod;
                widget.onChangeF(DateRange(
                    from: startOfPeriod.millisecondsSinceEpoch,
                    until: endOfPeriod.millisecondsSinceEpoch));
              },
            ),
          ],
        ),
      );
}

String _getValueText(
  CalendarDatePicker2Type datePickerType,
  List<DateTime?> values,
) {
  values = values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
  var valueText = (values.isNotEmpty ? values[0] : null)
      .toString()
      .replaceAll('00:00:00.000', '');

  if (datePickerType == CalendarDatePicker2Type.multi) {
    valueText = values.isNotEmpty
        ? values
            .map((v) => v.toString().replaceAll('00:00:00.000', ''))
            .join(', ')
        : 'null';
  } else if (datePickerType == CalendarDatePicker2Type.range) {
    if (values.isNotEmpty) {
      final startDate = values[0].toString().replaceAll('00:00:00.000', '');
      final endDate = values.length > 1
          ? values[1].toString().replaceAll('00:00:00.000', '')
          : 'null';
      valueText = '$startDate to $endDate';
    } else {
      return 'null';
    }
  }

  return valueText;
}
