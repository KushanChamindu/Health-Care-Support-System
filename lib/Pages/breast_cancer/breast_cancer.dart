import 'package:flutter/material.dart';
import 'package:healthcaresupportsystem/Pages/Auth/Service/Auth.dart';
import '../Popupmenu.dart';


class BrestCancer extends StatefulWidget {
  final BaseAuth auth=Auth();
  @override
  _BrestCancerState createState() => _BrestCancerState();
}

class _BrestCancerState extends State<BrestCancer> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*2*/
                  Container(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Text(
                      'What is breast cancer...?',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28.0,
                        fontFamily: 'KaushanScript',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'Symptoms' ,'/bc_symptoms'),
          _buildButtonColumn(color, Icons.security, 'Precausion', '/bc_solutions'),
          _buildButtonColumn(color, Icons.share, 'More...', '/bc_more'),
        ],
      ),
    );
    Widget textSection = Container(
      padding: const EdgeInsets.fromLTRB(32, 0, 24, 24),
      child: Text(
        'Breast cancer is a disease in which cells in the breast grow out of control. '
            'There are different kinds of breast cancer. '
            'The kind of breast cancer depends on which cells in the breast turn into cancer ',
            style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'KaushanScript',
            ),
        softWrap: true,  
      ),
    );
    Widget textQuate = Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
          children: [
            Expanded(
              /*1*/
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*2*/
                  Container(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Text(
                      '"Breast cancer doesn’t run in my family; it sprints.'
                      'Now it was my turn, and I was determined to defeat this.'
                       'I couldn’t change that I had cancer, but I could decide how to go after it."',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                        fontFamily: 'KaushanScript',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                    child: Text(
                        'Jessica Baladad'
                          '(Breast Cancer Survivor and NBCF Supporter)',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 16.0,
                          fontFamily: 'KaushanScript',
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          Popupmenu(auth: widget.auth,)
        ],
        title: Text(
          "Breast Cancer",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w300,
            color: Colors.black,
            fontFamily: 'KaushanScript'
          ),
        ),
        //centerTitle: true,
      ),
      body:ListView(
        children: <Widget>[
          Image.asset(
            'assets/breast_cancer_image/bc.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          textSection,
          textQuate,
          buttonSection,
          
        ],
      )
    );
  }
  Column _buildButtonColumn(Color color, IconData icon, String label, String url) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          height: 80,
          width: 110,
          child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, url);
            },
            child: Center(
              child: Column(
                children: <Widget>[
                //Icon(icon, color: color),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 24, 2, 4),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'KaushanScript',
                    ),
                    ),
                ),
              ],
              ),
            ),
            color: Colors.lightBlueAccent,
            ),
        ),
      ],
    );
  }
}