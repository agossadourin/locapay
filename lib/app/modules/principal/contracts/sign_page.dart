import 'package:flutter/material.dart';

class SignatureMaker extends StatefulWidget {
  @override
  _SignatureMakerState createState() => _SignatureMakerState();
}

class _SignatureMakerState extends State<SignatureMaker> {
  List<Offset> _points = <Offset>[];
  late Paint _paint;

  void _onPanStart(DragStartDetails details) {
    RenderBox box = context.findRenderObject() as RenderBox;
    _points = List.from(_points)
      ..add(box.globalToLocal(details.globalPosition));
  }

  void _onPanUpdate(DragUpdateDetails details) {
    RenderBox box = context.findRenderObject() as RenderBox;
    _points = List.from(_points)
      ..add(box.globalToLocal(details.globalPosition));
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: CustomPaint(
          painter: SignaturePainter(_points),
          size: Size.infinite,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _points.clear();
              });
            },
            child: Icon(Icons.clear),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              // Save signature
            },
            child: Icon(Icons.done),
          ),
        ],
      ),
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;
  final _paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], _paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) =>
      oldDelegate.points != points;
}
