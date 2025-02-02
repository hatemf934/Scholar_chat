import 'package:chatsapp/core/size_value_manager.dart';
import 'package:chatsapp/core/text_value_manager.dart';
import 'package:chatsapp/models/message_model.dart';
import 'package:chatsapp/widgets/chat_bubble.dart';
import 'package:chatsapp/widgets/textfieldsearch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  final controller = TextEditingController();
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    CollectionReference messages =
        FirebaseFirestore.instance.collection(TextValueManager.kMessages);
    return StreamBuilder<QuerySnapshot>(
        stream: messages
            .orderBy(TextValueManager.kcreatedAt, descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
                body: Center(child: Text(TextValueManager.kTextWrong)));
          } else if (snapshot.hasData) {
            List<MessageModel> messagelist = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagelist.add(
                MessageModel.fromjson(snapshot.data!.docs[i]),
              );
            }
            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false, // remove arrow back
                  centerTitle: true,

                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(TextValueManager.kLogo,
                          height: WidthAndHighValue.hV55),
                      const Text(
                        TextValueManager.kChat,
                        style:
                            TextStyle(fontSize: FontSizeValueManager.fontZV20),
                      )
                    ],
                  ),
                ),
                body: Column(children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: scrollController,
                        itemCount: messagelist.length,
                        itemBuilder: (context, index) {
                          if (messagelist[index].message.isEmpty ||
                              messagelist[index].message.trim().isEmpty) {
                            return Container();
                          } else {
                            return messagelist[index].id == email
                                ? ChatBubble(
                                    message: messagelist[index],
                                  )
                                : ChatBubbleByFriend(
                                    message: messagelist[index],
                                  );
                          }
                        }),
                  ),
                  TextFieldSearch(
                      onButtonPressed: (data) {
                        if (data.trim().isNotEmpty) {
                          messages.add({
                            "createdAt": DateTime.now(),
                            "message": data,
                            "id": email,
                          });
                          controller.clear();
                          scrollController.animateTo(0,
                              duration: const Duration(seconds: 2),
                              curve: Curves.easeIn);
                        }
                      },
                      controller: controller,
                      onSend: (data) {
                        if (data.trim().isNotEmpty) {
                          messages.add({
                            "createdAt": DateTime.now(),
                            "message": data,
                            "id": email,
                          });
                          controller.clear();
                          scrollController.animateTo(0, // to top of th listview
                              duration: const Duration(seconds: 2),
                              curve: Curves.easeIn);
                        }
                      }),
                ]));
          } else {
            return const ModalProgressHUD(
              inAsyncCall: true,
              child: Scaffold(),
            );
          }
        });
  }
}

/*
 ** futureBulider use for a (one time read)
 ** StriemBuilder use for a (realtime read)  
 تستخدم ل البرامج الي هحتاج ليها تغيير لحظي 

*/
/*
في الجزء دا عملت شرط يتاكد لو الرساله جايه فاضيه ميبعتش حاجه
عملت شرط يتاكد لو الرساله فاضيه وعملت enter ميبعتش حاجه ل message
اتاكدت اني بعمل enter للرساله ب طريقتين ( 1/send   2/onsubmited)

لو عمل scroll to end of the listview بستخدم ScrollController.animateto
 لو عاوزه زي البرنامج دا يطلع لي فةق لما ابعت الرساله بعمل 3 حاجات
 1) reverse :true for listview
 2) descending: true for orderby
 3) double offset : 0 for animateto
*/

