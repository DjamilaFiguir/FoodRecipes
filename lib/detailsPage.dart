import 'package:flutter/material.dart';
class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodtime;
  final List<String> ing;
  final List<String> dir;

  DetailsPage({this.heroTag, this.foodName, this.foodtime, this.ing,this.dir});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = 'WEIGHT';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF21AFBD),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Details',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  color: Colors.white)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
              color: Colors.white,
            )
          ],
        ),
        body: ListView(children: [
          Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height + 670,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent),
            Positioned(
                top: 75.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height + 900.0,
                    width: MediaQuery.of(context).size.width)),
            Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Hero(
                    tag: widget.heroTag,
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.heroTag),
                                fit: BoxFit.cover)),
                        height: 200.0,
                        width: 200.0))),
            Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.foodName,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.foodtime,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                color: Colors.black54)),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text("INGREDIENTS",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            color: Color(0xFF21AFBD),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    getTextWidgets(widget.ing),
                    SizedBox(height: 20.0),
                    Text("DIRECTIONS",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            color: Color(0xFF21AFBD),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 15.0),
                    getDirectionWidgets(widget.dir),
                  ],
                ))
          ])
        ]));
  }

  Widget getTextWidgets(List<String>ing) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < ing.length; i++) {
      list.add(new Text(
        "- " + ing[i],
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Montserrat',
        ),
      ));
    }

    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: list);
  }

  Widget getDirectionWidgets(List<String> dir) {
    List<Widget> list = new List<Widget>();
    int j = 0;
    for (var i = 0; i < dir.length; i++) {
      j = i + 1;
      list.add(new Text(
        "$j| " + dir[i],
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Montserrat',
        ),
      ));
      list.add(
        SizedBox(height: 10.0),
      );
    }

    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: list);
  }
}
