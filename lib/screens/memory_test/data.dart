class Game { 
  List<String>? gameImg; 
  List<String> ?gameImg1; 
 
  String hiddenCardpath = "assets/images/brain.jpg"; 
  List<String> cards_list = [ 
    "assets/images/shopping_cart.jpg", 
    "assets/images/battery.jpg", 
    "assets/images/beetle.jpg", 
    "assets/images/gift.jpg", 
      "assets/images/instagram.jpg", 
    "assets/images/purchases.jpg", 
    // "assets/images/house.jpeg", 
    // "assets/images/fire.jpeg", 
    // "assets/images/Roll.jpeg", 
  //    "assets/images/mask.jpeg", 
  ]; 
   
 
  List<Map<int, String>> matchCheck = []; 
 
  final int cardCount = 6; 
 
  void initGame() { 
    gameImg = List.generate(cardCount, (index) => hiddenCardpath); 
    gameImg1 = List.generate(cardCount, (index) => hiddenCardpath); 
  } 
}