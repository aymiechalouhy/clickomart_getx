import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProfile extends StatelessWidget {
  final String title;
  final SvgPicture svgPic;

  const CustomProfile({
    required this.title,
    required this.svgPic,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        // height: 195,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
           child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: svgPic ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 0),
                  child: Text(title,
                    style: const TextStyle(fontSize: 13,),
                  ),
                ),
              ],
          ),
       
      ),
    );
  }
}
