import 'package:flutter/material.dart';

class MyExpansionPanel extends StatefulWidget {
  MyExpansionPanelState createState() => MyExpansionPanelState();
}

class MyExpansionPanelState extends State {
  bool _isExpanded = false;
  Widget build(BuildContext context) {
    return ExpansionPanelList(
        expansionCallback: (int panelIndex, bool isExpanded) {
          setState(() {
            print(isExpanded);
            _isExpanded = !isExpanded;
            print(isExpanded);
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Text('Panel A'),
              );
            },
            body: Container(
              padding: EdgeInsets.all(16.0),
              width: double.infinity,
              child: Text('content'),
            ),
            isExpanded: _isExpanded,
          ),
        ]);
  }
}
