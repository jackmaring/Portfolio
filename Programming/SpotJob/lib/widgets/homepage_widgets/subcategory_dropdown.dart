import 'package:flutter/material.dart';
import 'package:spotjob/widgets/homepage_widgets/category_list_item.dart';

class SubcategoryDropdown extends StatefulWidget {
  final List<String> _subcategories;

  SubcategoryDropdown(this._subcategories);

  @override
  _SubcategoryDropdownState createState() => _SubcategoryDropdownState();
}

class _SubcategoryDropdownState extends State<SubcategoryDropdown> {
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
      child: Row(
        children: <Widget>[
          Text(
            categoryLabel,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 18,
              fontFamily: "Helvetica",
            ),
            textAlign: TextAlign.left,
          ),
          Icon(
            Icons.arrow_drop_down,
            size: 20,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
      itemBuilder: (context) => [
        for (int i = 0; i < widget._subcategories.length; i++)
          PopupMenuItem(
            child: CategoryListItem(
              widget._subcategories[i],
              () => _changeText(widget._subcategories[i]),
            ),
          ),
      ],
    );
  }
}
