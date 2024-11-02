import 'package:flutter/material.dart';
import '../core/app_export.dart';

enum BottomBarEnum { Home, More }

class CustomBottomAppBar extends StatefulWidget {
  CustomBottomAppBar({this.onChanged});

  final Function(BottomBarEnum)? onChanged;

  @override
  CustomButtomAppBarState createState() => CustomButtomAppBarState();
}

class CustomButtomAppBarState extends State<CustomBottomAppBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        icon: ImageConstant.imgNavHome,
        activeIcon: ImageConstant.imgNavHome,
        title: "Home",
        type: BottomBarEnum.Home,
        isSelected: true),
    BottomMenuModel(
        icon: ImageConstant.imgNavMore,
        activeIcon: ImageConstant.imgNavMore,
        title: "More",
        type: BottomBarEnum.More)
  ];
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: SizedBox(
          height: 102.h,
          child: Row(
              children: List.generate(bottomMenuList.length, (index) {
            return InkWell(
              onTap: () {
                for (var element in bottomMenuList) {
                  element.isSelected = false;
                }
                bottomMenuList[index].isSelected = true;
                widget.onChanged?.call(bottomMenuList[index].type);
                setState(() {});
              },
              child: bottomMenuList[index].isSelected
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: bottomMenuList[index].activeIcon,
                          height: 24.h,
                          width: 24.h,
                          color: Color(0XFF362C62),
                        ),
                        SizedBox(height: 4.h),
                        Text(bottomMenuList[index].title ?? "",
                            style:
                            CustomTextStyles.labelMediumSemiBold.copyWith(
                              color: Color(0XFF362C62),
                            ),
                          )
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: bottomMenuList[index].icon,
                          height: 24.h,
                          width: 24.h,
                          color: Color(0XFF362C62),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          bottomMenuList[index].title ?? "",
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: Color(0XFF362C62),
                          ),
                        )
                      ],
                    ),
            );
          })),
        ));
  }
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
    this.isSelected = false,
  });

  String icon;
  String activeIcon;
  String? title;
  BottomBarEnum type;
  bool isSelected;
}

class DefaultAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Please replace the respective Widget here',
              style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
