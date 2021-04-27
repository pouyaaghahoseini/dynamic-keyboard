import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'utilities.dart' as data;

DateTime startTime = DateTime.now();
String cardWord = "test";

class NormalKeyboard extends StatefulWidget {
  @override
  _NormalKeyboardState createState() => _NormalKeyboardState();
}

class _NormalKeyboardState extends State<NormalKeyboard> {
  TextEditingController _controller = TextEditingController();
  bool _readOnly = true;
  List wordTimes;
  List words;
  List errors;
  int madeError;
  @override
  void initState() {
    wordTimes = [];
    words = [];
    errors = [];
    madeError = 0;
    print("initstate function ran------------");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(startTime);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 50),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            style: TextStyle(fontSize: 24),
            autofocus: true,
            showCursor: true,
            readOnly: _readOnly,
          ),
          IconButton(
            icon: Icon(Icons.keyboard),
            onPressed: () {
              setState(() {
                _readOnly = !_readOnly;
              });
            },
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(50.0),
              color: Color(0xffbbb2e9),
              width: 350,
              height: 30,
              child: Center(
                  child: Text(
                cardWord,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          SnackBarPage(
            wordTimes: wordTimes,
            words: words,
            errors: errors,
          ),
          Spacer(),
          CustomKeyboard(onTextInput: (myText) {
            _insertText(myText);
            // setState(() {
            //   data.updateFlex(myText, data.flexTable, data.rowFlex);
            // });
          }, onBackspace: () {
            _backspace();
          }, onEnter: () {
            _enter();
          }),
        ],
      ),
    );
  }

  void _enter() {
    if (_controller.text == cardWord) {
      print("you typed the right word");
      int timedif = DateTime.now().difference(startTime).inMilliseconds;
      print("the time difference was $timedif");
      wordTimes.add(timedif);
      words.add(cardWord);
      errors.add(madeError);
      madeError = 0;
      print(wordTimes);
      var temp = data.getRandomElement(data.words);
      print(temp);
      setState(() {
        cardWord = temp;
        _controller.clear();
      });
      var l = data.words.length;
      print("Words length: $l");
      startTime = DateTime.now();
    } else {
      print("there is a mistake!");
    }
  }

  void _insertText(String myText) {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace() {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final selectionLength = textSelection.end - textSelection.start;
    madeError = 1;
    // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      _controller.text = newText;
      _controller.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    }

    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class SnackBarPage extends StatelessWidget {
  SnackBarPage({
    Key key,
    this.wordTimes,
    this.words,
    this.errors,
  }) : super(key: key);

  final List wordTimes;
  final List words;
  final List errors;
  String filepath = ("/storage/emulated/0/Download/");
  String fileName;

  Future<File> get _localFile async {
    return File("$filepath" + "$fileName" + ".txt");
  }

  Future<File> writeMessage(String message) async {
    final file = await _localFile;
    return file.writeAsString(message, mode: FileMode.write);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Press OK to save the data.'),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {
                fileName = ModalRoute.of(context).settings.arguments;
                print("Hello $wordTimes");
                String message = "";
                for (int i = 0; i < wordTimes.length; i++) {
                  message += words[i] +
                      "," +
                      wordTimes[i].toString() +
                      "," +
                      errors[i].toString() +
                      "\n";
                }
                // writeMessage(message);
                print(message);
                Navigator.pop(context);
                // Some code to undo the change.
              },
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Finish Experiment'),
      ),
    );
  }
}

class CustomKeyboard extends StatelessWidget {
  CustomKeyboard({
    Key key,
    this.onTextInput,
    this.onBackspace,
    this.onEnter,
  }) : super(key: key);

  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;
  final VoidCallback onEnter;

  void _textInputHandler(String text) => onTextInput?.call(text);
  void _enterHandler() => onEnter?.call();
  // void _backspaceHandler() => onBackspace?.call();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      color: const Color(0xffe9eaee),
      child: Column(
        children: [
          buildRowOne(),
          Container(
            height: 5,
          ),
          buildRowTwo(),
          Container(
            height: 5,
          ),
          buildRowThree(),
          Container(
            height: 5,
          ),
          buildRowFour(),
        ],
      ),
    );
  }

  Expanded buildRowOne() {
    return Expanded(
      flex: data.rowFlex[0],
      child: Row(
        children: [
          Container(
            width: 3,
          ),
          TextKey(
            text: 'q',
            flex: data.flexTable['q'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'w',
            flex: data.flexTable['w'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'e',
            flex: data.flexTable['e'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'r',
            flex: data.flexTable['r'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 't',
            flex: data.flexTable['t'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'y',
            flex: data.flexTable['y'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'u',
            flex: data.flexTable['u'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'i',
            flex: data.flexTable['i'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'o',
            flex: data.flexTable['o'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'p',
            flex: data.flexTable['p'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
        ],
      ),
    );
  }

  Expanded buildRowTwo() {
    return Expanded(
      flex: data.rowFlex[1],
      child: Row(
        children: [
          Expanded(
            flex: 50,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Material(
                color: Color(0xffe9eaee),
                child: InkWell(
                  onTap: () {},
                  child: Container(),
                ),
              ),
            ),
          ),
          TextKey(
            text: 'a',
            flex: data.flexTable['a'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 's',
            flex: data.flexTable['s'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'd',
            flex: data.flexTable['d'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'f',
            flex: data.flexTable['f'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'g',
            flex: data.flexTable['g'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'h',
            flex: data.flexTable['h'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'j',
            flex: data.flexTable['j'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'k',
            flex: data.flexTable['k'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'l',
            flex: data.flexTable['l'],
            onTextInput: _textInputHandler,
          ),
          Expanded(
            flex: 50,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Material(
                color: Color(0xffe9eaee),
                child: InkWell(
                  onTap: () {},
                  child: Container(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      flex: data.rowFlex[2],
      child: Row(
        children: [
          Expanded(
            flex: 100,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Material(
                color: Color(0xffe9eaee),
                child: InkWell(
                  onTap: () {},
                  child: Container(),
                ),
              ),
            ),
          ),
          TextKey(
            text: 'z',
            flex: data.flexTable['z'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'x',
            flex: data.flexTable['x'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'c',
            flex: data.flexTable['c'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'v',
            flex: data.flexTable['v'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'b',
            flex: data.flexTable['b'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'n',
            flex: data.flexTable['n'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          TextKey(
            text: 'm',
            flex: data.flexTable['m'],
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          Expanded(
            flex: 120,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Material(
                color: Color(0xffe9eaee),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xffbabbbf)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Color(0xffbabbbf))))),
                  onPressed: () {
                    onBackspace?.call();
                  },
                  child: Center(
                    child: Icon(
                      Icons.backspace,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildRowFour() {
    return Expanded(
      flex: data.rowFlex[3],
      child: Row(
        children: [
          TextKey(
            text: ' ',
            flex: 4,
            onTextInput: _textInputHandler,
          ),
          Container(
            width: 3,
          ),
          EnterKey(
            onEnter: _enterHandler,
          ),
        ],
      ),
    );
  }
}

class TextKey extends StatelessWidget {
  const TextKey({
    Key key,
    @required this.text,
    this.onTextInput,
    this.flex = 1,
  }) : super(key: key);

  final String text;
  final ValueSetter<String> onTextInput;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Color(0xffe9eaee),
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.white)))),
            onPressed: () {
              onTextInput?.call(text);
            },
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 23,
              ),
            )),
          ),
        ),
      ),
    );
  }
}

class EnterKey extends StatelessWidget {
  const EnterKey({
    Key key,
    this.onEnter,
    this.flex = 1,
  }) : super(key: key);

  final VoidCallback onEnter;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Material(
          color: Color(0xffe9eaee),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.white)))),
            onPressed: () {
              onEnter?.call();
            },
            child: Center(
              child: Icon(
                Icons.subdirectory_arrow_left,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
