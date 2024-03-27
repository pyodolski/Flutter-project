import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';


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
        "image": "assets/images/ara-1.jpg",
        "title": "네메시스 축구화275",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-2.jpg",
        "title": "LA갈비 5kg팔아요~",
        "location": "제주 제주시 아라동",
        "price": "100000",
        "likes": "5"
      },
      {
        "image": "assets/images/ara-3.jpg",
        "title": "치약팝니다",
        "location": "제주 제주시 아라동",
        "price": "5000",
        "likes": "0"
      },
      {
        "image": "assets/images/ara-4.jpg",
        "title": "[풀박스]맥북프로16인치 터치바 스페이스그레이",
        "location": "제주 제주시 아라동",
        "price": "2500000",
        "likes": "6"
      },
      {
        "image": "assets/images/ara-5.jpg",
        "title": "디월트존기임팩",
        "location": "제주 제주시 아라동",
        "price": "150000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-6.jpg",
        "title": "갤럭시s10",
        "location": "제주 제주시 아라동",
        "price": "180000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-7.jpg",
        "title": "선반",
        "location": "제주 제주시 아라동",
        "price": "15000",
        "likes": "2"
      },
      {
        "image": "assets/images/ara-8.jpg",
        "title": "냉장 쇼케이스",
        "location": "제주 제주시 아라동",
        "price": "80000",
        "likes": "3"
      },
      {
        "image": "assets/images/ara-9.jpg",
        "title": "대우 미니냉장고",
        "location": "제주 제주시 아라동",
        "price": "30000",
        "likes": "3"
      },
      {
        "image": "assets/images/ara-10.jpg",
        "title": "멜킨스 풀업 턱걸이 판매합니다.",
        "location": "제주 제주시 아라동",
        "price": "50000",
        "likes": "7"
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
            Text('아라동'),
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
  final oCCy = new NumberFormat("#,###", "ko_KR");
  String calcStringToWon(String pricString){

    return "원";
  }
  Widget _bodyWidget() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (BuildContext _context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10), // all의 상화자
            // margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)), // 아이콘 경계 둥글게 하는 법
                    child: Image.asset(datas[index]["image"]!,
                    width: 100,
                    height: 100,
                    )
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.only(left: 20),
                    // width: MediaQuery.of(context).size.width,  사진사이즈만큼 뺴주는데 연산이 들어감
                    child: Column(
                      // mainAxisAlignment: ,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(datas[index]["title"]!,
                          overflow: TextOverflow.ellipsis, // 오버처리
                          style: TextStyle(fontSize: 15),),
                        SizedBox(height: 5),
                        Text(datas[index]["location"]!,
                        style: TextStyle(fontSize: 12,
                            color: Colors.black.withOpacity(0.3)),),
                        SizedBox(height: 5),
                        Text(
                          calcStringToWon(datas[index]["price"]!),
                        style: TextStyle(fontWeight: FontWeight.w500),),
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SvgPicture.asset("assets/svg/heart_off.svg",
                                  width: 13,
                                  height: 13,
                                ),
                                SizedBox(width: 5,), // padding only와 같은 효과
                                Text(datas[index]["likes"]!)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
