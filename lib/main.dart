import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';
QuizBrain brain =  QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [
  ];
  Icon tru = Icon(
    Icons.check,
    color: Colors.green,
  );
  Icon fal = Icon(
    Icons.close,
    color: Colors.red,
  );

  int quesNumber = 0;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                brain.questionBank[quesNumber].questionHeadline,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(

                primary: Colors.white,
                // shadowColor: Colors.red,
                backgroundColor: Colors.green,
                // onSurface: Colors.red,
              ),
              onPressed: () {
                setState(() {

                  if(quesNumber<brain.questionBank.length-1) {
                      quesNumber = quesNumber + 1;
                      if (brain.questionBank[quesNumber].questionAnswer == true)
                        scoreKeeper.add(tru);
                      else
                        scoreKeeper.add(fal);
                    }
                  else{
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "You have reached the end of the quiz",
                      // desc: "Flutter is more awesome with RFlutter Alert.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "COOL",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => {
                            Navigator.pop(context),
                            setState(() {
                              quesNumber = 0;
                              scoreKeeper.clear();
                            })
                          },
                          width: 120,
                        )
                      ],
                    ).show();

                  }
                  });
              },
              child: Text('True',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            )
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(

                primary: Colors.white,
                // shadowColor: Colors.red,
                backgroundColor: Colors.red,
                // onSurface: Colors.red,
              ),
              onPressed: () {
                setState(() {

                  if(quesNumber<brain.questionBank.length-1) {
                      quesNumber = quesNumber + 1;
                      if (brain.questionBank[quesNumber].questionAnswer ==
                          false)
                        scoreKeeper.add(tru);
                      else
                        scoreKeeper.add(fal);
                    }
                  else{
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "You have reached the end of the quiz",
                      // desc: "Flutter is more awesome with RFlutter Alert.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "COOL",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => {
                            Navigator.pop(context),
                            setState(() {
                              quesNumber = 0;
                              scoreKeeper.clear();
                            })
                          },
                          width: 120,
                        )
                      ],
                    ).show();
                  }
                    print('called');
                });
              },
              child:  Text('False',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            )
          ),
        ),

        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
