import 'dart:convert';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart'as http;
class VideoController extends GetxController {
  late CachedVideoPlayerController videoPlayerController;
  CustomVideoPlayerController? customVideoPlayerController;
  String videoUrl = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
  var isInitialized = false.obs;
  Future fetchApi()async {
    try {
      final response = await http.get(Uri.parse(
          'https://getlearn-admin.getbuildfirst.com/api/course/details/1'));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data['data']['sections'][0]['lessons'][0]['video_link_path'];
      } else {
        return CircularProgressIndicator();
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  void initializeVideoPlayer(String url) {
    videoPlayerController = CachedVideoPlayerController.network(url);
    videoPlayerController.initialize().then((_) {
      customVideoPlayerController = CustomVideoPlayerController(
        context: Get.context!,
        videoPlayerController: videoPlayerController,
      );
      isInitialized.value = true; // Set true when initialization is complete
      update(); // Notify listeners for update
    });
  }

  @override
  void onInit() {
    super.onInit();
    fetchApi().then((url){
      if(url!=null){
        initializeVideoPlayer(url);
      }
    });

  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    customVideoPlayerController?.dispose();
    super.onClose();
  }
}
