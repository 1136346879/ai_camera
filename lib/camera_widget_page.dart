import 'package:flutter/material.dart';
import 'package:hy_flutter_utils/hy_flutter_utils.dart';

///
///       创建时间：2023/11/6
///       修改人  ：wdx
///       描述    ：
///

class CameraWidgetPage extends StatelessWidget {
  List<String> imageIcons = ['assets/images/icon_img1.png','assets/images/icon_img2.png','assets/images/icon_img3.png','assets/images/icon_img4.png','assets/images/icon_img5.png'
  ,'assets/images/icon_img6.png','assets/images/icon_img7.png','assets/images/icon_img8.png','assets/images/icon_img9.png'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: HYContainer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                HYContainer(
                    padding: EdgeInsets.all(20),
                    child: Image.asset('assets/images/background.png')),
                HYContainer(
                  backgroundColor: Colors.white,
                    margin: const EdgeInsets.only(right: 40,bottom: 40),
                    padding: const EdgeInsets.only(top: 10,bottom: 10,right: 5,left: 5),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset('assets/images/Vector.png'))
              ]),
              HYContainer(
                height: 28,
                margin: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: imageIcons.map((e) => Image.asset(e,height: 24,width: 24,)).toList(),)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/images/image.png'),
                  Stack(
                      alignment: Alignment.center,
                      children: [
                    Image.asset('assets/images/big.png'),
                    Image.asset('assets/images/middle.png'),
                    Image.asset('assets/images/small.png'),
                  ]),
                  Image.asset('assets/images/change.png')
                ],
              )
            ],
          ),
        ));
  }
}
