import 'dart:async';

import 'package:BeeCreative/src/assets_repo/app_assets.dart';
import 'package:BeeCreative/src/bloc/user_bloc/user_bloc_export.dart';
import 'package:BeeCreative/src/data/models/shared_preferences/user_shared_preferences.dart';
import 'package:BeeCreative/src/widgets/avatar_circle/avatar_circle.dart';
import 'package:BeeCreative/src/widgets/drawer/drawer_list_tile.dart';
import 'package:BeeCreative/src/widgets/loading_card/loading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class AppDrawer extends StatefulWidget {
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String _userName = "User Name";
  String _avatar;
  bool _momonation;
  bool _moodmeter;
  final _userBloc = kiwi.Container().resolve<UserBloc>();
  StreamSubscription _subscription;

  _read() async {
    final _userSharedPreferences = UserSharedPreferences();
    await _userSharedPreferences.initPreferences();
    _userName = _userSharedPreferences.userName;
    _avatar = _userSharedPreferences.avatar;
    _momonation = _userSharedPreferences.momonation;
    _moodmeter = _userSharedPreferences.moodmeter;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _read();
    _subscription = _userBloc.userEvent.listen(
      (event) {
        if (event is UserLoggedOut) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.GOOGLE_LOGIN,
            (route) => false,
          );
        } else if (event is UserLogoutRequested) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Dialog(
                child: LoadingCard(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              );
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _userBloc?.dispose();
    _subscription?.cancel();
    super.dispose();
  }

  List<Widget> _listViewBuilder() {
    if (_momonation == null) {
      _momonation = false;
    }

    if (_moodmeter == null) {
      _moodmeter = false;
    }

    return [
      DrawerListTile(
        image: AppPhotos.drawerSchedule,
        title: "SCHEDULES",
        function: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.SCHEDULES,
            (route) => false,
          );
        },
      ),
      if (_momonation)
        ListTile(
          dense: true,
          leading: ImageIcon(
            AssetImage(
              AppPhotos.cookedDumpling,
            ),
            size: ScreenUtil().setWidth(16),
            color: Colors.white,
          ),
          title: Text(
            "MOMONATION",
            style: AppFontStyles(context).textStyle15White,
          ),
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.MOMONATION,
              (predicate) => false,
            );
          },
        ),
      if (_moodmeter)
        DrawerListTile(
          icon: FontAwesomeIcons.solidSmile,
          title: "MOODMETER",
          function: () {
            Navigator.of(context).pushNamed(Routes.MOODMETER);
          },
        ),
      DrawerListTile(
        icon: FontAwesomeIcons.cog,
        title: "SETTINGS",
        function: () {
          Navigator.of(context).pushNamed(Routes.SETTINGS);
        },
      ),
      DrawerListTile(
        icon: FontAwesomeIcons.signOutAlt,
        title: "LOGOUT",
        function: () {
          _userBloc.logout();
        },
      ),
      Container(
        height: ScreenUtil().setHeight(400),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: ScreenUtil().setHeight(-30),
              right: ScreenUtil().setWidth(20),
              child: Image.asset(
                AppPhotos.loginScreenCloud2,
                height: ScreenUtil().setHeight(26),
              ),
            ),
            Positioned(
              top: ScreenUtil().setHeight(100),
              right: ScreenUtil().setWidth(58),
              child: Image.asset(
                AppPhotos.loginScreenCloud1,
                height: ScreenUtil().setHeight(28),
              ),
            ),
            Positioned(
              top: ScreenUtil().setHeight(44),
              left: ScreenUtil().setWidth(38),
              child: Image.asset(
                AppPhotos.loginScreenCloud3,
                height: ScreenUtil().setHeight(34),
              ),
            ),
            Positioned(
              top: ScreenUtil().setHeight(164),
              left: ScreenUtil().setWidth(35),
              child: Image.asset(
                AppPhotos.loginScreenCloud2,
                height: ScreenUtil().setHeight(22),
              ),
            ),
            Positioned(
              top: ScreenUtil().setHeight(145),
              right: ScreenUtil().setWidth(92),
              child: Image.asset(
                AppPhotos.loginScreenBird1,
                height: ScreenUtil().setHeight(9),
              ),
            ),
            Positioned(
              top: ScreenUtil().setHeight(165),
              right: ScreenUtil().setWidth(122),
              child: Image.asset(
                AppPhotos.loginScreenBird1,
                height: ScreenUtil().setHeight(18),
              ),
            ),
            Positioned(
              top: ScreenUtil().setHeight(163),
              right: ScreenUtil().setWidth(100),
              child: Image.asset(
                AppPhotos.loginScreenBird1,
                height: ScreenUtil().setHeight(12),
              ),
            ),
            Positioned(
              bottom: ScreenUtil().setHeight(25),
              left: 0,
              child: Image.asset(
                AppPhotos.loginScreenGrass1,
                // alignment: Alignment.centerLeft,
                repeat: ImageRepeat.repeatX,
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(340),
              ),
            ),
            Positioned(
              top: ScreenUtil().setHeight(374),
              left: 0,
              child: Container(
                color: Color(AppColors.loginGrass),
                height: ScreenUtil().setHeight(300),
                width: ScreenUtil().setWidth(340),
              ),
            ),
            Positioned(
              bottom: ScreenUtil().setHeight(15),
              // left: ScreenUtil().setWidth(24),
              child: Image.asset(
                AppPhotos.loginScreenKarkhanaBuilding,
                width: ScreenUtil().setWidth(199),
                alignment: Alignment.center,
              ),
            )
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(top: 20),
        color: Color(AppColors.drawerColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Hero(
                            tag: 'avatar',
                            child:
                                AvatarCircle(AppPhotos.staticAvatar, _avatar),
                            transitionOnUserGestures: true,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "$_userName",
                            style: AppFontStyles(context).drawerHeaderStyle,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.USER_PROFILE);
                            },
                            child: Text(
                              "View Profile",
                              style: AppFontStyles(context).drawerSubTextStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30)
                ],
              ),
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: _listViewBuilder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
