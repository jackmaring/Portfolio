import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/midpoint_changer.dart';

class ToDoContainer extends StatefulWidget {
  final BoxConstraints constraints;
  final Midpoint midpoint;

  ToDoContainer(this.constraints, this.midpoint);

  @override
  _ToDoContainerState createState() => _ToDoContainerState();
}

class _ToDoContainerState extends State<ToDoContainer> {
  final _textController = TextEditingController();
  var _savedText = '';
  var isEditing = true;

  Widget _buildTopRowContainer() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 4),
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'To Do',
            style: Theme.of(context).textTheme.title,
          ),
          Container(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.clear,
                  ),
                  iconSize: 24,
                  onPressed: () {
                    setState(() {
                      _savedText = '';
                      _textController.text = '';
                      if (!isEditing) {
                        isEditing = true;
                      }
                    });
                  },
                ),
                isEditing
                    ? IconButton(
                        icon: Icon(
                          Icons.save,
                        ),
                        iconSize: 24,
                        onPressed: () {
                          setState(() {
                            isEditing = false;
                            _savedText = _textController.text;
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.edit,
                        ),
                        iconSize: 24,
                        onPressed: () {
                          setState(() {
                            isEditing = true;
                            _textController.text = _savedText;
                          });
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextEditingContainer(
      BoxConstraints constraints, Midpoint midpoint) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      height: constraints.maxHeight * 0.5 - 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Write your to do\'s!',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 99999,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedTextContainer(
      BoxConstraints constraints, Midpoint midpoint) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      height: constraints.maxHeight * 0.5 - 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _savedText,
              style: Theme.of(context).textTheme.body1,
            ),
          ],
        ),
      ),
    );
  }

  // double setHeight(BoxConstraints constraints, Midpoint midpoint) {
  //   double height;
  //   setState(() {
  //     switch (midpoint) {
  //       case Midpoint.Low:
  //         height = constraints.maxHeight * 1 - 150;
  //         break;
  //       case Midpoint.MidLow:
  //         height = constraints.maxHeight * 0.75 - 100;
  //         break;
  //       case Midpoint.Mid:
  //         height = constraints.maxHeight * 0.5 - 75;
  //         break;
  //       case Midpoint.MidHigh:
  //         height = constraints.maxHeight * 0.25 - 50;
  //         break;
  //       case Midpoint.High:
  //         height = constraints.maxHeight * 0;
  //         break;
  //     }
  //     print('to do height is $height');
  //   });
  //   print('to do returned height is $height');
  //   return height;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTopRowContainer(),
        isEditing
            ? _buildTextEditingContainer(widget.constraints, widget.midpoint)
            : _buildSavedTextContainer(widget.constraints, widget.midpoint),
      ],
    );
  }
}
