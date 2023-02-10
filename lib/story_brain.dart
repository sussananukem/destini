import 'package:flutter/services.dart';

import 'story.dart';

class MyStoryBrain {
  int _storyNumber = 0;

  //Shows type of elements to be in the list
  //List contains a collection of MyStory class instances
  final List<MyStory> _storyBank = [
    MyStory(
      storyText: 'Your car has blown a tire on a winding road in the middle of'
          ' nowhere with no cell phone reception. You decide to hitchhike. '
          'A rusty pickup truck rumbles to a stop next to you. A man with a '
          'wide brimmed hat with soulless eyes opens the passenger door for you'
          ' and asks: "Need a ride, boy?".',
      choiceOne: 'I\'ll hop in. Thanks for the help!',
      choiceTwo: 'Better ask him if he\'s a murderer first.',
    ),
    MyStory(
        storyText: 'He nods slowly, unphased by the question.',
        choiceOne: 'At least he\'s honest. I\'ll climb in.',
        choiceTwo: 'Wait, I know how to change a tire.'),
    MyStory(
        storyText:
            'As you begin to drive, the stranger starts talking about his '
            'relationship with his mother. He gets angrier and angrier by'
            ' the minute. He asks you to open the glovebox. Inside you '
            'find a bloody knife, two severed fingers, and a cassette tape '
            'of Elton John. He reaches for the glove box.',
        choiceOne: 'I love Elton John! Hand him the cassette tape.',
        choiceTwo: 'It\'s him or me! You take the knife and stab him.'),
    MyStory(
        storyText:
            'What? Such a cop out! Did you know traffic accidents are the '
            'second leading cause of accidental death for most adult age '
            'groups?',
        choiceOne: 'Restart',
        choiceTwo: 'End Game'),
    MyStory(
        storyText:
            'As you smash through the guardrail and careen towards the jagged'
            ' rocks below you reflect on the dubious wisdom of stabbing someone '
            'while they are driving a car you are in.',
        choiceOne: 'Restart',
        choiceTwo: 'End Game'),
    MyStory(
        storyText:
            'You bond with the murderer while crooning verses of "Can you '
            'feel the love tonight". He drops you off at the next town. '
            'Before you go he asks you if you know any good places to dump '
            'bodies. You reply: "Try the pier".',
        choiceOne: 'Restart',
        choiceTwo: 'End Game')
  ];

  //This function fetches a story instance from the story bank(contains:
  // storyText, choiceOne and choiceTwo)
  MyStory getStoryText() {
    return _storyBank[_storyNumber];
  }

  //Used alongside the Visibility widget wrapped around choiceTwo button to
  // show or hide button when a condition is satisfied
  bool buttonVisibility() {
    if (_storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2) {
      return true;
    } else {
      return false;
    }
  }

  //This function is used to organize the story flow based on the use
  // choices, i.e if user selects choiceOne when he's at story One, it takes
  // them to a different story...etc
  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 5;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 4;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 3;
    } else if (choiceNumber == 1 && _storyNumber == 5) {
      _storyNumber = 0;
    } else if (choiceNumber == 2 && _storyNumber == 5) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    } else if (choiceNumber == 1 && _storyNumber == 4) {
      _storyNumber = 0;
    } else if (choiceNumber == 2 && _storyNumber == 4) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    } else if (choiceNumber == 1 && _storyNumber == 3) {
      _storyNumber = 0;
    } else if (choiceNumber == 2 && _storyNumber == 3) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }
}
