import 'dart:io';
import 'package:flutter/material.dart';
import 'package:trills/model/post_model.dart';
import 'package:trills/post/post_api.dart';
import 'package:trills/util/pick_fille.dart';
import 'package:video_player/video_player.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final TextEditingController _messageController = TextEditingController();
  late VideoPlayerController _videoPlayerController;
  List<String> images = [];
  List<String> videos = [];
  List<String> tags = [];
  addImage(path) {
    if (path != null && !images.contains(path)) {
      images.add(path);
    }
    setState(() {});
  }

  addVideo(path) {
    if (path != null && !videos.contains(path)) {
      videos.add(path);
    }
    setState(() {});
  }

  _initVideoPlayer(path) {
    _videoPlayerController = VideoPlayerController.file(File(path))
      ..addListener(() {})
      ..setLooping(true)
      ..initialize().then((value) => _videoPlayerController.pause());
  }

  postData() async {
    Post post = Post(
        description: _messageController.text,
        photo: images,
        video: videos,
        tags: tags);
    var res = await PostAPI().addPost(post);
    if (res) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Create Post',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        // margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(8),

        child: Container(
          margin: const EdgeInsets.all(10),
          height: size.height - 100,
          child: Column(
            children: [
              TextField(
                textAlignVertical: TextAlignVertical.top,
                textInputAction: TextInputAction.send,
                maxLines: 10,
                // expands: true,
                controller: _messageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  hintText: "description...",
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
              SizedBox(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                          images.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: imageWidget(images[index]),
                              )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                          videos.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: videoWidget(videos[index]),
                              )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: SizedBox(
        height: 100,
        child: Row(children: [
          Container(
            width: size.width - 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      final pickedFile = await PickFile().pickImage();
                      addImage(pickedFile);
                    },
                    icon: const Icon(Icons.image_rounded)),
                const SizedBox(
                  width: 30,
                ),
                IconButton(
                    onPressed: () async {
                      final pickedFile = await PickFile().pickVideo();
                      addVideo(pickedFile);
                    },
                    icon: const Icon(Icons.video_collection)),
                const SizedBox(
                  width: 30,
                ),
                Expanded(child: button(context)),
              ],
            ),
          )
        ]),
      ),
    );
  }

  button(context) {
    return InkWell(
      onTap: () async {
        await postData();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6),
            border:
                Border.all(width: 1, color: Theme.of(context).primaryColor)),
        child: Text("Post",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).scaffoldBackgroundColor)),
      ),
    );
  }

  Widget imageWidget(image) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
            height: 100,
            margin: const EdgeInsets.only(right: 10, top: 20),
            child: Image(height: 52, image: FileImage(File(image)))),
        InkWell(
            onTap: () async {
              images.remove(image);
              setState(() {});
            },
            child: Icon(
              Icons.cancel,
              color: Theme.of(context).colorScheme.error,
            ))
      ],
    );
  }

  Widget videoWidget(video) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        FutureBuilder(
            future: _initVideoPlayer(video),
            builder: (context, state) {
              if (state.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SizedBox(
                  height: 100,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                          aspectRatio: 9 / 6,
                          child: VideoPlayer(_videoPlayerController)),
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: IconButton(
                            onPressed: () {
                              _videoPlayerController.play();
                            },
                            icon: const Icon(
                              Icons.play_arrow,
                            )),
                      )
                    ],
                  ),
                );
              }
            }),
        InkWell(
            onTap: () async {
              videos.remove(video);
              setState(() {});
            },
            child: Icon(
              Icons.cancel,
              color: Theme.of(context).colorScheme.error,
            ))
      ],
    );
  }
}
