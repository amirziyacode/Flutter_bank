import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:bank/Animation/fade.dart';
import 'package:bank/model/card.dart';
import 'package:bank/pages/card_info.dart';
import 'package:bank/pages/chart.dart';
import 'package:bank/pages/widget_cards.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  final PageController _controllerPage = PageController();
  AnimationController? _controller;
  late Animation<double> _rotection;
  AnimationController? _controllerprogress;
  Animation<double>? _prograsser;

  bool isOpen = true; // For show card info.
  


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _rotection = Tween(begin: 0.0, end: 90.0).animate(
        CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn));
    _controllerprogress = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..addListener(() {
        setState(() {});
      });

    _prograsser = Tween(begin: 0.0, end: 0.6).animate(_controllerprogress!);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerPage.dispose();
    _controller!.dispose();
    _controllerprogress!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF301077),
        elevation: 0,
        actions: [
          isOpen
              ? FadeAnimation(
                  delay: 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.drag_handle_outlined,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: we * 0.07,
                      ),
                      const Text(
                        "HOME",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                      SizedBox(
                        width: we * 0.45,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                      SizedBox(
                        width: we * 0.08,
                      ),
                    ],
                  ),
                )
              : FadeInDown(
                duration: const Duration(milliseconds: 400),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _controller!.reverse();
                            _controllerprogress!.reset();
                            isOpen = true;
                          });
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: we * 0.07,
                      ),
                      const Text(
                        "CARD DETLIS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                      SizedBox(
                        width: we * 0.3,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.swap_vert_outlined,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                      SizedBox(
                        width: we * 0.08,
                      ),
                    ],
                  ),
                )
        ],
      ),
      backgroundColor: const Color(0xFF301077),
      body: SizedBox(
        width: we,
        height: he,
        child: Stack(children: [
          SizedBox(
            height: he * 0.01,
          ),
          FadeAnimation(
            delay: 0.5,
            child: SizedBox(
              width: we * 2,
              height: he * 0.3,
              child: AnimatedBuilder(
                animation: _controller!,
                builder: (context, child) {
                  return PageView.builder(
                      controller: _controllerPage,
                      itemCount: cards.length,
                      clipBehavior: Clip.none,
                      physics: isOpen ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return Transform.rotate(
                            angle: _rotection.value * pi / 180,
                            alignment: Alignment.lerp(Alignment.center,
                                const Alignment(-.7, -.5), _controller!.value),
                            child: InkWell(
                              onTap: () {
                                _controller!.forward();
                                _controllerprogress!.forward();
                                setState(() {
                                  isOpen = false;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(20),
                                width: 300,
                                height: 400,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    gradient:
                                        LinearGradient(colors: cards[i].color)),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: he * 0.1,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cards[i].title,
                                            style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1),
                                          ),
                                          SizedBox(
                                            height: he * 0.01,
                                          ),
                                          Text(
                                            cards[i].plan,
                                            style: GoogleFonts.lato(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: we * 0.35,
                                      ),
                                      Image.asset(
                                        cards[i].logo,
                                        color: Colors.white,
                                        width: 70,
                                        height: 70,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: he * 0.08,
                                  ),
                                  Text(
                                    cards[i].number,
                                    style: GoogleFonts.abel(
                                        color: Colors.white,
                                        fontSize: 22,
                                        letterSpacing: 1),
                                  )
                                ]),
                              ),
                            ));
                      });
                },
              ),
            ),
          ),
          isOpen
              ? Positioned(
                  left: we * 0.45,
                  top: he * 0.32,
                  child: FadeAnimation(
                    delay: 0.6,
                    child: SmoothPageIndicator(
                      controller: _controllerPage,
                      count: cards.length,
                      effect: const WormEffect(
                        activeDotColor: Colors.white,
                        dotHeight: 8,
                        dotWidth: 8,
                      ),
                    ),
                  ),
                )
              : Positioned(
                  left: 150,
                  top: 40,
                  child: FadeInRight(
                    duration: const Duration(milliseconds: 400),
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          const Center(
                            child: Text("3/5",
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 1)),
                          ),
                          CircularProgressIndicator(
                            value: _prograsser!.value,
                            strokeWidth: 4,
                            valueColor:
                                const AlwaysStoppedAnimation(Color(0xFFFF00FF)),
                            backgroundColor: Colors.grey.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            isOpen ? Positioned(
                  left: we * 0.01,
                  height: he * 0.75,
                  child: FadeAnimation(
                    delay: 0.7,
                    child: SizedBox(
                      width: we * 1,
                      height: he * 0.09,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Transactions",
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: we * 0.5,
                          ),
                          const Icon(Icons.sort_outlined, color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                ): Positioned(
                  left: we * 0.4,
                  top: he * 0.17,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInRight(
                      duration: const Duration(milliseconds: 500),
                      child: Text("\$ ${(_prograsser!.value * 8900).round()}",style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),
                    SizedBox(
                      height:  he * 0.05,
                    ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 600),
                      child: Row(
                        children: [
                          Icon(Icons.credit_card_outlined,color: Colors.white.withOpacity(0.4),size: 28,),
                          SizedBox(
                            width: we  * 0.04,
                          ),
                          const Text("Bank card",style: TextStyle(color: Colors.white,))
                        ],
                      ),
                    ),
                SizedBox(
                      height: he * 0.02
                    ),
                  FadeInRight(
                    duration: const Duration(milliseconds: 700),
                    child: Row(
                        children: [
                          Icon(Icons.payments_outlined,color: Colors.white.withOpacity(0.4),size:28),
                          SizedBox(
                            width: we  * 0.04,
                          ),
                          const Text("Bank account",style: TextStyle(color: Colors.white,))
                        ],
                      ),
                  ),
                    SizedBox(
                      height: he * 0.02
                    ),
                  FadeInRight(
                    duration: const Duration(milliseconds: 800),
                     child: Row(
                        children: [
                          Icon(Icons.paid_outlined,color: Colors.white.withOpacity(0.4),size: 28),
                          SizedBox(
                            width: we  * 0.04,
                          ),
                          const Text("Pay",style: TextStyle(color: Colors.white,))
                        ],
                      ),
                   ),
                  ],
                )),
          SizedBox(height: we * 0.01),
          isOpen
              ? Positioned(
                  top: he * 0.43,
                  child: FadeAnimation(
                    delay: 0.8,
                    child: SizedBox(
                      width: we * 1,
                      height: he * 0.4,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: we * 0.05),
                              child: Text(
                                "Yesterday",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 12),
                              ),
                            ),
                            SizedBox(
                              height: he * 0.02,
                            ),
                            const Widget_Card(description: "Entertainment", icon:FontAwesomeIcons.apple, price:  "- 500.00 USD", time:  "09:20 AM", title: "iTunes",),
                            Container(
                              margin: EdgeInsets.only(left: we * 0.26),
                              width: we * 0.67,
                              child: Divider(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            const Widget_Card(icon:FontAwesomeIcons.googlePay, description: 'Entertainment', time: "9:20 AM" , price: "- 450.00 USD", title:"GooglePay",),                
                            SizedBox(
                              height: he * 0.035,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: we * 0.05),
                              child: Text(
                                "17 Sep 2020",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 12),
                              ),
                            ),
                            SizedBox(
                              height: he * 0.02,
                            ),
                             const Widget_Card(
                                  icon: FontAwesomeIcons.amazon,
                                  title: "Amazon",
                                  description:"Entertainment", 
                                  price:"- 200.00 USD", 
                                  time: "02:10 AM",
                                ),
                            Container(
                              margin: EdgeInsets.only(left: we * 0.26),
                              width: we * 0.67,
                              child: Divider(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ]),
                    ),
                  ),
                )
              : Positioned(
                left: we * 0.07,
                top: he * 0.51,
                child: Column(
                  children: [
                    const Items(),
                    BounceInDown(child: const Chart())
                  ],
                ),
              )
        ]),
      ),
    );
  }
}
                           
                            
                  
                              
                                
                                
                                             
                          
                                           
                                
                                
                        