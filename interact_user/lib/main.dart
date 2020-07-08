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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo')
        ),
        body: Center(
          child: ParentWidger()
        ),
      ),
    );
  }
}

// TapboxA manages its own state.
//------------------------- TapboxA ----------------------------------

class TapboxA  extends StatefulWidget {
  @override
  _TapboxAState  createState() => _TapboxAState ();
}

class _TapboxAState  extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          )
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      )
    );
  }

}

// ParentWidget manages the state for TapboxB.

//------------------------ ParentWidget --------------------------------

// class ParentWidger extends StatefulWidget {
//   @override
//   _ParentWidgetState createState() => new _ParentWidgetState();
// }

// class _ParentWidgetState extends State<ParentWidger> {

//   bool _active = false;

//   void _handleTapboxChanged(bool newValue) {
//     setState(() {
//       _active = newValue;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: TapBoxB(active: _active, onChanged: _handleTapboxChanged)
//     );
//   }

// }

// class TapBoxB extends StatefulWidget {
//   TapBoxB({Key key, this.active: false, @required this.onChanged})
//       : super(key: key);

//   final bool active;
//   final ValueChanged<bool> onChanged;

//   void _handleTap() {
//     onChanged(!active);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handleTap,
//       child: Container(
//         child: Center(
//           child: Text(
//             active ? 'Active' : 'Inactive',
//             style: TextStyle(fontSize: 32.0, color: Colors.white),
//           ),
//         ),
//         width: 200.0,
//         height: 200.0,
//         decoration: BoxDecoration(
//           color: active ? Colors.lightGreen[700] : Colors.grey[600],
//         ),
//       ),
//     );
//   }
// }

// ParentWidget manages the state for TapboxB. and TapboxB manages its own state.

//------------------------ ParentWidget --------------------------------

class ParentWidger extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidger> {

  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxB(active: _active, onChanged: _handleTapboxChanged)
    );
  }

}

class TapBoxB extends StatefulWidget {
  TapBoxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapBoxBState createState() => new _TapBoxBState();
  
}

class _TapBoxBState extends State<TapBoxB> {

  bool _hightlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _hightlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _hightlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(widget.active ? 'Active' : 'Inactive', style: TextStyle(fontSize: 32.0, color: Colors.white),
          )
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.green : Colors.grey,
          border: _hightlight ? Border.all(
            color: Colors.teal,
            width: 10.0
          ) : null
        ),
      ),
    );
  }

}

