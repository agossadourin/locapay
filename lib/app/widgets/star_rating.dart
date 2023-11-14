import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int maximumRating;
  final int defaultRating;

  StarRating({this.maximumRating = 5, this.defaultRating = 0});

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _rating = 0;

  @override
  void initState() {
    super.initState();
    _rating = widget.defaultRating;
  }

  void _setRating(int value) {
    setState(() {
      _rating = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        widget.maximumRating,
        (index) => IconButton(
          icon: Icon(
            Icons.star,
            color: _rating > index ? Colors.green : Colors.grey,
          ),
          onPressed: () => _setRating(index + 1),
        ),
      ),
    );
  }
}
