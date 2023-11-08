import 'package:flutter/material.dart';


//Color(0xff00B8FF) 파랑
//Color(0xff374553) 회

class ReservationConfirm extends StatelessWidget {
  const ReservationConfirm({super.key});

  Widget buildDivider(Color dividerColor) {
    return Padding(
      padding: EdgeInsets.all(8.0), // 모든 방향에 8.0 픽셀의 마진을 줍니다.
      child: Divider(
        thickness: 4,
        height: 5,
        color: dividerColor,
      ),
    );
  }
  TextStyle whiteText(){
    return const TextStyle(color : Color(0xffFFFFFF));
  }


  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xff28323C),
      
        appBar:AppBar(
            backgroundColor: Colors.transparent, //appBar 투명색
            elevation: 0.0, 
            leading: IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Colors.white,
            icon: Icon(Icons.menu)),
            //appBar 그림자 농도 설정 (값 0으로 제거)
            ),

        body : SingleChildScrollView(child : Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 수직 방향으로 중앙 정렬
          crossAxisAlignment: CrossAxisAlignment.stretch, 
            children: [
            Image.network("https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https%3A%2F%2Fdbscthumb-phinf.pstatic.net%2F5662_000_7%2F20220308115005215_IDAC9KDM0.png%2F20220308104410_3.png%3Ftype%3Dm1500",
          width:100, height:100),
          Text("더뉴아반떼CN7", style : TextStyle(color: Colors.white ,fontSize: 20,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          Container(margin:EdgeInsets.only(bottom: 30), 
          child: Text("차량 준비 중 | 휘발유", textAlign: TextAlign.center, style: TextStyle(color:Color(0xFFC5C8CE))))
          ,


          Container(margin:EdgeInsets.fromLTRB(10, 0, 10, 0), child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("내일 10:30 부터", style: TextStyle(color:Color(0xff00B8FF)),),
           Text("8/30(월) 00:00", style: TextStyle(color:Color(0xff00B8FF)))],),),
          

          buildDivider(Colors.blue),
          
          Container(margin:EdgeInsets.fromLTRB(10, 0, 10, 0), child: Text("예약이 완료되었습니다.", style: TextStyle(color:Color(0xffFFFFFF))),),
          
          Container(decoration: BoxDecoration(color: Color(0xff00B8FF), borderRadius: BorderRadius.circular(7.0)),margin:EdgeInsets.fromLTRB(7, 10, 7, 0),width:200, height:80, 
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [Text("대여장소", style: TextStyle(color:Color(0xffFFFFFF))), Text("         위치", style: TextStyle(color:Color(0xffFFFFFF)))],)),

          SizedBox(height: 5),

          Container(decoration: BoxDecoration(color: Color(0xff374553), borderRadius: BorderRadius.circular(7.0)), margin:EdgeInsets.fromLTRB(7, 0, 7, 0), width:200, height:100,
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Text("챠량확인", style: TextStyle(color:Color(0xFFC5C8CE))), Text("         이용안내보기", style: TextStyle(color: Color(0xFFC5C8CE))), IconButton(onPressed: (){}, icon : Icon(Icons.navigate_next_outlined), color:Color(0xFFC5C8CE))],)),

          SizedBox(height: 5),
          Container(decoration: BoxDecoration(color: Color(0xff374553), borderRadius: BorderRadius.circular(7.0)), margin:EdgeInsets.fromLTRB(7, 0, 7, 0), width:200, height:80, 
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [Text("쏘카 이용방법이 궁금하다면?", style: TextStyle(color:Color(0xFFC5C8CE))),  IconButton(onPressed: (){}, icon : Icon(Icons.navigate_next_outlined), color:Color(0xffFFFFFF))],)),

          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [Icon(Icons.watch_later, color:Color(0xFFC5C8CE)), Text("  대여 시각 8/29 (일) 10:30", style: TextStyle(color:Color(0xFFC5C8CE))), TextButton(onPressed: (){}, child: Text("앞당기기"))],))
          ],),
        ),),
        
      bottomNavigationBar: Container(
        color:Colors.white,
        height: 150,
        padding:EdgeInsets.only(bottom:30),
        child: BottomAppBar(
          color: Colors.transparent,
        elevation: 0.0,
          child:Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(margin:EdgeInsets.all(16),
            child : Row(children: [
              Text("스마트키"),Text("OFF")])),


            Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.center,   children: [Expanded(flex:5, child: Center(child:
            TextButton(onPressed: (){}, child: Text("반납하기", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold),), 
            style: TextButton.styleFrom(backgroundColor:Color(0xffE9EBEE) ,padding:EdgeInsets.fromLTRB(30,20,30,20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),side : BorderSide(color:Colors.grey.withOpacity(0))),)),),
            ),
            Expanded(flex:7,child: Container(
              height: 60,
              margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
              decoration: BoxDecoration(color: Color(0xffE9EBEE), borderRadius: BorderRadius.circular(12)),
              
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton.outlined(onPressed: (){}, icon: Icon(Icons.lock_outline),),
              IconButton.outlined(onPressed: (){}, icon: Icon(Icons.lock_open)),],)
            ), )
            ],),),
            
          ],),
        ),
      ),
      
      );
    
  }
}