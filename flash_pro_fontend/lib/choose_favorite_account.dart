import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Preference',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ChooseFavoriteAccount(),
    );
  }
}

class ChooseFavoriteAccount extends StatefulWidget {
  @override
  _ChooseFavoriteAccountState createState() => _ChooseFavoriteAccountState();
}

class _ChooseFavoriteAccountState extends State<ChooseFavoriteAccount> {
  final List<String> foodOptions = [
    'Thai Cuisine',
    'Italian Cuisine',
    'Mexican Cuisine',
    'Japanese Cuisine',
    'Korean Cuisine',
    'Indian Cuisine',
    'American Cuisine',
    'French Cuisine',
    'Chinese Cuisine',
  ];

  final Map<String, bool> selectedFoods = {};

  @override
  void initState() {
    super.initState();
    for (var food in foodOptions) {
      selectedFoods[food] = false;
    }
  }

  void _submitSelection() {
  // Return to the previous page
  Navigator.pop(context);
}

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 16, color: Colors.black);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Color(0xFFFBC079),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFBC079),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
                child: Text(
                  'What kind of food do you like?',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        alignment: WrapAlignment.start,
                        children: foodOptions.map((food) {
                          final width = (_calculateTextWidth(food, textStyle) + 40);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedFoods[food] = !selectedFoods[food]!;
                              });
                            },
                            child: Container(
                              width: width,
                              height: 40,
                              decoration: BoxDecoration(
                                color: selectedFoods[food]! ? Color(0xFFFBC079) : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Color(0xFFFBC079),
                                  width: 2,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                food,
                                style: textStyle,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    GestureDetector(
                      onTap: _submitSelection,
                      child: Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: Color(0xFFFBC079),
                            width: 2,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Save',
                          style: TextStyle(fontSize: 24, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 200),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateTextWidth(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.size.width;
  }
}
