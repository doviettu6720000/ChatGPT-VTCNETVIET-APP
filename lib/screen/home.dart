import 'package:chat_app_gpt/constant/app_assets.dart';
import 'package:chat_app_gpt/constant/app_styles.dart';
import 'package:chat_app_gpt/constant/messagebubble.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_gpt/network/getApi.dart';
import 'package:chat_app_gpt/model/message.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final inputController = TextEditingController();
  final messages = <Message>[];
  bool isButtonEnabled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputController.addListener(() {
      setState(() {
        isButtonEnabled = inputController.text.isNotEmpty;
      });
    });
  }

  void _submitMessage(response) {
    setState(() {
      messages.insert(0, Message(message: response, isUser: true));
      inputController.clear();
    });
  }

  void _botMessage(response) {
    setState(() {
      messages.insert(0, Message(message: response, isUser: false));
      inputController.clear();
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          padding: const EdgeInsets.only(bottom: 15),
          height: 60,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xffF2F4F5),
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                AppAssets.splashLogo,
                height: 50.0,
              ),
              const SizedBox(width: 10.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ChatBot Test',
                    style: AppStyle.h5.copyWith(
                        color: const Color(0xff202325),
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Image(image: AssetImage(AppAssets.onlineIcon)),
                      ),
                      Text(
                        "Luôn hoạt động",
                        style: AppStyle.h5.copyWith(
                            color: const Color(0xFF72777A),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  message: messages[index].message,
                  isUser: messages[index].isUser,
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xffF2F4F5),
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.66,
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Hãy nói chuyện với tôi nào !',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide: BorderSide(color: Colors.white38),
                      ),
                    ),
                    style: AppStyle.h5,
                    controller: inputController,
                  ),
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.09,
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.14,
                  child: InkWell(
                    onTap: isButtonEnabled ? () async {
                      var response = await RemoteService()
                          .getResponse(inputController.text);
                      _submitMessage(inputController.text);
                      _botMessage(response);
                    } : null,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff2952A2),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Image(
                          image: AssetImage(AppAssets.flyIcon),
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
