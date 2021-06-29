import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Utils/Colors.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

   bool _value1 = false;
   bool _value2 = false;
   bool _value3 = false;


  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbar,
        title: Text('List of Peoples'),

        centerTitle: true,
      ),
      floatingActionButton: ElevatedButton(onPressed: (){
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return StatefulBuilder( builder: (context, setState){
                return Container(
                  color: card,
                  padding: EdgeInsets.all(deviceWidth* .05),
                  height: deviceHeight* .275,
                  child: Theme(
                    data: ThemeData(unselectedWidgetColor: white),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Short By", style: TextStyle(color: white,fontSize: 18,fontWeight: FontWeight.bold),),
                        CheckboxListTile(activeColor: appbar,value: _value1,title: Text('Name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: white),), onChanged: (newValue){
                          setState(() {
                            _value1 = newValue!;
                          });
                        }),
                        CheckboxListTile(activeColor: appbar,value: _value2,title: Text('Age',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: white),), onChanged: (newValue){
                          setState(() {
                            _value2 = newValue!;
                          });
                        }),
                        CheckboxListTile(activeColor: appbar,value: _value3,title: Text('Interest',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: white),), onChanged: (newValue){
                          setState(() {
                            _value3 = newValue!;
                          });
                        }),

                      ],
                    ),
                  ),
                );
              }

              );
            });
      },child: Text("Filter Search",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => appbar),padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(vertical: deviceWidth* .035,horizontal: deviceWidth* .025)),shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))))),
      body: Container(
        width: deviceWidth,
        height: deviceHeight,

        child: ListView(  padding: EdgeInsets.all(deviceWidth* .025),
          physics: BouncingScrollPhysics(),
          children: [
Card(margin: EdgeInsets.zero,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  color: card,
  child: Container(
    margin: EdgeInsets.all(deviceWidth* .025),
     color: card,
    width: deviceWidth,
    height: deviceWidth* .25,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(

          radius: 45,
          backgroundColor: appbar,
          // backgroundImage: NetworkImage(""),
        ),
        VerticalDivider(thickness: 1.5,color: white,),
        Container(width: deviceWidth* .5,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
Text('Angel Henry',style: TextStyle(color: white,fontSize: 18,fontWeight: FontWeight.bold,),maxLines: 1,overflow: TextOverflow.ellipsis,),
              Text('Age: 24',style: TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.bold)),
              Text('Interest: Male',style: TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.bold)),
            ],
          ),
        )
      ],
    ),
  ),
)
          ],
        ),
      ),
    );
  }
}
