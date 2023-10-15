import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'small_card.dart';
import 'big_card.dart';
import 'gender.dart';
import 'package:animated_weight_picker/animated_weight_picker.dart';

const bottomCheight = 70.0;
const color1 = Color(0xFFCCB4EE);
const color2 = Color(0xFFC39BEA);

enum Genderr { male, female, nothing }

final double min = 0;
final double max = 100;
String selectedValue = '';
@override
void initState() {
  selectedValue = min.toString();
  initState();
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genderr selectedGender = Genderr.nothing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: SmallCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Genderr.male;
                          });
                        },
                        colour:
                            selectedGender == Genderr.male ? color2 : color1,
                        schild: Gender(iconn: FontAwesomeIcons.mars, t: 'Male'),
                      ),
                    ),
                    Expanded(
                      child: SmallCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Genderr.female;
                          });
                        },
                        colour:
                            selectedGender == Genderr.female ? color2 : color1,
                        schild:
                            Gender(iconn: FontAwesomeIcons.venus, t: 'Female'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: BigCard(
                      bchild: Expanded(
                          child: Column(
                        children: [
                          Center(child: Text('Age')),
                        ],
                      )),
                      colour: color1)),
              Expanded(
                  flex: 2,
                  child: BigCard(
                      bchild: Expanded(
                          child: Column(
                        children: [
                          Center(
                              child: Text(
                            'Set your height',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          )),
                        ],
                      )),
                      colour: color1)),
              Expanded(
                  flex: 3,
                  child: BigCard(
                      bchild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                              child: Text(
                            'Set weight',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          )),
                          SizedBox.square(
                            child: AnimatedWeightPicker(
                              min: min,
                              max: max,
                              squeeze: 5.0,
                              majorIntervalTextColor: Color(0xFFBF7EF1),
                              dialColor: Color(0xFF994CD3),
                              majorIntervalColor: color2,
                              subIntervalColor: color2,
                              minorIntervalColor: color2,
                              selectedValueColor: Colors.black,
                              suffixTextColor: Colors.black,
                              onChange: (newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      colour: color1)),
              Container(
                child: TextButton(
                  child: Center(
                      child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  )),
                  onPressed: () {
                    print('ptesf');
                  },
                ),
                margin: EdgeInsets.all(5.0),
                // color: Color(0xFF994CD3),
                height: bottomCheight,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFF994CD3),
                ),
              ),
            ]));
  }
}
