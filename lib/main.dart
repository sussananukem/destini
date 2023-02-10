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
      debugShowCheckedModeBanner: false,
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
  MyStoryBrain myStoryBrain = MyStoryBrain();
  @override
  Widget build(BuildContext context) {
    //Media Query
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/scene.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //STORY TEXT GOES HERE
                Expanded(
                  flex: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'images/speech-bubble.png',
                        ),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 90, top: 40, right: 20, left: 20),
                        child: Container(
                          //Applied MEDIA QUERY Here.
                          padding: width >= 800 ? const EdgeInsets.only(
                              bottom: 90, top: 40, right: 20, left: 20) :null,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          width: 512,
                          height: 250,
                          child: Center(
                            child: Text(
                              //Fetches the story text of the selected story
                              // instance based on the story number
                              myStoryBrain.getStoryText().storyText,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //CHOICE ONE BUTTON AND TEXT GO HERE
                Expanded(
                  flex: 2,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        //Based on the choice user makes, fetches another story
                        myStoryBrain.nextStory(1);
                      });
                    },
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          //Fetches the choiceOne text of the selected story
                          // instance based on the story number
                          myStoryBrain.getStoryText().choiceOne,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),

                //CHOICE TWO BUTTON AND TEXT GOES HERE
                Expanded(
                  flex: 2,
                  child: Visibility(
                    visible: myStoryBrain.buttonVisibility(),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          //Fetches another story based on user choice
                          myStoryBrain.nextStory(2);
                        });
                      },
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            //Fetches the choiceTwo text of the selected story
                            // instance based on the story number
                            myStoryBrain.getStoryText().choiceTwo,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Urbanist',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
