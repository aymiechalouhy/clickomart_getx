// import 'package:clickomart/Screens/userinfo.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testclickomart/view/userinfo.dart';
import 'package:testclickomart/widgets/custom_appbar.dart';
import '../widgets/custom_profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          toolbarHeight: 80,
          flexibleSpace: const CustomPaint(
            painter: MyCustomPainter(),
            size: Size.infinite,
          ),
          title: Transform.translate(
            offset: const Offset(0, 5),
            child:Padding(
              padding: const EdgeInsets.only(left:130),
              child: Image.asset("assets/images/logo.png", height: 60, width: 60),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
         ),
        body: Padding(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 25,
                mainAxisExtent: 100,
                crossAxisSpacing: 20),
            children: [
              CustomProfile(
                title: 'My Wallet',
                svgPic: SvgPicture.asset("assets/images/wallet.svg",
                    height: 50, width: 50, color: Colors.blue),
              ),
              CustomProfile(
                title: 'Promo \n codes',
                svgPic: SvgPicture.asset("assets/images/gift.svg",
                    height: 40, width: 40, color: Colors.blue),
              ),
              CustomProfile(
                title: '  Refer \n a friend',
                svgPic: SvgPicture.asset("assets/images/ff.svg",
                    height: 45, width: 45, color: Colors.blue),
              ),
              CustomProfile(
                title: 'Addresses',
                svgPic: SvgPicture.asset("assets/images/address.svg",
                    height: 52, width: 52, color: Colors.blue),
              ),
              InkWell(
                onTap: () {
                  Get.to(() =>const UserInfo());
                },
                child: CustomProfile(
                  title: 'Profile',
                  svgPic: SvgPicture.asset("assets/images/ss.svg",
                      height: 50, width: 50, color: Colors.blue),
                ),
              ),
              CustomProfile(
                title: '  Order \n History',
                svgPic: SvgPicture.asset("assets/images/cart.svg",
                    height: 47, width: 47, color: Colors.blue),
              ),
              CustomProfile(
                title: 'Wishlist',
                svgPic: SvgPicture.asset("assets/images/magic.svg",
                    height: 50, width: 50, color: Colors.blue),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/testt',
                  );
                },
                child: CustomProfile(
                  title: 'Notification \n   Center',
                  svgPic: SvgPicture.asset("assets/images/notification.svg",
                      height: 40, width: 40, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
