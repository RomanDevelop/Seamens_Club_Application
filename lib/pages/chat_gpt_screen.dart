import 'package:flutter/material.dart';
import 'package:news_app/blocs/gpt_chat_bloc.dart';
import 'package:news_app/models/message.dart';
import 'package:news_app/services/api_service.dart';
import 'package:provider/provider.dart';

class ChatGPTScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  void onSendMessage(BuildContext context) async {
    String text = _textEditingController.text;
    if (text.isNotEmpty) {
      Message message = Message(text: text, isMe: true);
      _textEditingController.clear();

      Provider.of<GptChatBloc>(context, listen: false).addMessage(message);

      String response = await ApiService.sendMessageToChatGpt(text);

      Message chatGpt = Message(text: response, isMe: false);

      Provider.of<GptChatBloc>(context, listen: false).addMessage(chatGpt);
    }
  }

  Widget _buildMessage(Message message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment:
              message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message.isMe ? 'You' : 'SeamenS Club Consultant',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                color: message.isMe ? Colors.blue : Colors.green,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: message.isMe
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(message.text),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SeamenS Club Support'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Consumer<GptChatBloc>(
              builder: (context, messageProvider, child) {
                return ListView.builder(
                  reverse: true,
                  itemCount: messageProvider.messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildMessage(messageProvider.messages[index]);
                  },
                );
              },
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      hintText: 'Ask any question ...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => onSendMessage(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}






// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:news_app/constants/constants.dart';

// class ChatGPTScreen extends StatefulWidget {
//   const ChatGPTScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _ChatGPTScreenState createState() => _ChatGPTScreenState();
// }

// class _ChatGPTScreenState extends State<ChatGPTScreen> {
//   final List<Message> _messages = [];

//   final TextEditingController _textEditingController = TextEditingController();

//   void onSendMessage() async {
//     Message message = Message(text: _textEditingController.text, isMe: true);

//     _textEditingController.clear();

//     setState(() {
//       _messages.insert(0, message);
//     });

//     String response = await sendMessageToChatGpt(message.text);

//     Message chatGpt = Message(text: response, isMe: false);

//     setState(() {
//       _messages.insert(0, chatGpt);
//     });
//   }

//   Future<String> sendMessageToChatGpt(String message) async {
//     Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");

//     Map<String, dynamic> body = {
//       "model": "gpt-3.5-turbo",
//       "messages": [
//         {"role": "user", "content": message}
//       ],
//       "max_tokens": 500,
//     };

//     final response = await http.post(
//       uri,
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": "Bearer ${APIKey.OPENAI_API_KEY}",
//       },
//       body: json.encode(body),
//     );

//     print(response.body);

//     Map<String, dynamic> parsedReponse = json.decode(response.body);

//     if (parsedReponse.containsKey('error')) {
//       // Обработка случая ошибки, например, вывод сообщения об ошибке пользователю
//       String errorMessage = parsedReponse['error']['message'];
//       print('Ошибка: $errorMessage');
//       return 'Ошибка: $errorMessage';
//     }

//     String reply = parsedReponse['choices'][0]['message']['content'];
//     return reply;
//   }

//   Widget _buildMessage(Message message) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//         child: Column(
//           crossAxisAlignment:
//               message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               message.isMe ? 'You' : 'SeamenS Club Consultant',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: message.isMe ? Colors.blue : Colors.green,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                 color: message.isMe
//                     ? Colors.blue.withOpacity(0.2)
//                     : Colors.green.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Text(
//                 message.text,
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('SeamenS Club Support'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//               itemCount: _messages.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return _buildMessage(_messages[index]);
//               },
//             ),
//           ),
//           const Divider(height: 1.0),
//           Container(
//             decoration: BoxDecoration(color: Theme.of(context).cardColor),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: _textEditingController,
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(10.0),
//                       hintText: 'Type a message...',
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: onSendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Message {
//   final String text;
//   final bool isMe;

//   Message({required this.text, required this.isMe});
// }
