import 'package:flutter/material.dart';

import '../constants/assets_path.dart';
import '../constants/colors_constants.dart';
import '../helpers/size_config.dart';
import '../widgets/components.dart';
import '../widgets/custom_search_box.dart';
import 'chat_gpt/chatgpt_voice_screen.dart';

class ChatgptScreen extends StatefulWidget {
  const ChatgptScreen({super.key});

  @override
  State<ChatgptScreen> createState() => _ChatgptScreenState();
}

class _ChatgptScreenState extends State<ChatgptScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int typeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final height = SizeConfig.sizeHeight(context);
    final width = SizeConfig.sizeWidth(context);

    return SafeArea(
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('ChatGPT',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: width * 0.05)),
        ),
        body: Container(
          height: height,
          decoration: linearGradientDecoration(),
          child: ListView(
            children: [
              SizedBox(height: height * 0.05),
              Image.asset(AssetsPath.image),
              SizedBox(height: height * 0.01),
              SizedBox(
                height: height * 0.10,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Text('maqsaf',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.05)),
                              const SizedBox(height: 5),
                              Text('for an online merch store',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: width * 0.05)),
                            ],
                          ));
                    }),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          size: 32,
                          color: AppColor.whiteColor,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.insert_photo_outlined,
                          size: 32,
                          color: AppColor.whiteColor,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.folder_open,
                          size: 32,
                          color: AppColor.whiteColor,
                        ),
                      )),
                  const Expanded(
                    flex: 3,
                    child: CustomSearchBox(),
                  ),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          navigationPush(context, const ChatgptVoiceScreen());
                        },
                        icon: const Icon(
                          Icons.headphones,
                          size: 32,
                          color: AppColor.whiteColor,
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        endDrawer: Drawer(
          backgroundColor: Colors.black,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: const Icon(Icons.add, color: Colors.white),
                  title: Text(
                    'New Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: const Icon(Icons.chat_bubble_outline,
                      color: Colors.white),
                  title: Text(
                    'conversion 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: const Icon(Icons.chat_bubble_outline,
                      color: Colors.white),
                  title: Text(
                    'conversion 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: const Icon(Icons.chat_bubble_outline,
                      color: Colors.white),
                  title: Text(
                    'conversion 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: const Icon(Icons.chat_bubble_outline,
                      color: Colors.white),
                  title: Text(
                    'conversion 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.white),
                  title: Text(
                    'clear conversion',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: const Icon(Icons.light_mode_outlined,
                      color: Colors.white),
                  title: Text(
                    'Lite mode',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: const Icon(Icons.person, color: Colors.white),
                  title: Text(
                    'My account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: const Icon(Icons.update, color: Colors.white),
                  title: Text(
                    'Updates & FAQ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04,
                    ),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.white),
                  title: Text(
                    'logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
