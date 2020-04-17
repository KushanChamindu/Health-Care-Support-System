import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BC_Cards extends StatefulWidget {
  BC_Cards();
  @override
  _BC_CardsState createState() => _BC_CardsState();
}

class _BC_CardsState extends State<BC_Cards> {
  @override
  bool viewVisible = false ;
  bool getVisible(){
    if(viewVisible==false){
      setState(() {
        viewVisible = true ;
      });
    }else{
      setState(() {
        viewVisible = false ;
      });
    }
  }

  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: InkWell(
        onTap: (){getVisible();},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Image.asset(
                  'assets/breast_cancer_image/bc.jpg',
                  width: 300,
                  height: 200,
                  fit:BoxFit.fitWidth

              ),
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Breast Cancer',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Visibility(
                visible: viewVisible,
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, '/breastcancer');
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15,0, 0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.local_hospital,
                                    size: 40,),
                                  Text(
                                    'Discription',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ),
                    ),
                    Expanded(
                      child:Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, '/CKD_message');
                          },
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(50, 0, 7, 3),
                                child: Image.asset(
                                  'assets/CKD_image/docIcon.png',
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                              Text(
                                'Doctor',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}