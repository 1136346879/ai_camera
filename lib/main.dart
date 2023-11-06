import 'package:ai_camera/camera_widget_page.dart';
import 'package:flutter/material.dart';
import 'package:hy_flutter_utils/hy_flutter_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ai Camera'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Text(widget.title),
        actions: [
          Image.asset('assets/images/more.png').marginOnly(left: 20),
          const Expanded(child: SizedBox())
        ],
      ),
      body: HYContainer(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const HyText(
              'Virtual\nHair Color',
              fontWeight: FontWeight.w700,
              fontSize: 40,
              textColor: Config.color595959,
            ),
            const HyText(
              'AI Camera App',
              fontSize: 20,
              textColor: Config.color8A8A8A,
            ),
            const HYContainer(
              margin: EdgeInsets.only(top: 10, bottom: 50),
              child: HyText(
                "It's time for change! Try a new hair shade has never been easier! have a fun with this app you can choose best hair color for yourself with our AI technology.",
                fontSize: 18,
                textColor: Config.color8A8A8A,
              ),
            ),
            _buttonBlue(),
            _buttonYellow()
          ],
        ),
      ),
    );
  }

  _buttonYellow() {
    return HYContainer(
      margin: const EdgeInsets.only(top: 40),
      backgroundColor: Colors.blue,
      padding: const EdgeInsets.all(20),
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      gradient: LinearGradient(
        colors: <Color>[
          Colors.orange.shade100,
          Colors.orange,
        ],
      ),
      onTap: () {
        Get.to( CameraWidgetPage());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HyText(
                'Buy Premium Now ',
                fontSize: 20,
                textColor: Colors.white,
              ),
              HyText(
                'Get unlimited access to all filters',
                fontSize: 12,
                textColor: Colors.white,
              ),
            ],
          ),
          Image.asset('assets/images/arrorw.png')
        ],
      ),
    );
  }

  _buttonBlue() {
    return HYContainer(
      backgroundColor: Colors.blue,
      padding: const EdgeInsets.all(20),
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      gradient: LinearGradient(
        colors: <Color>[
          Colors.blue.shade100,
          Colors.blue,
        ],
      ),
      onTap: () {
        Get.to( CameraWidgetPage());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HyText(
                'Try Now Free ',
                fontSize: 20,
                textColor: Colors.white,
              ),
              HyText(
                'Limited access of filters',
                fontSize: 12,
                textColor: Colors.white,
              ),
            ],
          ),
          Image.asset('assets/images/arrorw.png')
        ],
      ),
    );
  }
}
