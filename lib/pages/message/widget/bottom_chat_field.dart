import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trills/pages/message/widget/message_enum.dart';

class BottomChatField extends StatefulWidget {
  final String recieverUserId;
  final bool isGroupChat;
  const BottomChatField({
    Key? key,
    required this.recieverUserId,
    required this.isGroupChat,
  }) : super(key: key);

  @override
  State<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends State<BottomChatField> {
  bool isShowSendButton = false;
  final TextEditingController _messageController = TextEditingController();
  FlutterSoundRecorder? _soundRecorder;
  bool isRecorderInit = false;
  bool isShowEmojiContainer = false;
  bool isRecording = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _soundRecorder = FlutterSoundRecorder();
    openAudio();
  }

  void openAudio() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Mic permission not allowed!');
    }
    await _soundRecorder!.openRecorder();
    isRecorderInit = true;
  }

  void sendTextMessage() async {
    if (isShowSendButton) {
      // ref.read(chatControllerProvider).sendTextMessage(
      //       context,
      //       _messageController.text.trim(),
      //       widget.recieverUserId,
      //       widget.isGroupChat,
      //     );
      setState(() {
        _messageController.text = '';
      });
    } else {
      // var tempDir = await getTemporaryDirectory();
      // var path = '${tempDir.path}/flutter_sound.aac';
      // if (!isRecorderInit) {
      //   return;
      // }
      if (isRecording) {
        // await _soundRecorder!.stopRecorder();
        // sendFileMessage(File(path), MessageEnum.audio);
      } else {
        // await _soundRecorder!.startRecorder(
        //   toFile: path,
        // );
      }

      setState(() {
        isRecording = !isRecording;
      });
    }
  }

  // void sendFileMessage(
  //   File file,
  //   MessageEnum messageEnum,
  // ) {
  //   ref.read(chatControllerProvider).sendFileMessage(
  //         context,
  //         file,
  //         widget.recieverUserId,
  //         messageEnum,
  //         widget.isGroupChat,
  //       );
  // }

  // void selectImage() async {
  //   File? image = await pickImageFromGallery(context);
  //   if (image != null) {
  //     sendFileMessage(image, MessageEnum.image);
  //   }
  // }

  // void selectVideo() async {
  //   File? video = await pickVideoFromGallery(context);
  //   if (video != null) {
  //     sendFileMessage(video, MessageEnum.video);
  //   }
  // }

  // void selectGIF() async {
  //   final gif = await pickGIF(context);
  //   if (gif != null) {
  //     ref.read(chatControllerProvider).sendGIFMessage(
  //           context,
  //           gif.url,
  //           widget.recieverUserId,
  //           widget.isGroupChat,
  //         );
  //   }
  // }

  void hideEmojiContainer() {
    setState(() {
      isShowEmojiContainer = false;
    });
  }

  void showEmojiContainer() {
    setState(() {
      isShowEmojiContainer = true;
    });
  }

  void showKeyboard() => focusNode.requestFocus();
  void hideKeyboard() => focusNode.unfocus();

  void toggleEmojiKeyboardContainer() {
    if (isShowEmojiContainer) {
      showKeyboard();
      hideEmojiContainer();
    } else {
      hideKeyboard();
      showEmojiContainer();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
    _soundRecorder!.closeRecorder();
    isRecorderInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final messageReply = '';
    final isShowMessageReply = messageReply != null;
    return Column(
      children: [
        //isShowMessageReply ? const MessageReplyPreview() : const SizedBox(),
        Row(
          children: [
            Expanded(
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 48.0,
                ),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 3,
                  focusNode: focusNode,
                  controller: _messageController,
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      setState(() {
                        isShowSendButton = true;
                      });
                    } else {
                      setState(() {
                        isShowSendButton = false;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: toggleEmojiKeyboardContainer,
                              icon: const Icon(
                                Icons.emoji_emotions,
                                color: Colors.grey,
                              ),
                            ),
                            IconButton(
                              onPressed: () {}, //selectGIF,
                              icon: const Icon(
                                Icons.gif,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // suffixIcon: SizedBox(
                    //   width: 100,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       IconButton(
                    //         onPressed: () {}, //selectImage,
                    //         icon: const Icon(
                    //           Icons.camera_alt,
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    //       IconButton(
                    //         onPressed: () {}, // selectVideo,
                    //         icon: const Icon(
                    //           Icons.attach_file,
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    hintText: 'Type a message!',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 3, right: 2, left: 2, top: 3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    12), // Adjust the borderRadius as needed
                child: Container(
                  color: Colors.white,
                  width:
                      48, // Adjust width to match the desired rectangular shape
                  height:
                      48, // Adjust height to match the desired rectangular shape
                  child: GestureDetector(
                    child: Icon(
                      isShowSendButton
                          ? Icons.send
                          : isRecording
                              ? Icons.close
                              : Icons.mic,
                      color: Colors.black,
                    ),
                    onTap: () {
                      // Your onTap functionality here
                      // For example: sendTextMessage();
                    },
                  ),
                ),
              ),
            )
          ],
        ),
        isShowEmojiContainer
            ? SizedBox(
                height: 310,
                child: EmojiPicker(
                  onEmojiSelected: ((category, emoji) {
                    setState(() {
                      _messageController.text =
                          _messageController.text + emoji.emoji;
                    });

                    if (!isShowSendButton) {
                      setState(() {
                        isShowSendButton = true;
                      });
                    }
                  }),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
