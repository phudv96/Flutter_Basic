import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  // _MyHomePageState createState() => new _MyHomePageState();
  // _ExamContainer createState() => new _ExamContainer();
  // _ExamGridView createState() => new _ExamGridView();
  // _ExamListView createState() => new _ExamListView();
  _ExamStack createState() => new _ExamStack();
}

//BEGIN STACK
class _ExamStack extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/cat3.jpg'),
          radius: 100.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            'Mia B',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )
          ),
        )
      ],
    );
    return Scaffold(
      body: Center(
        child: stack,
      )
    );
  }

}
//END STACK


//BEGIN LISTVIEW
var sampleitem = ListTile(
    title: Text('CineArts at the Empire', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
    subtitle: Text('85 W Portal Ave'),
    leading: Icon(
      Icons.theaters,
      color: Colors.blue[500]
    )
);
List<Container> _buildListTitleList(int count) {
  return List<Container>.generate(count, (index) => Container(child: sampleitem));
}
class _ExamListView extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ...
      body: Center(
        child: ListView(
          children: _buildListTitleList(30),
        ),
      ),
    );
  }
}
//END LISTVIEW


// BEGIN GRIDVIEW
List<Container> _buildGridTitleList(int count) {
  return List<Container>.generate(count, (index) => Container(child: Image.asset('assets/cat2.jpg')));
}
Widget buildGrid() {
  return GridView.extent(
    maxCrossAxisExtent: 200.0,
    padding: const EdgeInsets.all(4.0),
    mainAxisSpacing:  0.0, //spacing Horizontal
    crossAxisSpacing: 10.0,  //spceing Vertical
    children: _buildGridTitleList(10)
  );
}
class _ExamGridView extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Center(
        child: buildGrid()
      ),
    );
  }
}
// ENDGRIDVIEW

class _ExamContainer extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var container = Container(
      decoration: BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 250.0,
                  alignment: Alignment.center,
                  
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('assets/cat1.jpg', fit: BoxFit.fill),
                )
              ),
               Expanded(
                child: Container(
                  height: 250.0,
                  alignment: Alignment.center,
                  
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(10.0),
                  child: Image.asset('assets/cat1.jpg', fit: BoxFit.fill),
                )
              )
              
            ],
          )
        ],
      )
    );

    return Scaffold (
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: Center(
        child: container
      ),
    );
  }

  

}
class _MyHomePageState extends State<MyHomePage> { 
  @override
  Widget build(BuildContext context) {
    var ratings = Container(
      padding:  EdgeInsets.all(20.0),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: Colors.green[500]),
            Icon(Icons.star, color: Colors.green[500]),
            Icon(Icons.star, color: Colors.green[500]),
            Icon(Icons.star, color: Colors.black),
            Icon(Icons.star, color: Colors.black),
          ],
        ),
        Text('170 Reviews',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontSize: 20.0),
        )
        ]
      ),
    );

    var descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );
    // DefaultTextStyle.merge allows you to create a default text
    // style that is inherited by its child and all subsequent children.
    var iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                Text('PREP:'),
                Text('25 min')
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                Text('COOK:'),
                Text('1 hr')
              ],
            ),
            Column (
              children: [
              Icon(Icons.restaurant, color: Colors.green[500]),
              Text('FEEDS:'),
              Text('4-6')
              ]
            )
          ],
        )
      )
    );



    var leftColumn = Container(
      padding: EdgeInsets.fromLTRB(10, 0, 20.0, 0),
      child: Column(
        children: [
          Text('Strawberry Pavlova', style: TextStyle(fontSize: 32.0)),
          ratings,
          iconList,
        ],
      )
    );

    return Scaffold (
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
          height: 1000.0,
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 350.0,
                    child: leftColumn,
                  ),
                ),
                
                Expanded(child: Image.asset('assets/cat1.jpg') )
              ],
            ),
          )
        ),
      ),
    );
  }
}


