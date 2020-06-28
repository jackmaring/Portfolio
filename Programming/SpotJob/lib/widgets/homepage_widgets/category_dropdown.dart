import 'package:flutter/material.dart';
import 'package:spotjob/widgets/homepage_widgets/category_list_item.dart';

class CategoryDropdown extends StatefulWidget {
  final List<String> _categories;

  CategoryDropdown(this._categories);

  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  String categoryLabel = 'ALL JOBS';

  void _changeText(String text) {
    setState(() {
      categoryLabel = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.bottomLeft,
        child: Row(
          children: <Widget>[
            Text(
              categoryLabel,
              style: TextStyle(
                color: Colors.black,
                fontSize: 48,
                fontFamily: 'Helvetica',
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              size: 30,
            ),
          ],
        ),
      ),
      itemBuilder: (context) => [
        for (int i = 0; i < widget._categories.length; i++)
          PopupMenuItem(
            child: CategoryListItem(
              widget._categories[i],
              () => _changeText(widget._categories[i]),
            ),
          ),
      ],
    );
  }
}
