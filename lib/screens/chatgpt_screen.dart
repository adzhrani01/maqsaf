import 'package:flutter/material.dart';
import 'package:maqsaf_app/widgets/components.dart';
import '../constants/assets_path.dart';
import '../constants/colors_constants.dart';
import 'chat_gpt/chatgpt_voice_screen.dart';
import 'home_screen.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
class ChatgptScreen extends StatefulWidget {
  const ChatgptScreen({super.key});

  @override
  State<ChatgptScreen> createState() => _ChatgptScreenState();
}

class _ChatgptScreenState extends State<ChatgptScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showSuggestions = true;

  final List<Map<String, dynamic>> _messages = [];

  final String welcomeMessage =
      'مرحباً بك! كيف يمكنني مساعدتك اليوم؟ يمكنني تقديم نصائح حول الطعام والتغذية السليمة، واقتراح وجبات صحية، والإجابة عن استفساراتك المتعلقة بالمقصف.';

  // Future<void> test() async {
  //
  //   final model = GenerativeModel(
  //   model: 'gemini-1.5-flash',
  //   apiKey: "AIzaSyCCQ6WTEL9ztkYZ9IAWcGoVmTZfMgceWko",
  //   );
  //   final prompt = 'لمتى يمكنني استخدامك  ';
  //   // final prompt = 'Write a story about a magic backpack.';
  //
  //   final response = await model.generateContent([Content.text(prompt)]);
  //   print("response.text");
  //   print(response.text);
  //
  // }
  GenerativeModel? model;
  Future<void> init() async {
     model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: "AIzaSyDob9CbYcZO0xNWn7N3p_yhlArbSqiqDrY",
    );
     isLoading=false;
  }
bool isLoading=false;


  Future<void> _sendMessageAi(String message)async {
if(isLoading) return;
    if (message.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'isUser': true,
        'message': message,
        'timestamp': DateTime.now(),
      });

      _showSuggestions = false;
      _messages.add({
        'isUser': false,
        'message': "جاري التحميل ..",
        'timestamp': DateTime.now(),
      });
      isLoading=true;
    });

    _messageController.clear();
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
    try{
      final response = await model?.generateContent([Content.text(message)]);
      _messages.removeLast();
      _messages.add({

        'isUser': false,
        'message': response?.text??"",
        'timestamp': DateTime.now(),
      });
    }catch(e){
      _messages.removeLast();
      _messages.add({
        'isWrong': true,
        'isUser': false,
        'message': 'حدث خطأ، حاول مرة أخرى❗️',
        'timestamp': DateTime.now(),
      });
    }finally{
    isLoading=false;
  }
    setState(() {});
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _messages.add({

      'isUser': false,
      'message': welcomeMessage,
      'timestamp': DateTime.now(),
    });
    init();
  }

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'isUser': true,
        'message': message,
        'timestamp': DateTime.now(),
      });

      _showSuggestions = false;

      _messages.add({

        'isUser': false,
        'message': 'شكراً على سؤالك! سأقوم بمساعدتك في ما يتعلق بـ "$message"',
        'timestamp': DateTime.now(),
      });
    });

    _messageController.clear();

    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B1B),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            decoration: BoxDecoration(
                gradient:

                AppColor.myGradient),
            child: Column(
              children: [
                _buildAppBar(),
                Expanded(
                  child: Stack(
                    children: [
                      ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.only(bottom: 100),
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          final message = _messages[index];
                          return _buildMessageBubble(message);
                        },
                      ),
                      if (_showSuggestions) _buildSuggestionsOverlay(),
                    ],
                  ),
                ),
                _buildMessageInput(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF2D91C0).withOpacity(0.8),
            const Color(0xFF15445A).withOpacity(0.8),
          ],
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () =>
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                ),
                // Navigator.pop(context),
          ),
          const SizedBox(width: 8),
          const Text(
            'مساعد المقصف الذكي',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    final isUser = message['isUser'] as bool;
    return Container(

      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),

      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            CircleAvatar(
              backgroundColor: AppColor.thirdColor,
              // backgroundColor: const Color(0xFF2D91C0),
              child: Image.asset(AssetsPath.image, width: 24,color: AppColor.whiteColor,),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isUser
                    ? const Color(0xFF2D91C0).withOpacity(0.8)
                :message['isWrong']==true?
                Colors.red.withOpacity(0.1)
                    : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                message['message'] as String,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          if (isUser) ...[
            const SizedBox(width: 8),
            const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSuggestionsOverlay() {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Container(
        height: 120,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildSuggestionCard(
              'نصائح غذائية',
              Icons.health_and_safety,
              'ما هي أفضل النصائح الغذائية للطلاب؟',
            ),
            _buildSuggestionCard(
              'وجبات صحية',
              Icons.restaurant_menu,
              'اقترح قائمة وجبات صحية للمقصف',
            ),
            _buildSuggestionCard(
              'وجبات سريعة',
              Icons.fastfood,
              'ما هي أفضل الوجبات السريعة المناسبة؟',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionCard(String title, IconData icon, String message) {
    return GestureDetector(
      onTap: () => _sendMessageAi(message),
      // onTap: () => _sendMessage(message),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),

      ),
      child: Row(
        children: [
          // _buildCircularButton(
          //   Icons.mic,
          //   () => navigationPush(context, const ChatgptVoiceScreen()),
          // ),
          // const SizedBox(width: 8),
          // _buildCircularButton(
          //   Icons.camera_alt,
          //   () {},
          // ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
              child: TextField(
                controller: _messageController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'اكتب رسالتك هنا...',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
                onSubmitted: _sendMessageAi,
                // onSubmitted: _sendMessage,
              ),
            ),
          ),
          const SizedBox(width: 12),
          _buildCircularButton(
            Icons.send,
            () => _sendMessageAi(_messageController.text),
            // () => _sendMessage(_messageController.text),
            color: const Color(0xFF2D91C0),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularButton(IconData icon, VoidCallback onPressed,
      {Color? color}) {
    return Container(
      decoration: BoxDecoration(
        color: color?.withOpacity(0.8) ?? Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
