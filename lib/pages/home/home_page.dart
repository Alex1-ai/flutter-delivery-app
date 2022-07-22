import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart/cart_history.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/colors.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
   static String routeName = "/home-page";
  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
 
  int _selectedIndex =0;
  List pages =[
    MainFoodPage(),
    Container(child: Center(child: Text("Next Page"),),),
    CartHistory(),
    Container(child: Center(child: Text("Next Next Next Page"),),),
    

  ];
  void onTapNav(int index){
    setState(() {
       _selectedIndex = index;
    });

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels:false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,),
            label: "Home"
            ),


          BottomNavigationBarItem(
            icon: Icon(Icons.archive,),
            label: "history"
            ),


          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,),
            label: "Cart"
            ),


          BottomNavigationBarItem(
            icon: Icon(Icons.person,),
            label: "Home"
            ),
            
            
             
            
        ]
        
        
        
        ),




    );
    
  }
}