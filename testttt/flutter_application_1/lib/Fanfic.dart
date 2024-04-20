import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Fanfic(),
    );
  }
}


class Fanfic extends StatelessWidget {
  const Fanfic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(context, 'Home', Icons.home),
              _buildNavItem(context, 'Fanfic', Icons.star),
              _buildNavItem(context, 'Reading', Icons.book),
              _buildNavItem(context, 'Writing', Icons.create),
              _buildNavItem(context, 'Activity', Icons.notifications),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.blueAccent],
            radius: 1.5,
            center: Alignment.center,
          ),
        ),
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff004cc3),
                      image: DecorationImage(
                        image: AssetImage('assets/disney.jpg'),
                        fit: BoxFit.cover, // ระบุ fit ของรูปภาพ
                      ),
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
                   SizedBox(
                    width: 15,
                  ),
                  const Column( 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('นิยาย',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 35,color: Color(0xff004cc3),
                      ),
                    
                     
                    ],
                  ),
       
                  Spacer(),
                    Badge(
                        backgroundColor: Color(0xffFF7801),
                        label: Text('2'),
                        child: 
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.person,
                            color: Colors.black38,

                          )
                          
                         
                        )
                    )
                ], 
              ), 
            ), 
            SizedBox(height: 20,),
            Container(
              width: 420,
              height: 170,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/disney.jpg')
                  )
                ),
              ),

              
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('อันดับนิยาย',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),),
                   Padding(
                    padding: EdgeInsets.only(top: 18.0,right: 18),
                    child: Image(
                      height: 90,
                      image: AssetImage('assets/disney.jpg')
                    ),
                    ),
                    Padding(
                    padding: EdgeInsets.only(top: 18.0,),
                    child: Image(
                      height: 90,
                      image: AssetImage('assets/disney.jpg')
                    ),
                    ),
                    Padding(
                    padding: EdgeInsets.only(top: 18.0,),
                    child: Image(
                      height: 90,
                      image: AssetImage('assets/disney.jpg')
                    ),
                    ),
                    
                ],
              ),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // ปรับขนาดระยะห่างภายในตามต้องการ
                    decoration: BoxDecoration(
                    color: Colors.white, // สีของพื้นหลังภายในกรอบ
                    border: Border.all(color: Colors.blue, width: 2), // สีและความหนาของกรอบ
                    borderRadius: BorderRadius.circular(5), // ความโค้งของมุมกรอบ
               ),
                child: Text('นิยายรัก',
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                ),
               ),
              ),
                   Padding(
                    padding: EdgeInsets.only(top: 18.0,right: 18),
                    child: Image(
                      height: 90,
                      image: AssetImage('assets/disney.jpg')
                    ),
                    ),
                    Padding(
                    padding: EdgeInsets.only(top: 18.0,),
                    child: Image(
                      height: 90,
                      image: AssetImage('assets/disney.jpg')
                    ),
                    ),
                    Padding(
                    padding: EdgeInsets.only(top: 18.0,),
                    child: Image(
                      height: 90,
                      image: AssetImage('assets/disney.jpg')
                    ),
                    ),
                    
                ],
              )
             
            
          ], 
        ), 
      ), 
    ); 
  }
}

  Widget _buildNavItem(BuildContext context, String label, IconData icon) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        // Here you can add navigation logic
        // For instance:
        // Navigator.push(context, MaterialPageRoute(builder: (context) => YourNewPage()));
        print('$label tapped');
      },
      tooltip: label,
    );
  }
