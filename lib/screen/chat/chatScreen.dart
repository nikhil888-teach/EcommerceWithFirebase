import 'dart:convert';

import 'package:ecommerce/screen/chat/chat_bubble.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:http/http.dart' as http;

import '../../widgets/scafoldmsg_theme.dart';

class MyChatScreen extends StatefulWidget {
  const MyChatScreen({super.key});

  @override
  State<MyChatScreen> createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
  final ScrollController _scrollController = ScrollController();

  final _messageTextController = TextEditingController();
  bool isTyping = false;
  bool _isShowChip = true;
  List<String> blockedKeyword = [
    'chatgpt',
    'fuck',
    'shit',
    'piss off',
    'asshole',
    'son of a bitch',
    'bastard',
    'hack',
    'suicide',
    'sex',
    'terrorism',
    'kill',
    'attack',
    'bombing',
    'rape',
    'gun',
    'murder',
    'dead'
  ];

  List<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Hi there, how can i help you?",
        messageType: "receiver",
        sendAt: curruntTime()),
    ChatMessage(messageContent: "", messageType: "", sendAt: curruntTime()),
  ];

  List<String> defaultQuestionList = [
    "Whom could I contact if I have questions via email?",
    "How can I Use this Ai?",
  ];

  List<String> defaultAnswerList = [
    "Please contact desaiujas000@gmail.com",
    "some examples : \n 1. what did people wear in 2005? \n 2. which brand is most populer in womens clothe ?\n3. who are some of the top private label clothing brands that sell canadian clothing ?\n4. listout indian clothing in partywear\n5. please tell me about zara?\n6. Latest fashion highlights in short \n7. color combiantion in men's clothing in short",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(child: _buildListMessage(messages)),
            ..._buildInputChat(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return GestureDetector(
      // onVerticalDragStart: (details) {
      //   if (details.localPosition.direction > 0) {
      //     // Alert(
      //     //   style: const AlertStyle(
      //     //       backgroundColor: AppColor.backgroundColor,
      //     //       titleStyle: TextStyle(color: AppColor.textColor),
      //     //       descStyle: TextStyle(color: AppColor.textColor)),
      //     //   context: context,
      //     //   type: AlertType.warning,
      //     //   title: "ALERT",
      //     //   desc: "Are you sure you want to close chat?",
      //     //   buttons: [
      //     //     DialogButton(
      //     //       onPressed: () => Navigator.pop(context),
      //     //       color: AppColor.senderbackground,
      //     //       child: const Text(
      //     //         "No",
      //     //         style: TextStyle(color: Colors.white, fontSize: 20),
      //     //       ),
      //     //     ),
      //     //     DialogButton(
      //     //       onPressed: () => Get.offAllNamed(Routes.homeScreen),
      //     //       color: AppColor.reciverbackground,
      //     //       child: const Text(
      //     //         "Yes",
      //     //         style: TextStyle(color: Colors.white, fontSize: 20),
      //     //       ),
      //     //     )
      //     //   ],
      //     // ).show();
      //     Get.offAllNamed(Routes.homeScreen);
      //   }
      // },
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        child: Container(
          decoration: const BoxDecoration(color: AppColor.backgroundColor),
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 12),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: CustomNavigatorButton(
              //       icon: const Icon(
              //         Icons.arrow_back_ios,
              //         size: 18,
              //         color: AppColor.textColor,
              //       ),
              //       onTap: () {}),
              // ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 10,
                      decoration: BoxDecoration(
                          color: AppColor.backgroundOutlineColor,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'ShoppyBot',
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColor.blackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListMessage(
    List<ChatMessage> chats,
  ) =>
      ListView.builder(
        reverse: true,
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 24, right: 24, top: 18),
        itemCount: chats.length + 1,
        itemBuilder: (_, index) {
          // if (index == 0) {
          //   print(index);
          //   return Container(
          //     alignment: Alignment.centerLeft,
          //     width: 50,
          //     height: 90,
          //     child: Lottie.asset('assets/animation/loading.json',
          //         reverse: true, repeat: true),
          //   );
          // }
          if (chats.length - index == chats.length) {
            if (isTyping) {
              return Container(
                  padding: EdgeInsets.only(left: 20, bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Lottie.asset("assets/image/loding.json",
                      reverse: true,
                      width: 80,
                      fit: BoxFit.fitWidth,
                      repeat: true));
            }
            return Container();
          }
          if (chats.length - index == 1) {
            return Column(
              children: [
                InputChip(
                  backgroundColor: AppColor.pinkColor,
                  label: Text(
                    defaultQuestionList[0],
                    style: TextStyle(
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w500),
                  ),
                  onSelected: (bool value) {
                    _sendMessage(questionIndex: 0);
                  },
                ),
                InputChip(
                  backgroundColor: AppColor.pinkColor,
                  label: Text(
                    defaultQuestionList[1],
                    style: TextStyle(
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w500),
                  ),
                  onSelected: (bool value) {
                    _sendMessage(questionIndex: 1);
                  },
                ),
                // InputChip(
                //   label: Text(defaultQuestionList[2]),
                //   onSelected: (bool value) {
                //     _sendMessage(questionIndex: 2);
                //   },
                // ),
                // InputChip(
                //   label: Text(defaultQuestionList[3]),
                //   onSelected: (bool value) {
                //     _sendMessage(questionIndex: 3);
                //   },
                // ),
                const SizedBox(
                  height: 10,
                )
              ],
            );
          } else {
            final message = chats[chats.length - index];
            final isMe = message.messageType == "sender";

            return ChatBubble(
              imgProfile: isMe
                  ? "https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
                  : "https://icon-library.com/images/ai-icon/ai-icon-7.jpg",
              message: message.messageContent,
              sendAt: message.sendAt,
              isMe: isMe,
            );
          }
        },
      );

  List<Widget> _buildInputChat(BuildContext context) => [
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 56,
                width: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 24),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColor.backgroundPrimary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextFormField(
                  controller: _messageTextController,
                  maxLines: 1,
                  style: GoogleFonts.quicksand(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColor.whiteColor,
                  ),
                  cursorColor: AppColor.greenColor,
                  decoration: InputDecoration(
                    hintText: 'Enter your Questions',
                    hintStyle: GoogleFonts.quicksand(
                      color: AppColor.greyTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                try {
                  _sendMessage();
                  // _sendMessage(context, arguments.otherUser, arguments.myUser);
                } catch (e) {
                  // CustomSnackBar.snackBar(context, "Opss.. Terjadi kesalahan");
                }
              },
              child: Container(
                height: 56,
                width: 56,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 24),
                decoration: BoxDecoration(
                  color: AppColor.backgroundPrimary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(AssetsPath.icSend, width: 26),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ];

  void _sendMessage({questionIndex}) async {
    String msg;
    if (!isTyping) {
      if (questionIndex != null) {
        msg = defaultQuestionList[questionIndex];
        setState(() {
          _isShowChip = true;
        });
      } else {
        setState(() {
          _isShowChip = false;
        });
        msg = _messageTextController.text;
        if (msg == '') {
          return;
        }
      }
      for (var element in blockedKeyword) {
        if (msg.toLowerCase().contains(element)) {
          Scaffold_msg.toastMessage(
              context, "please continue chat only shopping related");
          ;
          setState(() {
            isTyping = false;
          });
          return;
        }
      }
      _messageTextController.clear();

      messages.add(ChatMessage(
          messageContent: msg, messageType: 'sender', sendAt: curruntTime()));
      setState(() {
        isTyping = true;
      });

      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          scrollToBottom();
        });
      });

      String response;
      if (questionIndex != null) {
        response = defaultAnswerList[questionIndex];
      } else {
        ChatGPT chatGPT = ChatGPT(
            // apiKey: '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'
            );
        response = await chatGPT.generateResponse(msg);
      }
      // print(response);
      messages.add(ChatMessage(
          messageContent: response,
          messageType: 'receiver',
          sendAt: curruntTime()));
      setState(() {
        isTyping = false;
      });
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          scrollToBottom();
        });
      });
    }
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    });
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  String sendAt;

  ChatMessage(
      {required this.messageContent,
      required this.messageType,
      required this.sendAt});
}

// class MessageEntity extends Equatable {
//   final String messageId;
//   final String message;
//   final String sendBy;
//   final DateTime sendAt;

//   const MessageEntity({
//     required this.messageId,
//     required this.message,
//     required this.sendBy,
//     required this.sendAt,
//   });

//   @override
//   List<Object?> get props => [messageId, message, sendBy, sendAt];
// }

class ChatGPT {
  // final String apiKey;

  // ChatGPT({required this.apiKey});

  Future<String> generateResponse(String input) async {
    String url = 'https://chatgpt-api.gofitter.io/conversation';
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $apiKey'
    };
    Map<String, dynamic> body = {
      'message': input,
    };

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      Map<String, dynamic> responseJson = json.decode(response.body);
      print(responseJson);
      return responseJson['response'];
    } catch (e) {
      print(e);
      return 'Error generating response';
    }
  }
}
