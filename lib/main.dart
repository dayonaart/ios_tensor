import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ios_tensor/face_dectection.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          top: true,
          child: Scaffold(
            body: Center(
              child: CustomCard('Face Detection', FaceDetectorView()),
            ),
          )),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String _label;
  final Widget _viewPage;
  final bool featureCompleted;

  CustomCard(this._label, this._viewPage, {this.featureCompleted = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor,
        title: Text(
          _label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          if (!featureCompleted) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: const Text('This feature has not been implemented yet')));
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => _viewPage));
          }
        },
      ),
    );
  }
}
