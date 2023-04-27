import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String sendAt;
  final String? imgProfile;
  final bool isMe;

  const ChatBubble(
      {required this.message,
      required this.imgProfile,
      required this.sendAt,
      this.isMe = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final date = DateFormat('HH.mm').format(sendAt);
    final date = sendAt;

    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 24),
        child: isMe
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(left: 30),
                            decoration: BoxDecoration(
                              color: AppColor.senderbackground,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(50, 207, 207, 207),
                                  offset: Offset(
                                    0.0,
                                    3.0,
                                  ),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                ),
                              ],
                              border: Border.all(
                                color: AppColor.whiteColor,
                              ),
                            ),
                            child: Text(
                              message,
                              style: GoogleFonts.quicksand(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.textColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Text(
                              date,
                              style: GoogleFonts.quicksand(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 40,
                  //   width: 40,
                  //   child: ClipRRect(
                  //     borderRadius: const BorderRadius.all(Radius.circular(12)),
                  //     child: imgProfile == null
                  //         ? Image.asset(AssetsPath.icProfile)
                  //         : FadeInImage.assetNetwork(
                  //             fit: BoxFit.cover,
                  //             fadeInDuration: const Duration(milliseconds: 100),
                  //             fadeOutDuration: const Duration(milliseconds: 100),
                  //             placeholder: AssetsPath.icProfile,
                  //             image: imgProfile!,
                  //           ),
                  //   ),
                  // ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: imgProfile == null
                          ? Image.asset(AssetsPath.icProfile)
                          : Image.asset('assets/image/bot2.png'),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(66, 163, 163, 163),
                                    offset: Offset(
                                      0.0,
                                      3.0,
                                    ),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                ],
                                color: AppColor.reciverbackground,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                                border: Border.all(
                                  color: AppColor.backgroundOutlineColor,
                                )),
                            child: Text(
                              message,
                              style: GoogleFonts.quicksand(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.textColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(
                              date,
                              style: GoogleFonts.quicksand(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
