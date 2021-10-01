import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
      actions: [
        IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.green,)),
        Spacer(),
        Center(child: Text("Daily Usage",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),)),
        Spacer(),
        IconButton(onPressed: ()=>_scaffoldKey.currentState.openDrawer(), icon: Icon(Icons.menu,color: Colors.green,))
      ],
        automaticallyImplyLeading: false,
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          calender(),
          SizedBox(height: 20,),
          Row(children: [
            Image.asset("assets/images/solar_panal.png",height: 200,),
            Container(
              width: size.width*.4,
              child: Column(children: [
                Text("Today you used around",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                Text("2031 kWh",style: TextStyle(fontSize: 30,color: Colors.green,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    elevation: 10 ,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text("Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
                    ),
                  ),
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },
                ),
              ],),
            )
          ],),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            padding: EdgeInsets.all(20),
            height: 220,width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                   Colors.green,
                  Colors.lightGreen,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [
                cardItem(iconPath: "assets/images/battery.png",title: "3680",subtitle: "Current Output"),
                Divider(height: 3,thickness: 0.1,color: Colors.white,),

                cardItem(iconPath: "assets/images/flash.png",title: "7000",subtitle: "Current Output"),
                Divider(height: 3,thickness: 0.1,color: Colors.white,),

                cardItem(iconPath: "assets/images/leaf.png",title: "460",subtitle: "co2 Reduction"),
              ],
            ),
          )
        ],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(.5),blurRadius: 10,spreadRadius: 1,offset: Offset(0,-5))
          ]
        ),
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        child: Row(
          children: [
            Spacer(),
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.green,)),
            Spacer(),
            IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_sharp,color: Colors.green,)),
            Spacer(),
            IconButton(onPressed: (){}, icon: Icon(Icons.home,color: Colors.green,)),
            Spacer(),
            IconButton(onPressed: (){}, icon: Icon(Icons.timer_sharp,color: Colors.green,)),
            Spacer(),
            IconButton(onPressed: (){}, icon: Icon(Icons.settings,color: Colors.green,)),
            Spacer(),
          ],
        ),
      ),
    );
  }


  Widget cardItem({String iconPath,String title, String subtitle}){
    return  Padding(
      padding: const EdgeInsets.only(bottom: 5,top: 5),
      child: Row(children: [
        Image.asset(iconPath,height: 30,),
        SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white,fontFamily: 'Gobold'),),
          Text(subtitle,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),),
        ],)

      ],),
    );
  }
  Widget calender(){
    var now = DateTime.now();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          dateContainer(day: now.subtract(Duration(days: 3)).day,weekday: DateFormat('EE').format(now.subtract(Duration(days: 3)))),
          dateContainer(day: now.subtract(Duration(days: 2)).day,weekday: DateFormat('EE').format(now.subtract(Duration(days: 2)))),
          dateContainer(day: now.subtract(Duration(days: 1)).day,weekday: DateFormat('EE').format(now.subtract(Duration(days: 1)))),
          dateContainer(day: now.day,weekday: DateFormat('EE').format(now),isActive: true),
          dateContainer(day: now.add(Duration(days: 1)).day,weekday: DateFormat('EE').format(now.add(Duration(days: 1)))),
          dateContainer(day: now.add(Duration(days: 2)).day,weekday: DateFormat('EE').format(now.add(Duration(days: 2)))),
          dateContainer(day: now.add(Duration(days: 3)).day,weekday: DateFormat('EE').format(now.add(Duration(days: 3)))),

        ],
      ),
    );
  }
  Widget dateContainer({String weekday,int day,bool isActive=false}){

    return Container(
      // margin: EdgeInsets.all(10),
      child: Card(
        color: isActive==true? Colors.orangeAccent:Colors.transparent,
        elevation: isActive==true?15:0,
        // shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
          children: [
            Text(weekday,style: TextStyle(color: isActive==true?Colors.white:Colors.grey,fontWeight: FontWeight.w700),),
            SizedBox(height: 8,),
            Text(day.toString(),style: TextStyle(fontSize: 24,color: isActive==true?Colors.white:Colors.black,fontWeight: FontWeight.w600),)
          ],
    ),
        ),
      ),);
  }

}
