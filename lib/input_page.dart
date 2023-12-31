import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'small_card.dart';
import 'big_card.dart';
import 'gender.dart';
import 'package:animated_weight_picker/animated_weight_picker.dart';
import 'result.dart';
import 'bottom_button.dart';
import 'calculate_bmi.dart';

const bottomCheight = 70.0;
const color1 = Color(0xFFCCB4EE);
const color2 = Color(0xFFC39BEA);
int age = 15;

enum Genderr { male, female, nothing }

final double min = 0;
final double max = 100;
String weight = '';
@override
void initState() {
  weight = min.toString();
  initState();
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genderr selectedGender = Genderr.nothing;
  int height = 150;

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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Text('Age'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Text(age.toString()),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              )
                            ],
                          )
                        ],
                      )),
                      colour: color1)),
              Expanded(
                  flex: 2,
                  child: BigCard(
                      bchild: Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                              child: Text(
                            'Set height',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              Text('cm'),
                            ],
                          ),
                          Slider(
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                            min: 130.0,
                            max: 200.0,
                            activeColor: Color(0xFF994CD3),
                            inactiveColor: color2,
                            thumbColor: Color(0xFF994CD3),
                          )
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
                          AnimatedWeightPicker(
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
                                weight = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                      colour: color1)),
              BottomButton(
                onTap: () {
                  double w = double.parse(weight);
                  print(w);
                  Calculate calc = Calculate(height: height, weight: w.toInt());

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Result(calc.calculateBMI(),
                              calc.getDesc(), calc.getResult())));
                },
                string: 'Calculate',
              ),
            ]));
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  RoundButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        constraints: BoxConstraints.tightFor(
          width: 50.0,
          height: 50.0,
        ),
        onPressed: onPressed,
        fillColor: color2,
        child: Icon(icon),
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ));
  }
}
