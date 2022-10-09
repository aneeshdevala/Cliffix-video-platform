import 'package:cliffix/app/modules/homepage/model/videomodel.dart';
import 'package:cliffix/app/modules/nowplay_screen/view/nowplay_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget videoCard(VideoModel model) {
  return InkWell(
    onTap: () => Get.to(const NowplayScreen()),
    child: Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(model.thumnail!), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                  right: 30.0,
                  bottom: 10.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.black87),
                    child: Text(model.videoDuration!),
                  )),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 54.0,
                height: 54.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(model.avatar!), fit: BoxFit.fill)),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.videotitle!,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${model.channel} . ${model.views} . ${model.date}',
                    style: const TextStyle(color: Colors.grey),
                  ),

                  // Text(model.date!)
                ],
              )),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
        ],
      ),
    ),
  );
}
