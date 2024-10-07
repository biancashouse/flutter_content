// import 'package:flutter_test/flutter_test.dart';
// import 'package:get_time_ago/get_time_ago.dart';
//
// void main() {
//   group('Timeago', () {
//     test('a moment ago', () {
//       DateTime now = DateTime.now();
//       DateTime thirtySecondsAgo = now.subtract(const Duration(seconds: 30));
//       expect(GetTimeAgo.parse(thirtySecondsAgo), '30 seconds ago');
//     });
//
//     test('a minute ago', () {
//       DateTime now = DateTime.now();
//       DateTime oneMinuteAgo = now.subtract(const Duration(minutes: 1));
//       expect(GetTimeAgo.parse(oneMinuteAgo), 'a minute ago');
//     });
//
//     test('5 minutes ago', () {
//       DateTime now = DateTime.now();
//       DateTime fiveMinutesAgo = now.subtract(const Duration(minutes: 5));
//       expect(GetTimeAgo.parse(fiveMinutesAgo), '5 minutes ago');
//     });
//
//     test('an hour ago', () {
//       DateTime now = DateTime.now();
//       DateTime oneHourAgo = now.subtract(const Duration(hours: 1));
//       expect(GetTimeAgo.parse(oneHourAgo), 'an hour ago');
//     });
//
//     test('a day ago', () {
//       DateTime now = DateTime.now();
//       DateTime oneDayAgo = now.subtract(const Duration(days: 1));
//       expect(GetTimeAgo.parse(oneDayAgo), 'a day ago');
//     });
//
//     test('from date', () {
//       DateTime date = DateTime(2024, 9, 18,);
//       expect(GetTimeAgo.parse(date), '27 Sep, 2024 11:59 PM');
//     });
//     test('to date', () {
//       DateTime date = DateTime(2024, 9, 27, 23, 59);
//       expect(GetTimeAgo.parse(date), '27 Sep, 2024 11:59 PM');
//     });
//
//   });
// }
