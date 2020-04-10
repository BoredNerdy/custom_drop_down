
import 'package:flutter/material.dart';

class CustomDropDown  extends StatefulWidget {

  final ValueSetter<String> callback;
  final List<CustomDropDownItems> items;
  final double height;
  final double width;
  final String value;
  final String hintText;

  CustomDropDown({this.items,this.height,this.width,this.value,this.hintText="select an item",this.callback});


  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {


  void show(){
    showDialog(
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: widget.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                 SizedBox(
                        height: widget.height,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: widget.items.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return GestureDetector(
                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(widget.items[index].label,style:Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.w400)),
                              ),

                              onTap: (){
                                widget.callback(widget.items[index].value);
                                Navigator.pop(context);
                              },
                            );
                          },
                        )
                    ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:8.0),
                            child: Icon(Icons.cancel , color: Colors.black, size: Theme.of(context).textTheme.body1.fontSize,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Cancel',
                              style: Theme.of(context).textTheme.body1.copyWith(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
        Expanded(child: Padding(
              padding: const EdgeInsets.only(right:8.0),
              child:  Text( widget.value ?? widget.hintText,style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.w400),),
            ),flex: 1,),
            Icon(
              Icons.keyboard_arrow_down,
              size: Theme.of(context).textTheme.body1.fontSize,
            ),
          ],
        ) ,
        onTap: show,
      ) ,
    );
  }
}

class CustomDropDownItems {
  final String label;
  final String value;
  
  CustomDropDownItems(this.label,this.value);
  
}