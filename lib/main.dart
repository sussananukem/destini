import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StoryBrain storyBrain = StoryBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Destini')),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'images/bg.jpg',
                ),
                fit: BoxFit.cover)),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
              Expanded(
                flex: 12,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Text(
                      storyBrain.getStory(),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                    child: Text(
                      storyBrain.getChoiceOne(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueGrey[50],
                    ),
                    child: Text(
                      storyBrain.getChoiceTwo(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
