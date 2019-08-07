import 'package:BeeCreative/src/assets_repo/app_assets.dart';
import 'package:BeeCreative/src/data/models/colors/colors_model.dart';
import 'package:BeeCreative/src/widgets/avatar_circle/avatar_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedCard extends StatefulWidget {
  final ColorModel colorModel;
  final Function onTap;

  const FeedCard({
    Key key,
    @required this.colorModel,
    this.onTap,
  }) : super(key: key);
  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: ScreenUtil().setWidth(200),
        height: ScreenUtil().setHeight(316),
        margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(12),
          right: ScreenUtil().setWidth(3),
          bottom: ScreenUtil().setHeight(5),
        ),
        decoration: BoxDecoration(
          color: widget.colorModel.light,
          borderRadius: BorderRadius.circular(
            ScreenUtil().setWidth(15),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              offset: Offset(0, 1),
              spreadRadius: 1,
              color: Color(AppColors.shadowColor),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              bottom: ScreenUtil().setHeight(68),
              left: ScreenUtil().setWidth(25),
              child: Icon(
                FontAwesomeIcons.seedling,
                color: widget.colorModel.dark,
              ),
            ),
            Positioned(
              bottom: ScreenUtil().setHeight(16),
              right: ScreenUtil().setWidth(15),
              child: ImageIcon(
                AssetImage(AppPhotos.outlineDumpling),
                color: widget.colorModel.dark,
                size: ScreenUtil().setSp(31),
              ),
            ),
            Positioned(
              right: ScreenUtil().setWidth(8),
              bottom: ScreenUtil().setWidth(8),
              child: Icon(
                FontAwesomeIcons.heart,
                color: Colors.white,
                size: ScreenUtil().setSp(16),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: ImageIcon(
                AssetImage(AppPhotos.bar),
                color: widget.colorModel.darker,
                size: ScreenUtil().setSp(97),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: ScreenUtil().setHeight(23)),
                AvatarCircle(
                  AppPhotos.staticAvatar,
                  'https://cdn3.iconfinder.com/data/icons/users-6/100/654853-user-men-2-512.png',
                  showCloud: false,
                  ringColor: widget.colorModel.darker,
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                Text(
                  'Person\'s Name',
                  style: TextStyle(
                    color: widget.colorModel.fontColor,
                    fontSize: ScreenUtil().setSp(15),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(2)),
                Text(
                  'received 3 mo:mo(s)',
                  style: TextStyle(
                    color: widget.colorModel.fontColor,
                    fontSize: ScreenUtil().setSp(10),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(23),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      FontAwesomeIcons.quoteLeft,
                      color: widget.colorModel.fontColor,
                      size: ScreenUtil().setSp(18),
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(13)),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(23),
                  ),
                  child: Text(
                    'Thanks for the designs',
                    maxLines: 3,
                    style: TextStyle(
                      color: widget.colorModel.fontColor,
                      fontSize: ScreenUtil().setSp(12),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(17)),
                Padding(
                  padding: EdgeInsets.only(
                    right: ScreenUtil().setWidth(23),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '- Appreciator',
                      style: TextStyle(
                        color: widget.colorModel.fontColor,
                        fontSize: ScreenUtil().setSp(12),
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
