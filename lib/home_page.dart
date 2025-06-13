import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.green),
        body: buildBody(),
      ),
    );
  }

  buildBody(){
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  child: Image.network(
                    'https://static.vecteezy.com/system/resources/previews/019/879/186/large_2x/user-icon-on-transparent-background-free-png.png', width: 50, height: 50,
                  ),
                ),
                SizedBox(width: 10),
                Text('Username'),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children:[
                    Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: Image.network(
                        'https://wallpaperaccess.com/full/902489.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 5,
                      left: 16,
                      child:
                      Text('Destaques da Semana', style: GoogleFonts.inter(color: Colors.white)),
                    ),
                    SizedBox(height: 8),
                    Positioned(
                      bottom: 6,
                      child:
                        Row(
                          children: [
                            Icon(Icons.circle, size: 10.0),
                            SizedBox(width: 3),
                            Icon(Icons.circle, size: 10.0),
                            SizedBox(width: 3),
                            Icon(Icons.circle, size: 10.0),
                          ],
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 15,
            ),
            children: [
              buildContainer(),
              buildContainer(),
              buildContainer(),
              buildContainer(),
              buildContainer(),
              buildContainer(),
            ],
          ),
        ],
      ),
    );
  }

  buildContainer(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              'https://a0.muscache.com/im/pictures/miso/Hosting-1175454379947905292/original/1873def9-5710-403f-b1f1-b2c766f61e31.jpeg?im_w=1200', fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          buildText(text: 'Professional Host', color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.normal),
          buildText(text: '18 - 23 Dec', color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.normal),
          buildText(
            text: '\$1,065 total',
            color: Colors.black,
            fontSize: 10.0,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  buildText({required text, color, fontSize, fontWeight}) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}