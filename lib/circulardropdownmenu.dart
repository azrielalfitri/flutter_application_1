import 'package:flutter/material.dart';

//CDDM class
class CircularDropDownMenu extends StatefulWidget {
  //CDDM fields
  final String hintText;
  final List<DropdownMenuItem> dropDownMenuItem;
  final dynamic onChanged;

  //CDDM constructor
  const CircularDropDownMenu({
    required this.onChanged,
    required this.dropDownMenuItem,
    required this.hintText,
  });

  //CDDM function createState()
  @override
  _CircularDropDownMenuState createState() => _CircularDropDownMenuState();
}

//CDDMS class describes the state of a CDDM object
class _CircularDropDownMenuState extends State<CircularDropDownMenu> {
  //required build() function
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.only(left: 20, top: 0, bottom: 0, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(30),
          right: Radius.circular(30),
        ),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: widget.dropDownMenuItem,
          onChanged: widget.onChanged,
          hint: Text(
            widget.hintText,
            style: TextStyle(
              fontFamily: 'Muli',
            ),
          ),
        ),
      ),
    );
  }
}
