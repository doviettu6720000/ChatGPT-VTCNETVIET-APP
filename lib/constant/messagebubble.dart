import 'package:chat_app_gpt/constant/app_styles.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const MessageBubble({super.key,
    required this.message,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.only(top: 8.0, bottom: 8.0, left: isUser ? 80.0 : 0.0, right: isUser ? 0.0 : 80.0),
      decoration: BoxDecoration(
        boxShadow: const [
           BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
            offset: Offset(0, 10),
          ),
        ],
        color: isUser ? const Color(0xff2952A2) : const Color(0xffF2F4F5),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12.0),
          topRight: const Radius.circular(12.0),
          bottomLeft: isUser ? const Radius.circular(0.0) : const Radius.circular(12.0),
          bottomRight: isUser ? const Radius.circular(12.0) : const Radius.circular(0.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message,
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: FontFamily.geo,
              color: isUser ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}