// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:wallify_ui/types/bottomnav.dart';
//
// import 'admin/add_wallpaper.dart';
// import 'admin/admin_pannel.dart';
//
// void main() {
//   testWidgets('BottomNav widget test', (WidgetTester tester) async {
//     // Build our app and trigger a frame
//     await tester.pumpWidget(MaterialApp(
//       home: BottomNav(),
//     ));
//
//     // Verify that the initial page is the Home page
//     expect(find.text('Home'), findsOneWidget);
//     expect(find.text('Search'), findsNothing);
//     expect(find.text('Categories'), findsNothing);
//
//     // Tap on the search icon in the bottom navigation bar
//     await tester.tap(find.byIcon(Icons.search_outlined));
//     await tester.pump();
//
//     // Verify that the Search page is now visible
//     expect(find.text('Home'), findsNothing);
//     expect(find.text('Search'), findsOneWidget);
//     expect(find.text('Categories'), findsNothing);
//
//     // Tap on the categories icon in the bottom navigation bar
//     await tester.tap(find.byIcon(Icons.category));
//     await tester.pump();
//
//     // Verify that the Categories page is now visible
//     expect(find.text('Home'), findsNothing);
//     expect(find.text('Search'), findsNothing);
//     expect(find.text('Categories'), findsOneWidget);
//   });
// }
//
//
//
//
//
// void main() {
//   testWidgets('AdminLogIn widget test', (WidgetTester tester) async {
//     await tester.pumpWidget(MaterialApp(
//       home: AdminLogIn(),
//     ));
//
//     // Verify that the initial state shows the login form
//     expect(find.text('username'), findsOneWidget);
//     expect(find.text('password'), findsOneWidget);
//     expect(find.text('Login'), findsOneWidget);
//
//     // Enter invalid username and password
//     await tester.enterText(find.byType(TextFormField).first, 'invalid_username');
//     await tester.enterText(find.byType(TextFormField).last, 'invalid_password');
//
//     // Tap on the Login button
//     await tester.tap(find.text('Login'));
//     await tester.pump();
//
//     // Verify that a snackbar is shown with an error message
//     expect(find.text('Your username is not correct'), findsOneWidget);
//
//     // Enter valid username and invalid password
//     await tester.enterText(find.byType(TextFormField).first, 'valid_username');
//     await tester.enterText(find.byType(TextFormField).last, 'invalid_password');
//
//     // Tap on the Login button
//     await tester.tap(find.text('Login'));
//     await tester.pump();
//
//     // Verify that a snackbar is shown with an error message
//     expect(find.text('Your password is not correct'), findsOneWidget);
//
//     // Enter valid credentials
//     await tester.enterText(find.byType(TextFormField).first, 'valid_username');
//     await tester.enterText(find.byType(TextFormField).last, 'valid_password');
//
//     // Tap on the Login button
//     await tester.tap(find.text('Login'));
//     await tester.pumpAndSettle();
//
//     // Verify that navigation to AddWallpaper page occurs
//     expect(find.text('Add Wallpaper'), findsOneWidget);
//   });
// }
// i
// void main() {
//   group('AddWallpaper widget test', () {
//     testWidgets('Initial state test', (WidgetTester tester) async {
//       await tester.pumpWidget(MaterialApp(
//         home: AddWallpaper(),
//       ));
//
//       // Verify that the initial state shows the "Add Wallpaper" title
//       expect(find.text("Add Wallpaper"), findsOneWidget);
//
//       // Verify that the initial state shows the "Select Category" dropdown button
//       expect(find.text('Select Category'), findsOneWidget);
//
//       // Verify that the initial state shows the "ADD" button
//       expect(find.text('ADD'), findsOneWidget);
//
//       // Verify that no image is displayed initially
//       expect(find.byType(Image), findsNothing);
//     });
//
//     testWidgets('Image upload test', (WidgetTester tester) async {
//       await tester.pumpWidget(MaterialApp(
//         home: AddWallpaper(),
//       ));
//
//       // Verify that no image is displayed initially
//       expect(find.byType(Image), findsNothing);
//
//       // Tap on the container to trigger image selection
//       await tester.tap(find.byType(GestureDetector));
//       await tester.pump();
//
//       // Verify that an image is displayed after selection
//       expect(find.byType(Image), findsOneWidget);
//
//       // TODO: You need to mock the FirebaseStorage and DatabaseMethods to cover more test scenarios
//     });
//
//     testWidgets('Category selection test', (WidgetTester tester) async {
//       await tester.pumpWidget(MaterialApp(
//         home: AddWallpaper(),
//       ));
//
//       // Verify that no category is selected initially
//       expect(find.text('Select Category'), findsOneWidget);
//
//       // Select a category from the dropdown
//       await tester.tap(find.text('Select Category'));
//       await tester.pump();
//       await tester.tap(find.text('wildLife'));
//       await tester.pump();
//
//       // Verify that the selected category is displayed
//       expect(find.text('wildLife'), findsOneWidget);
//     });
//
//     // TODO: Add more test cases to cover additional functionalities like tapping on the "ADD" button.
//   });
// }
