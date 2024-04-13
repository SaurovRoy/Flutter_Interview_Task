import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:untitled3/Const/color.dart';
import 'package:untitled3/Controller/api_controller.dart';
import 'package:untitled3/Controller/video_controller.dart';
import 'package:untitled3/Widgets/custom_button.dart';
import 'package:untitled3/Widgets/textBullet.dart';
import 'package:untitled3/Widgets/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final control = Get.put(ApiController());
  late Future apiService;
  VideoController vController = Get.put(VideoController());

  @override
  void initState() {
    // TODO: implement initState
    apiService = control.fetchApi();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('jwbej');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Course Details',
            style: TextStyle(
              color: white,
            )),
        iconTheme: const IconThemeData(
          color: white, // This sets the color of the icon
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.shopping_cart, color: white),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      backgroundColor: color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: FutureBuilder(
                      future: apiService,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var data = snapshot.data['data'];
                          var topic=snapshot.data['data']['learning_topic'];
                          var sections =snapshot.data['data']['sections'];
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 35, left: 20, right: 20, bottom: 15),
                            child: ListView(children: [
                              Obx(() {
                                if (vController.isInitialized.isTrue) {
                                  return Container(
                                      height: Get.height * .25,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CustomVideoPlayer(
                                            customVideoPlayerController:
                                                vController
                                                    .customVideoPlayerController!),
                                      ));
                                }
                                return const Center(
                                    child:
                                        CircularProgressIndicator()); // Show loading spinner until the controller is initialized
                              }),
                              SizedBox(
                                height: Get.height * .06,
                              ),
                              headingText(
                                  text: '${data['title']}',
                                  color: textColor,
                                  size: 20),
                              SizedBox(
                                height: Get.height * .01,
                              ),
                              normalText(
                                  text: data['sub_title'],
                                  color: normaltxt,
                                  size: 15),
                              SizedBox(
                                height: Get.height * .01,
                              ),
                              Row(
                                children: [
                                  headingText(
                                      text: '5', color: textColor, size: 15),
                                  SizedBox(
                                    width: Get.width * .03,
                                  ),
                                  RatingBar.builder(
                                    initialRating: 5,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    itemSize: 12.0,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                  SizedBox(
                                    width: Get.width * .01,
                                  ),
                                  normalText(
                                      text: '(25,00)',
                                      color: normaltxt,
                                      size: 10),
                                ],
                              ),
                              normalText(
                                  text: '9,591 students',
                                  color: normaltxt,
                                  size: 12),
                              SizedBox(
                                height: Get.height * .01,
                              ),
                              Row(
                                children: [
                                  normalText(
                                      text: 'Mentor',
                                      color: normaltxt,
                                      size: 13),
                                  TextButton(
                                      onPressed: () {},
                                      child: normalText(
                                          text: 'Ashutosh pawar',
                                          color: color,
                                          size: 13)),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    size: 12,
                                  ),
                                  normalText(
                                      text: ' Last Update 06/2023',
                                      color: normaltxt,
                                      size: 12),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * .01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.language,
                                    size: 12,
                                  ),
                                  normalText(
                                      text: ' English',
                                      color: normaltxt,
                                      size: 12),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * .03,
                              ),
                              headingText(
                                text:
                                    'BDT  ${(double.parse(data['price'].toString()) * 100).round()}.00',
                                color: textColor,
                                size: 25,
                              ),
                              SizedBox(
                                height: Get.height * .01,
                              ),
                              customButton('Buy now', () {}),
                              SizedBox(
                                height: Get.height * .02,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  customOutlineButton('Add to cart', () {}),
                                  customOutlineButton('Add to wishlist', () {}),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * .02,
                              ),
                              headingText(
                                  text: 'What you\'ll learn',
                                  color: textColor,
                                  size: 18),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: topic.length,
                                itemBuilder:(context,index){
                                  return TextBullet('${topic[index]}');
                                }),
                              Row(
                                mainAxisAlignment:MainAxisAlignment.start,
                                children: [
                                  TextButton(onPressed: (){},
                                    child: Text('Show more'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * .02,
                              ),
                              headingText(text: 'Course Curriculum',color: textColor,size: 20),
                              SizedBox(
                                height: Get.height * .02,
                              ),
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: topic.length,
                                  itemBuilder:(context,index){
                                    return ExpansionTile(
                                      title: headingText(text: "${sections[index]['topic']}",color: color),

                                      children: [
                                        ListTile(
                                          leading:Icon(Icons.play_arrow),
                                          title: Text('${sections[index]['topic']}'),

                                          subtitle: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("${sections[index]['description']}"),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                              customOutline("16 more sections", (){}),
                              SizedBox(
                                height: Get.height * .02,
                              ),
                              headingText(text: 'This Course includes',color: textColor,size: 20),
                              SizedBox(
                                height: Get.height * .02,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.youtube_searched_for,
                                    size: 12,
                                  ),
                                  normalText(
                                      text: ' 34.5 Total hours on- demand vedio',
                                      color: textColor,
                                      size: 12),
                                ],
                              ),SizedBox(
                                height: Get.height * .01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.file_copy_outlined,
                                    size: 12,
                                  ),
                                  normalText(
                                      text: ' Support Files',
                                      color: textColor,
                                      size: 12),
                                ],
                              ),SizedBox(
                                height: Get.height * .01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.article,
                                    size: 12,
                                  ),
                                  normalText(
                                      text: ' 10 Articles',
                                      color: textColor,
                                      size: 12),
                                ],
                              ),SizedBox(
                                height: Get.height * .01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.accessibility,
                                    size: 12,
                                  ),
                                  normalText(
                                      text: ' Full lifetime access',
                                      color: textColor,
                                      size: 12),
                                ],
                              ),SizedBox(
                                height: Get.height * .01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.mobile_friendly,
                                    size: 12,
                                  ),
                                  normalText(
                                      text: 'Access on mobile desktop and TV',
                                      color: textColor,
                                      size: 12),
                                ],
                              ),SizedBox(
                                height: Get.height * .01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.checklist_rtl,
                                    size: 12,
                                  ),
                                  normalText(
                                      text: ' Certificate of Completion',
                                      color: textColor,
                                      size: 12),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * .01,
                              ),
                              headingText(text: 'Requirements',color: textColor,size: 20),
                              SizedBox(
                                height: Get.height * .01,
                              ),
                              TextBullet(data['requirements']),
                              SizedBox(
                                height: Get.height * .01,
                              ),
                              headingText(text: 'Descriptions',color: textColor,size: 20),
                              SizedBox(
                                height: Get.height * .03,
                              ),
                              normalText(text: '${data['description']}',color: textColor),
                            ]),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error : ${snapshot.error}'),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: color,
                          ));
                        }
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
