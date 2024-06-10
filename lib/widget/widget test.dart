// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:image_picker/image_picker.dart';
// import '../admin/add_wallpaper.dart';
// import '../admin/admin_pannel.dart';
// import '../types/bottomnav.dart';
// import '../types/categories.dart';
// import '../types/home.dart';
// import '../types/search.dart'; // Import your home, search, and categories widgets
//
// void main() {
//   testWidgets('BottomNav widget test', (WidgetTester tester) async {
//     // Build the BottomNav widget
//     await tester.pumpWidget(MaterialApp(
//       home: BottomNav(),
//     ));
//
//     // Verify that the initial state shows the Home widget
//     expect(find.byType(Home), findsOneWidget);
//
//     // Tap on the search icon in the bottom navigation bar
//     await tester.tap(find.byIcon(Icons.search_outlined));
//     await tester.pump();
//
//     // Verify that the Search widget is displayed
//     expect(find.byType(Search), findsOneWidget);
//
//     // Tap on the categories icon in the bottom navigation bar
//     await tester.tap(find.byIcon(Icons.category));
//     await tester.pump();
//
//     // Verify that the Categories widget is displayed
//     expect(find.byType(Categories), findsOneWidget);
//   });
// }
//
// void main() {
//   testWidgets('AdminLogIn widget test', (WidgetTester tester) async {
//     // Build the AdminLogIn widget
//     await tester.pumpWidget(MaterialApp(
//       home: AdminLogIn(),
//     ));
//
//     // Verify that the initial state shows the username and password fields
//     expect(find.byType(TextFormField), findsNWidgets(2));
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
//
// // Mock ImagePicker class
// class MockImagePicker extends Mock implements ImagePicker {
//   @override
//   Future<XFile?> pickImage({required ImageSource source, double? maxWidth, double? maxHeight, int? imageQuality, CameraDevice preferredCameraDevice = CameraDevice.rear, bool requestFullMetadata = true}) {
//     // TODO: implement pickImage
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<XFile?> pickMedia({double? maxWidth, double? maxHeight, int? imageQuality, bool requestFullMetadata = true}) {
//     // TODO: implement pickMedia
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<List<XFile>> pickMultiImage({double? maxWidth, double? maxHeight, int? imageQuality, bool requestFullMetadata = true}) {
//     // TODO: implement pickMultiImage
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<List<XFile>> pickMultipleMedia({double? maxWidth, double? maxHeight, int? imageQuality, bool requestFullMetadata = true}) {
//     // TODO: implement pickMultipleMedia
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<XFile?> pickVideo({required ImageSource source, CameraDevice preferredCameraDevice = CameraDevice.rear, Duration? maxDuration}) {
//     // TODO: implement pickVideo
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<LostDataResponse> retrieveLostData() {
//     // TODO: implement retrieveLostData
//     throw UnimplementedError();
//   }
//
//   @override
//   bool supportsImageSource(ImageSource source) {
//     // TODO: implement supportsImageSource
//     throw UnimplementedError();
//   }
// }
//
// class Mock {
// }
//
// void main() {
//   group('AddWallpaper widget test', () {
//     late MockImagePicker mockImagePicker;
//
//     setUp(() {
//       mockImagePicker = MockImagePicker();
//     });
//
//     testWidgets('Initial state test', (WidgetTester tester) async {
//       await tester.pumpWidget(MaterialApp(
//         home: AddWallpaper(),
//       ));
//
//       // Verify that the initial state shows the "Add Wallpaper" title
//       expect(find.text('Add Wallpaper'), findsOneWidget);
//
//       // Verify that the initial state shows the "Select Category" dropdown
//       expect(find.text('Select Category'), findsOneWidget);
//
//       // Verify that the initial state shows the "ADD" button
//       expect(find.text('ADD'), findsOneWidget);
//     });
//
//     testWidgets('Image selection test', (WidgetTester tester) async {
//       when(mockImagePicker.pickImage(source: ImageSource.gallery))
//           .thenAnswer((_) async => PickedFile('path/to/image'));
//
//       await tester.pumpWidget(MaterialApp(
//         home: AddWallpaper(),
//       ));
//
//       // Tap on the container to select an image
//       await tester.tap(find.byType(GestureDetector));
//
//       // Wait for the image selection to complete
//       await tester.pumpAndSettle();
//
//       // Verify that the selected image is displayed
//       expect(find.byType(Image), findsOneWidget);
//     });
//
//     testWidgets('Category selection test', (WidgetTester tester) async {
//       await tester.pumpWidget(MaterialApp(
//         home: AddWallpaper(),
//       ));
//
//       // Open the dropdown menu
//       await tester.tap(find.text('Select Category'));
//       await tester.pump();
//
//       // Select a category from the dropdown
//       await tester.tap(find.text('Nature').last);
//       await tester.pump();
//
//       // Verify that the selected category is updated
//       expect(find.text('Nature'), findsOneWidget);
//     });
//
//     testWidgets('ADD button test', (WidgetTester tester) async {
//       await tester.pumpWidget(MaterialApp(
//         home: AddWallpaper(),
//       ));
//
//       // Tap on the ADD button
//       await tester.tap(find.text('ADD'));
//       await tester.pump();
//
//       // Verify that the uploaditem function is called
//       // You need to mock the FirebaseStorage and DatabaseMethods classes
//       // and set expectations accordingly
//     });
//   });
// }
//
//
//
