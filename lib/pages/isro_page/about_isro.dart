import 'package:apod/widget/custom_theme/theme.dart';
import 'package:flutter/material.dart';

class AboutISRO extends StatelessWidget{
  const AboutISRO({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Backcolor,
      appBar: AppBar(
        backgroundColor: Backcolor,
        title: const Text("About ISRO",style:TextStyle(color: Textcolor,fontWeight: FontWeight.bold,fontSize: 20),),
        centerTitle:true ,
      ),
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Text("Indian Space Research Organisation (ISRO) is the space agency of India. The organisation is involved in science, engineering and technology to harvest the benefits of outer space for India and the mankind. ISRO is a major constituent of the Department of Space (DOS), Government of India. The department executes the Indian Space Programme primarily through various Centres or units within ISRO.",
              style:TextStyle(color:Textcolor,fontSize: 12,fontWeight:FontWeight.normal) ,)
          ],
        ),
      ),
    );
  }
}