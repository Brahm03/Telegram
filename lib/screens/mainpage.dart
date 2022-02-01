import 'package:all/screens/data/data.dart';
import 'package:all/screens/data/info.dart';
import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  Color all_color = Colors.black;
  Color positioned_coloe = Colors.white;
  Color center_bar_color = Colors.grey.shade300;
  Color text_color = Colors.black;
  Color colors_blue = Colors.blue;
  Color colors_icon = Colors.grey;
  Color app_nav_color = Colors.grey.shade200;
  Color color = Colors.white;
  int index = 0;

  void _changeMode() {
    setState(() {
      if (all_color == Colors.black &&
          center_bar_color == Colors.grey.shade300 &&
          positioned_coloe == Colors.white &&
          text_color == Colors.black &&
          color == Colors.white &&
          colors_icon == Colors.grey &&
          app_nav_color == Colors.grey.shade200) {
        all_color = Colors.white;
        positioned_coloe = Colors.grey.shade900;
        center_bar_color = Colors.black;
        text_color = Colors.white;
        color = Colors.black;
        colors_icon = Colors.white;
        app_nav_color = Colors.grey.shade900;
        colors_blue = Colors.white;
      } else {
        all_color = Colors.black;
        positioned_coloe = Colors.white;
        center_bar_color = Colors.grey.shade300;
        text_color = Colors.black;
        color = Colors.white;
        colors_icon = Colors.grey;
        app_nav_color = Colors.grey.shade200;
        colors_blue = Colors.blue;
      }
    });
  }

  List perfor = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];

  List<String> _pics = [
    'https://images.unsplash.com/photo-1643187052917-8365785db900?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: _body(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: app_nav_color,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.contact_page_outlined,
                color: colors_icon,
              ),
              label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                color: colors_icon,
              ),
              label: 'Calls'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message_rounded,
                color: colors_icon,
              ),
              label: 'Chats'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_applications,
                color: colors_icon,
              ),
              label: 'Settings'),
        ],
      ),
    );
  }

  Column _body(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 30, left: 10),
          color: app_nav_color,
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: _changeMode,
                child: Text(
                  "Edit",
                  style: TextStyle(
                    color: colors_blue,
                    fontSize: 20,
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 7, left: 50),
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: center_bar_color),
                    child: Text(
                      'Missed',
                      style: TextStyle(
                        color: text_color,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 5,
                      left: 4,
                      child: Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: positioned_coloe),
                        child: Text(
                          'All',
                          style: TextStyle(
                              color: all_color, fontWeight: FontWeight.bold),
                        ),
                      ))
                ],
              ),
              Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.add_ic_call_outlined,
                    color: colors_blue,
                    size: 28,
                  ))
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.793,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: perfor
                .map((e) => _new_method(
                    name: _name(e),
                    type: _type(e),
                    number: _number(e),
                    avatar: _avatars(e)))
                .toList(),
          ),
        )
      ],
    );
  }

  Widget _new_method(
          {required String name,
          required String type,
          required String number,
          required String avatar}) =>
      Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              foregroundImage: NetworkImage(avatar),
              radius: 30,
            ),
            title: Text(
              name,
              style: TextStyle(color: text_color),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: TextStyle(color: text_color),
                ),
                const Divider(
                  thickness: 0.2,
                  color: Colors.black,
                )
              ],
            ),
            trailing: SizedBox(
              width: 90,
              height: MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    number,
                    style: TextStyle(fontSize: 15, color: text_color),
                  ),
                  Icon(Icons.info_outline, size: 26, color: colors_blue)
                ],
              ),
            ),
          ),
        ],
      );

  String _name(int index) {
    List<info> name = data.map((e) => info.fromJson(e)).toList();
    return name[index].name!;
  }

  String _number(int index) {
    List<info> number = data.map((e) => info.fromJson(e)).toList();
    return number[index].number!;
  }

  String _type(int index) {
    List<info> type = data.map((e) => info.fromJson(e)).toList();
    return type[index].type!;
  }

  String _avatars(int index) {
    List<info> avatars = data.map((e) => info.fromJson(e)).toList();
    return avatars[index].avatar!;
  }
}
