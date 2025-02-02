
import 'package:flutter/material.dart';

import '../../constants/colors_constants.dart';
import '../../helpers/size_config.dart';
import '../../widgets/components.dart';
import '../../widgets/custom_button.dart';
import 'choose_voic_screen.dart';


class ChatgptVoiceScreen extends StatefulWidget {
  const ChatgptVoiceScreen({super.key});

  @override
  State<ChatgptVoiceScreen> createState() => _ChatgptVoiceScreenState();
}

class _ChatgptVoiceScreenState extends State<ChatgptVoiceScreen> {

  int typeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);

    return  SafeArea(child: Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor:AppColor.primaryColor,
        body: Container(
          height: height,
          decoration: linearGradientDecoration(),
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
            children: [

              SizedBox(height: height * 0.02),
              Text('Chat with voice', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: width * 0.06, fontWeight: FontWeight.bold)),
              SizedBox(height: height * 0.01),
              ListTile(
                leading: const Icon(Icons.record_voice_over, color: Color(0xFF4147F5),),
                title:Text('Just start talking', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: width * 0.04, fontWeight: FontWeight.bold)),
                subtitle:Text('Now you can have spoken conversations with ChatGPT.', textAlign: TextAlign.start, style: TextStyle(fontSize: width * 0.04)),
              ),

              ListTile(
                leading: const Icon(Icons.headphones, color: Color(0xFF4147F5),),
                title:Text('Hands-free', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: width * 0.04, fontWeight: FontWeight.bold)),
                subtitle:Text('Chat without having to look at your your screen.', textAlign: TextAlign.start, style: TextStyle(fontSize: width * 0.04)),
              ),

              ListTile(
                leading: const Icon(Icons.chat, color: Color(0xFF4147F5),),
                title:Text('Chats are saved', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: width * 0.04, fontWeight: FontWeight.bold)),
                subtitle:Text('View voice transcriptions in your history. Audio clips aren’t stored.', textAlign: TextAlign.start, style: TextStyle(fontSize: width * 0.04)),
              ),

              ListTile(
                leading: const Icon(Icons.flag, color: Color(0xFF4147F5),),
                title:Text('Language is auto-detected', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: width * 0.04, fontWeight: FontWeight.bold)),
                subtitle:Text('You can specify a preferred language in Settings for a more accurate detection.', textAlign: TextAlign.start, style: TextStyle(fontSize: width * 0.04)),
              ),
              SizedBox(height: height * 0.05),

            ],
          ),
        ),

        bottomNavigationBar: BottomAppBar(
          color: AppColor.color2,
          height: height * 0.10,
          child: CustomButton(
            label: 'Choose a voice',
            onTap: () {
              navigationPush(context, const ChooseVoicScreen());
            },
            txtSize: width * 0.04,
          ),
        ),
      ),
    ));
  }
}



