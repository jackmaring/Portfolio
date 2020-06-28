import 'package:flutter/material.dart';

import 'category_list_item.dart';

class CategoryDropdowns extends StatefulWidget {
  final List<String> _categories = [
    'ALL JOBS',
    'DESIGN',
    'DEVELOPMENT',
    'LANDSCAPING',
    'INDUSTRIAL',
    'OTHER',
    'CUSTOM',
  ];

  final _designSubcategories = const [
    'ALL DESIGN',
    'DESIGN 1',
    'DESIGN 2',
    'DESIGN 3',
  ];

  final _developmentSubcategories = const [
    'ALL DEVELOPMENT',
    'DEVELOPMENT 1',
    'DEVELOPMENT 2',
    'DEVELOPMENT 3',
  ];

  final _landscapingSubcategories = const [
    'ALL LANDSCAPING',
    'LANDSCAPING 1',
    'LANDSCAPING 2',
    'LANDSCAPING 3',
  ];

  final _industrialSubcategories = const [
    'ALL INDUSTRIAL',
    'INDUSTRIAL 1',
    'INDUSTRIAL 2',
    'INDUSTRIAL 3',
  ];

  final _otherSubcategories = const [
    'ALL OTHER',
    'OTHER 1',
    'OTHER 2',
    'OTHER 3',
  ];

  @override
  _CategoryDropdownsState createState() => _CategoryDropdownsState();
}

class _CategoryDropdownsState extends State<CategoryDropdowns> {
  String _categoryLabel = 'ALL JOBS';

  void _changeText(String text) {
    setState(() {
      _categoryLabel = text;
      _subcategoryLabel = _getSubcategoryList()[0];
    });
  }

  String _subcategoryLabel = 'ALL JOBS';

  void _changeSubCategoryText(String text) {
    setState(() {
      _subcategoryLabel = text;
    });
  }

  List<String> _subcategories = [];

  List<String> _getSubcategoryList() {
    for (int i = 0; i < widget._categories.length; i++) {
      if (_categoryLabel == 'DESIGN') {
        setState(() {
          _subcategories = widget._designSubcategories;
        });
        return _subcategories;
      } else if (_categoryLabel == 'DEVELOPMENT') {
        setState(() {
          _subcategories = widget._developmentSubcategories;
        });
        return _subcategories;
      } else if (_categoryLabel == 'LANDSCAPING') {
        setState(() {
          _subcategories = widget._landscapingSubcategories;
        });
        return _subcategories;
      } else if (_categoryLabel == 'INDUSTRIAL') {
        setState(() {
          _subcategories = widget._industrialSubcategories;
        });
        return _subcategories;
      } else if (_categoryLabel == 'OTHER') {
        setState(() {
          _subcategories = widget._otherSubcategories;
        });
        return _subcategories;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.60,
          child: PopupMenuButton(
            padding: EdgeInsets.zero,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.bottomLeft,
              child: Row(
                children: <Widget>[
                  Text(
                    _categoryLabel,
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
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.60,
          child: PopupMenuButton(
            padding: EdgeInsets.zero,
            child: Row(
              children: <Widget>[
                Text(
                  _subcategoryLabel,
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
              for (int i = 0; i < _getSubcategoryList().length; i++)
                PopupMenuItem(
                  child: CategoryListItem(
                    _getSubcategoryList()[i],
                    () => _changeSubCategoryText(_getSubcategoryList()[i]),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
