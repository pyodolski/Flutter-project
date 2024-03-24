import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> datas = []; // list 생성

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datas = [
      {
        "image": "assets/images/1.png",
        "title": "서울대학교",
        "location": "서울특별시 관악구 관악로 1",
        "student": "16000",
        "likes": "1,000,000"
      },
      {
        "image": "assets/images/2.png",
        "title": "연세대학교",
        "location": "서울특별시 서대문구 연세로 50-1",
        "student": "32000",
        "likes": "800,000"
      },
      {
        "image": "assets/images/3.jpg",
        "title": "고려대학교",
        "location": "서울특별시 성북구 안암로 145",
        "student": "37000",
        "likes": "800,000"
      },
      {
        "image": "assets/images/4.gif",
        "title": "서강대학교",
        "location": "서울특별시 관악구 관악로 1",
        "student": "16000",
        "likes": "500,000"
      },
      {
        "image": "assets/images/5.jpg",
        "title": "한양대학교",
        "location": "서울특별시 성동구 왕십리로 222",
        "student": "22000",
        "likes": "500,000"
      },
      {
        "image": "assets/images/6.png",
        "title": "경희대학교",
        "location": "서울특별시 동대문구 경희대로 26",
        "student": "33000",
        "likes": "400,000"
      },
      {
        "image": "assets/images/7.png",
        "title": "경북대학교",
        "location": "대구광역시 북구 대학로 80",
        "student": "28000",
        "likes": "200,000"
      },
      {
        "image": "assets/images/8.png",
        "title": "영남대학교",
        "location": "경상북도 경산시 대학로 280",
        "student": "28000",
        "likes": "100,000"
      },
      {
        "image": "assets/images/9.jpg",
        "title": "계명대학교",
        "location": "대구광역시 달서구 달구벌대로 1095",
        "student": "28000",
        "likes": "100,000"
      },
      {
        "image": "assets/images/10.jpg",
        "title": "대구대학교",
        "location": "경상북도 경산시 진량읍 대구대로 201",
        "student": "21000",
        "likes": "100,000"
      },

    ];
  }



  PreferredSizeWidget  _appbarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print("click");
        },
        child: const Row(
          children: [
            Text('대학교'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
      elevation: 1,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
        IconButton(onPressed: () {}, icon: SvgPicture.asset("assets/svg/bell.svg", width: 22,)),
      ],
    );
  }
  Widget _bodyWidget() {
    return ListView.separated(
        itemBuilder: (BuildContext _context, int index) {
          return Container(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)), // 아이콘 경계 둥글게 하는 법
                    child: Image.asset(datas[index]["image"]!,
                    width: 100,
                    height: 100,
                    )
                ),
                Container(
                  child: Column(
                    // mainAxisAlignment: ,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(datas[index]["title"]!),
                      Text(datas[index]["location"]!),
                      Text(datas[index]["student"]!),
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/heart_off.svg",
                            width: 13,
                            height: 13,
                          ),
                          SizedBox(width: 5,), // padding only와 같은 효과
                          Text(datas[index]["likes"]!)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: datas.length,
        separatorBuilder: (BuildContext _context, int index) {
           return Container(height: 1, color : Colors.black.withOpacity(.4));
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(), // 가독성이 매우 뛰어남.
      body: _bodyWidget(),
    );
  } //12:33 1. 안드로이드에서 되는지 , 안되면 다트 오류 없애기
}
