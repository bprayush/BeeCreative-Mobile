import 'package:BeeCreative/src/assets_repo/app_assets.dart';
import 'package:BeeCreative/src/widgets/animesh_card/animesh_card.dart';
import 'package:BeeCreative/src/widgets/schedule_scaffold/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnderConstruction extends StatelessWidget {
  UnderConstruction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
        width: ScreenSize.screenWidth, height: ScreenSize.screenHeight)
      ..init(context);

    return scaffoldBuilder(
      title: "Under construction",
      body: Builder(
        builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) => AnimeshDialog(),
                    );
                  },
                  child: Image.asset(
                    AppPhotos.underConstruction,
                    width: ScreenUtil().setWidth(202),
                    height: ScreenUtil().setHeight(225),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(25),
                ),
                Center(
                  child: Text(
                    "This page needs more code",
                    style: AppFontStyles(context).textStyle15BlackMedium,
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(16),
                ),
                Center(
                  child: Text(
                    "Please come back later",
                    style: AppFontStyles(context).textStyle12BlackItalic,
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(29),
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(39),
                    vertical: ScreenUtil().setHeight(10),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Color(AppColors.classCancelledColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Go Back",
                    style: AppFontStyles(context).textStyle15White,
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
