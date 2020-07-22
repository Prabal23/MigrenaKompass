import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../main.dart';

class Ajovy extends StatefulWidget {
  @override
  _AjovyState createState() => _AjovyState();
}

class _AjovyState extends State<Ajovy> {
  /////////////////////////////video Player Add ////////////
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    );

    // Initielize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

/////////////////////////////video Player Add ////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    leading: Container(
                        margin: EdgeInsets.only(left: 18),
                        child: BackButton(color: Colors.white)),
                    actions: <Widget>[
                      Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.white,
                          ))
                    ],
                    expandedHeight: 120.0,
                    floating: true,
                    pinned: true,
                    backgroundColor: Color(0xFF008990),
                    // title: Text('APPLICATION DIARY'),
                    flexibleSpace: FlexibleSpaceBar(
                      // background: Image.asset('assets/images/main_logo.png'),
                      centerTitle: true,
                      title: Container(
                        margin: EdgeInsets.only(left: 15),
                        // padding: EdgeInsets.only(bottom: 10, top: 15),
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          "AJOVY",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      background: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/flower1.png"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                  ),
                ];
              },
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width / 1.5,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/ajovy_logo.png'),
                                        fit: BoxFit.fill)),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 100),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 190,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/bam_lal.png'),
                                          fit: BoxFit.fill)),
                                ),
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 10),
                                    child: RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                'Preventivní léčba migrény přípravkem AJOVY1',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Poppins',
                                                fontSize: 23,
                                                color: Color(0xFF004E6D)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '  A',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: 35,
                                    color: Color(0xFF004E6D)),
                              ),
                              TextSpan(
                                text:
                                    'JOVY je lek na predpis,ktery se pouziva k prevenci migreny u dospelych, kteri mivaji migrenu u dospelych,kteri mivaji migrenu nejmene 4 dny v mesici. Aplikuje se injekcne pod kuzi a ucinnou latkou je fremanezumab, coz je monoklonalni protilatka, typ bilkoviny, ktera rozpozanava a napojuje se  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFF004E6D)),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Jak přípravek AJOVY působí1',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: 25,
                                    color: Color(0xFF004E6D)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 10, top: 40),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'Při vzniku migrény hraje důležitou roli látka přítomná v těle zvaná peptid příbuzný kalcitoninovému genu (calcitonin gene-related peptide, CGRP).',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFF004E6D)),
                              ),
                              TextSpan(
                                text:
                                    ' Fremanezumab se na CGRP napojuje a brání mu v činnosti. Snížení aktivity CGRP pak omezuje záchvaty migrény.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFF004E6D)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 20, right: 10),
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            'Kdy podat injekci a jakou dávku1',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins',
                                            fontSize: 23,
                                            color: Color(0xFF004E6D)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 180,
                              width: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/dain_nil.png'),
                                      fit: BoxFit.fill)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 10, top: 0),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'Přípravek je dostupný v předplněné stříkačce. Váš lékař s Vámi projedná nejvhodnější dávkovací schéma a rozhodne o něm spolu s Vámi. Existují dvě možné doporučené varianty dávkování:',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFF004E6D)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 70, right: 10, top: 10),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '● ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFFDA2A90)),
                              ),
                              TextSpan(
                                text:
                                    ' jedna injekce (225 mg) jednou za měsíc (měsíční dávkování) nebo',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFF004E6D)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 70, right: 10, top: 10),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '● ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFFDA2A90)),
                              ),
                              TextSpan(
                                text:
                                    '  tři injekce (675 mg) jednou za 3 měsíce (čtvrtletní dávkování)',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFF004E6D)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Jak přípravek v těle funguje',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: 25,
                                    color: Color(0xFF004E6D)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20, right: 10, top: 40),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'Podívejte se na video s mechanizmem účinku.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFF004E6D)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 40),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      height: 130,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/bam_nil.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      height: 130,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/dain_lal.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 40),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (_controller.value.isPlaying) {
                                        _controller.pause();
                                      } else {
                                        // If the video is paused, play it.
                                        _controller.play();
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey[500],
                                          blurRadius: 17,
                                        )
                                      ],
                                    ),
                                    margin: EdgeInsets.all(40),
                                    child: FutureBuilder(
                                      future: _initializeVideoPlayerFuture,
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          return Center(
                                            child: AspectRatio(
                                                aspectRatio: _controller
                                                    .value.aspectRatio,
                                                child:
                                                    VideoPlayer(_controller)),
                                          );
                                        } else {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              _controller.value.isPlaying
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (_controller.value.isPlaying) {
                                            _controller.pause();
                                          } else {
                                            // If the video is paused, play it.
                                            _controller.play();
                                          }
                                        });
                                      },
                                      child: Center(
                                          child: Container(
                                              margin: EdgeInsets.only(top: 40),
                                              height: 240,
                                              child: Container(
                                                child: Icon(
                                                  Icons.play_circle_outline,
                                                  color: Colors.white,
                                                  size: 100,
                                                ),
                                              ))),
                                    )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20, right: 10, top: 0),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Jak přípravek Ajovy užívat',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    fontSize: 25,
                                    color: Color(0xFF004E6D)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 10, top: 40),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '● ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFFDA2A90)),
                              ),
                              TextSpan(
                                text:
                                    '  Přípravek AJOVY si můžete aplikovat sami, pouze pokud Vás ohledně aplikace injekce důkladně proškolí ve Vašem zdravotnickém zařízení.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFF004E6D)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 10, top: 10),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '● ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFFDA2A90)),
                              ),
                              TextSpan(
                                text:
                                    '  Předplněná injekční stříkačka s přípravkem AJOVY je určena pouze pro jednorázové použití.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFF004E6D)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 10, top: 10, bottom: 30),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '● ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFFDA2A90)),
                              ),
                              TextSpan(
                                text:
                                    '  Ihned po použití vložte použitou stříkačku do odpadní nádoby na použité injekce. Nevyhazujte nádobu do koše na domovní odpad, ale odevzdejte ji v lékárně svého centra pro léčbu bolestí hlavy.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Color(0xFF004E6D)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Container(
                      //   color: Colors.white,
                      //   padding: EdgeInsets.only(left: 20, right: 10),
                      //   child: RichText(
                      //     text: TextSpan(
                      //       children: <TextSpan>[
                      //         TextSpan(
                      //           text: '  A',
                      //           style: TextStyle(
                      //               //fontWeight: FontWeight.bold,
                      //               fontSize: 50,
                      //               color: Color(0xFF134C6A)),
                      //         ),
                      //         TextSpan(
                      //           text:
                      //               'JOVY je lek na predpis,ktery se pouziva k prevenci migreny u dospelych, kteri mivaji migrenu u dospelych,kteri mivaji migrenu nejmene 4 dny v mesici. Aplikuje se injekcne pod kuzi a ucinnou latkou je fremanezumab, coz je monoklonalni protilatka, typ bilkoviny, ktera rozpozanava a napojuje se  ',
                      //           style: TextStyle(
                      //               fontWeight: FontWeight.bold,
                      //               fontFamily: 'Poppins',
                      //               fontSize: 18,
                      //               color: Color(0xFF688C96)),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //     color: Colors.white,
                      //     padding: EdgeInsets.only(left: 20, right: 10, top: 20),
                      //     child: Text(
                      //       'JOVY je lek na predpis,ktery ',
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           fontFamily: 'OpenSans-Regular',
                      //           fontSize: 25,
                      //           color: Colors.teal[900]),
                      //     )),
                      // Container(
                      //     color: Colors.white,
                      //     padding: EdgeInsets.only(left: 20, right: 10, top: 20),
                      //     child: Text(
                      //       'JOVY je lek na predpis,ktery se pouziva k prevenci migreny u dospelych, kteri mivaji migrenu u dospelych,kteri mivaji migrenu nejmene 4 dny v mesici. Aplikuje se injekcne pod kuzi a ucinnou latkou je fremanezumab, coz je monoklonalni protilatka, typ bilkoviny, ktera rozpozanava a napojuje se  ',
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           fontFamily: 'OpenSans-Regular',
                      //           fontSize: 18,
                      //           color: Color(0xFF688C96)),
                      //     )),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: <Widget>[
                      //     Expanded(
                      //       child: Container(
                      //           height: 200,
                      //           alignment: Alignment.center,
                      //           color: Colors.white,
                      //           padding: EdgeInsets.only(
                      //             left: 40,
                      //           ),
                      //           child: Text(
                      //             'JOVY je lek na predpis,ktery ',
                      //             style: TextStyle(
                      //                 fontWeight: FontWeight.bold,
                      //                 fontFamily: 'OpenSans-Regular',
                      //                 fontSize: 30,
                      //                 color: Color(0xFF134C6A)),
                      //           )),
                      //     ),
                      //     // Container(
                      //     //   height: 200,
                      //     //   width: 70,
                      //     //   decoration: BoxDecoration(
                      //     //       shape: BoxShape.rectangle,
                      //     //       image: DecorationImage(
                      //     //           image: AssetImage('assets/images/scr2.png'),
                      //     //           fit: BoxFit.fill)),
                      //     // ),
                      //   ],
                      // ),
                      // Container(
                      //     color: Colors.white,
                      //     padding: EdgeInsets.only(left: 20, right: 10, top: 20),
                      //     child: Text(
                      //       'JOVY je lek na predpis,ktery se pouziva k prevenci migreny u dospelych, kteri mivaji migrenu u dospelych,kteri mivaji migrenu nejmene 4 dny v mesici. Aplikuje se injekcne pod kuzi a ucinnou latkou je fremanezumab: ',
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           fontFamily: 'OpenSans-Regular',
                      //           fontSize: 18,
                      //           color: Color(0xFF688C96)),
                      //     )),
                      // Container(
                      //     color: Colors.white,
                      //     padding: EdgeInsets.all(30),
                      //     child: Column(
                      //       children: <Widget>[
                      //         Row(
                      //           children: <Widget>[
                      //             Container(
                      //               height: 10.0,
                      //               width: 10.0,
                      //               margin: EdgeInsets.only(
                      //                   left: 8, right: 8, bottom: 18),
                      //               decoration: new BoxDecoration(
                      //                 color: Colors.pink,
                      //                 shape: BoxShape.circle,
                      //               ),
                      //             ),
                      //             Expanded(
                      //               child: Text(
                      //                 'JOVY je lek na predpis,ktery se pouziva k prevenci',
                      //                 style: TextStyle(
                      //                     //fontWeight: FontWeight.bold,
                      //                     fontFamily: 'OpenSans-Regular',
                      //                     fontSize: 18,
                      //                     color: Color(0xFF688C96)),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //         Padding(
                      //           padding: EdgeInsets.all(5),
                      //         ),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: <Widget>[
                      //             Container(
                      //               height: 10.0,
                      //               width: 10.0,
                      //               margin: EdgeInsets.only(
                      //                   left: 8, right: 8, bottom: 18),
                      //               decoration: new BoxDecoration(
                      //                 color: Colors.pink,
                      //                 shape: BoxShape.circle,
                      //               ),
                      //             ),
                      //             Expanded(
                      //               child: Text(
                      //                 'JOVY je lek na predpis,ktery se pouziva k prevenci',
                      //                 style: TextStyle(
                      //                     //fontWeight: FontWeight.bold,
                      //                     fontFamily: 'OpenSans-Regular',
                      //                     fontSize: 18,
                      //                     color: Color(0xFF688C96)),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     )),
                      // Container(
                      //     color: Colors.white,
                      //     padding: EdgeInsets.only(left: 20, right: 10, top: 20),
                      //     child: Text(
                      //       'JOVY je lek na predpis,ktery ',
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           fontFamily: 'OpenSans-Regular',
                      //           fontSize: 25,
                      //           color: Color(0xFF134C6A)),
                      //     )),
                      // Container(
                      //     color: Colors.white,
                      //     padding: EdgeInsets.only(left: 30, right: 10, top: 20),
                      //     child: Text(
                      //       'JOVY je lek na predpis,ktery ',
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           fontFamily: 'OpenSans-Regular',
                      //           fontSize: 20,
                      //           color: Color(0xFF134C6A)),
                      //     )),
                      // Container(
                      //     height: 360,
                      //     child: Stack(
                      //       children: <Widget>[
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: <Widget>[
                      //             Container(
                      //               height: 180,
                      //               width: MediaQuery.of(context).size.width / 4,
                      //               decoration: BoxDecoration(
                      //                   image: DecorationImage(
                      //                       image: AssetImage(
                      //                           "assets/images/pinkR.png"),
                      //                       fit: BoxFit.fill)),
                      //             ),
                      //             Container(
                      //               height: 180,
                      //               margin: EdgeInsets.only(left: 270),
                      //               width: MediaQuery.of(context).size.width / 4,
                      //               decoration: BoxDecoration(
                      //                   image: DecorationImage(
                      //                       image: AssetImage(
                      //                           "assets/images/blueR.png"),
                      //                       fit: BoxFit.fill)),
                      //             ),
                      //           ],
                      //         ),

                      //         /////////////////////////////video Player Add ////////////
                      //         Container(
                      //           margin: EdgeInsets.all(30.0),
                      //           child: FutureBuilder(
                      //             future: _initializeVideoPlayerFuture,
                      //             builder: (context, snapshot) {
                      //               if (snapshot.connectionState ==
                      //                   ConnectionState.done) {
                      //                 // If the VideoPlayerController has finished initialization, use
                      //                 // the data it provides to limit the aspect ratio of the video.
                      //                 return AspectRatio(
                      //                   aspectRatio:
                      //                       _controller.value.aspectRatio,
                      //                   // Use the VideoPlayer widget to display the video.
                      //                   child: VideoPlayer(_controller),
                      //                 );
                      //               } else {
                      //                 // If the VideoPlayerController is still initializing, show a
                      //                 // loading spinner.
                      //                 return Center(
                      //                     child: CircularProgressIndicator());
                      //               }
                      //             },
                      //           ),
                      //         ),
                      //         /////////////////////////////video Player Add ////////////
                      //         /////////////////////////////video Play And Pause button////////////
                      //         Center(
                      //             child: ButtonTheme(
                      //                 height: 50.0,
                      //                 minWidth: 50.0,
                      //                 child: RaisedButton(
                      //                   //padding: EdgeInsets.all(30.0),
                      //                   color: Colors.transparent,
                      //                   textColor: Colors.white,
                      //                   onPressed: () {
                      //                     // Wrap the play or pause in a call to `setState`. This ensures the
                      //                     // correct icon is shown.
                      //                     setState(() {
                      //                       // If the video is playing, pause it.
                      //                       if (_controller.value.isPlaying) {
                      //                         _controller.pause();
                      //                       } else {
                      //                         // If the video is paused, play it.
                      //                         _controller.play();
                      //                       }
                      //                     });
                      //                   },
                      //                   child: Icon(
                      //                     _controller.value.isPlaying
                      //                         ? Icons.pause
                      //                         : Icons.play_arrow,
                      //                     size: 100.0,
                      //                   ),
                      //                 )))
                      //       ],
                      //     )),
                      // /////////////////////////////video Play And Pause button////////////
                      // Container(
                      //     color: Colors.white,
                      //     padding: EdgeInsets.only(left: 30, right: 10, top: 20),
                      //     child: Text(
                      //       'JOVY je lek na predpis,ktery ',
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           fontFamily: 'OpenSans-Regular',
                      //           fontSize: 20,
                      //           color: Color(0xFF134C6A)),
                      //     )),
                      // Container(
                      //     color: Colors.white,
                      //     padding: EdgeInsets.all(20),
                      //     child: Column(
                      //       children: <Widget>[
                      //         Row(
                      //           children: <Widget>[
                      //             Container(
                      //               height: 10.0,
                      //               width: 10.0,
                      //               margin: EdgeInsets.only(
                      //                   left: 8, right: 8, bottom: 18),
                      //               decoration: new BoxDecoration(
                      //                 color: Colors.pink,
                      //                 shape: BoxShape.circle,
                      //               ),
                      //             ),
                      //             Expanded(
                      //               child: Text(
                      //                 'JOVY je lek na predpis,ktery se pouziva k prevenci',
                      //                 style: TextStyle(
                      //                     //fontWeight: FontWeight.bold,
                      //                     fontFamily: 'OpenSans-Regular',
                      //                     fontSize: 18,
                      //                     color: Color(0xFF688C96)),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //         Padding(
                      //           padding: EdgeInsets.all(5),
                      //         ),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: <Widget>[
                      //             Container(
                      //               height: 10.0,
                      //               width: 10.0,
                      //               margin: EdgeInsets.only(
                      //                   left: 8, right: 8, bottom: 18),
                      //               decoration: new BoxDecoration(
                      //                 color: Colors.pink,
                      //                 shape: BoxShape.circle,
                      //               ),
                      //             ),
                      //             Expanded(
                      //               child: Text(
                      //                 'JOVY je lek na predpis,ktery se pouziva k prevenci',
                      //                 style: TextStyle(
                      //                     //fontWeight: FontWeight.bold,
                      //                     fontFamily: 'OpenSans-Regular',
                      //                     fontSize: 18,
                      //                     color: Color(0xFF688C96)),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //         Padding(
                      //           padding: EdgeInsets.all(5),
                      //         ),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: <Widget>[
                      //             Container(
                      //               height: 10.0,
                      //               width: 10.0,
                      //               margin: EdgeInsets.only(
                      //                   left: 8, right: 8, bottom: 18),
                      //               decoration: new BoxDecoration(
                      //                 color: Colors.pink,
                      //                 shape: BoxShape.circle,
                      //               ),
                      //             ),
                      //             Expanded(
                      //               child: Text(
                      //                 'JOVY je lek na predpis,ktery se pouziva k prevenci',
                      //                 style: TextStyle(
                      //                     //fontWeight: FontWeight.bold,
                      //                     fontFamily: 'OpenSans-Regular',
                      //                     fontSize: 18,
                      //                     color: Color(0xFF688C96)),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ],
                      //     )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
