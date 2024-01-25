import 'package:auto_route/auto_route.dart';
import 'package:dfunc/dfunc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/widgets/refreshable_widget.dart';
import '../../../core/widgets/retry_widget.dart';
import '../../../l10n/l10n.dart';
import '../../../routes.gr.dart';
import '../../../ui/colors.dart';
import '../../../utils/extensions.dart';
import '../../session/services/session_cubit.dart';
import '../data/models/convo.dart';
import '../services/chat_service.dart';
import 'widgets/new_chat_dialog.dart';
import 'widgets/setting.dart';
import 'widgets/chat.dart';
import 'widgets/contacts.dart';
import '../services/xmtp/xmtp_repository.dart';
import 'package:xmtp/xmtp.dart' as xmtp;

@RoutePage()
class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _State();
}

class _State extends State<ChatListScreen> {
  late TextEditingController textController;
  late ChatService _service;
  // late xmtp.Client _client;
  // var conversations = useConversationList();

  int currentPageIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late final List<Widget> _widgetOptions = <Widget>[
    Chat(),
    // StreamBuilder(
    //     stream: _service.watchConversations(),
    //     builder: (context, snapshot) {
    //       print(snapshot.data);
    //       final conversations =
    //           snapshot.data.ifNull(() => const IListConst<Convo>([]));
    //       return ListView.separated(
    //         itemCount: conversations.length,
    //         itemBuilder: (context, index) {
    //           return ListTile(
    //             title: Text('111'),
    //           );
    //         },
    //         separatorBuilder: (context, _) => const Divider(),
    //       );
    //     }),
    Contacts(),
    Setting()
    // Text(
    //   'setting',
    //   style: optionStyle,
    // ),
  ];
  @override
  void initState() {
    super.initState();
    _service = context.read<ChatService>();
    textController = TextEditingController(text: '');
    print('11222');
    print(_service.readConversations());
    
    // getList();
    // listConversations();
    print("_service");
  }

  // Future listConversations() async {
  //   var conversations = await _client.listConversations();
  //   for (var convo in conversations) {
  //     debugPrint('Saying GM to ${convo.peer}');
  //     await _client.sendMessage(convo, 'gm');
  //   }
  //   return conversations;
  // }

  // Future<List<xmtp.Conversation>> fetchConversations() async {
  //   // await initializeXmtpClient(); // 确保客户端已初始化
  //   if (_client != null) {
  //     return await _client!.listConversations();
  //   } else {
  //     throw Exception('XMTP 客户端未初始化');
  //   }
  // }

  void _openChat(String topic) =>
      context.router.push(MessageRoute(topic: topic));

  void groupTalk() {}

  Future<void> _onNewChat() async {
    final recipient = await showDialog(
      context: context,
      builder: (context) => const NewChatDialog(),
    );
    if (recipient == null) return;
    final topic = await _service.newConversation(recipient);
    _openChat(topic);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedItemColor: Color.fromARGB(255, 63, 126, 249), // 选中项的颜色
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          currentIndex: currentPageIndex,
          items: [
            BottomNavigationBarItem(
              // selectedIcon: Icon(Icons.chat_bubble_rounded),
              icon: Icon(CupertinoIcons.chat_bubble_fill),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              // icon: Badge(child: Icon(Icons.notifications_sharp)),
              icon: Icon(CupertinoIcons.person_2_alt),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
        // appBar: AppBar(
        //     toolbarHeight: 150,

        //     // title: Text(
        //     //   'Chat',
        //     //   style: TextStyle(
        //     //       color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        //     // ),
        //     // actions: const [_PopMenu()],
        //     title: Container(
        //       height: 100,
        //       child: Stack(
        //         children: [
        //           Positioned(
        //               top: 13,
        //               left: 0,
        //               child: Container(
        //                 alignment: Alignment.center,
        //                 width: MediaQuery.sizeOf(context).width * 0.92,
        //                 child: Text(
        //                   'Chat',
        //                   style: TextStyle(fontWeight: FontWeight.bold),
        //                 ),
        //               )),
        //           Positioned(
        //               top: 0,
        //               right: 0,
        //               child: Container(
        //                 // height: 50,
        //                 child: IconButton(
        //                   icon: Icon(CupertinoIcons.add_circled),
        //                   onPressed: () {
        //                     groupTalk();
        //                   },
        //                 ),
        //               )),
        //           // Positioned(top: 0, right: 0, child: _PopMenu()),
        //           Positioned(
        //               top: 50,
        //               child: Container(
        //                 width: MediaQuery.sizeOf(context).width * 0.92,
        //                 child: CupertinoSearchTextField(
        //                   controller: textController,
        //                   placeholder: 'Search',
        //                 ),
        //               )),
        //         ],
        //       ),
        //     )),

        floatingActionButton: FloatingActionButton(
          onPressed: _onNewChat,
          foregroundColor: EthColors.mimiPink,
          child: const Icon(Icons.chat),
        ),

        body: _widgetOptions.elementAt(currentPageIndex),

        //原本的消息列表
        // body: RefreshableWidget(
        //   onRefresh: _service.refreshConversations,
        //   child: Container(
        //     child: StreamBuilder(
        //       stream: _service.watchConversations(),
        //       builder: (context, snapshot) {
        //         final conversations =
        //             snapshot.data.ifNull(() => const IListConst<Convo>([]));

        //         if (snapshot.hasError) {
        //           return RetryWidget(
        //             message: context.l10n.chatFailedToLoad,
        //             onRetry: _service.refreshConversations,
        //           );
        //         }

        //         if (conversations.isEmpty) {
        //           return _EmptyConversations(onNewChat: _onNewChat);
        //         }

        //         return ListView.separated(
        //           shrinkWrap: true,
        //           itemCount: conversations.length,
        //           separatorBuilder: (context, _) => const Divider(),
        //           itemBuilder: (context, index) {
        //             final conversation = conversations.elementAt(index);

        //             return ListTile(
        //               title: Text(
        //                 conversation.peer,
        //                 maxLines: 1,
        //                 overflow: TextOverflow.ellipsis,
        //                 style: const TextStyle(fontSize: 16),
        //               ),
        //               subtitle: Text(
        //                 context.elapsedTimeFormatted(conversation.lastOpenedAt),
        //               ),
        //               onTap: () => _openChat(conversation.topic),
        //               trailing: const Icon(Icons.chevron_right),
        //             );
        //           },
        //         );
        //       },
        //     ),
        //     // child: StreamBuilder(
        //     //   stream: _service.getMsgList(),
        //     //   builder: (context, snapshot) {
        //     //     final conversations =
        //     //         snapshot.data.ifNull(() => const IListConst<Convo>([]));
        //     //     return Container(
        //     //         width: 200,
        //     //         height: 900,
        //     //         child: ListView.separated(
        //     //             itemCount: conversations.length,
        //     //             separatorBuilder: (context, _) => const Divider(),
        //     //             itemBuilder: (context, snapshot) {
        //     //               return Text('111');
        //     //             }));
        //     //   },
        //     // ),
        //   ),
        // ),
      );
}

class _PopMenu extends StatelessWidget {
  const _PopMenu();

  @override
  Widget build(BuildContext context) => PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text(
              context.l10n.logout,
              style: const TextStyle(fontSize: 14),
            ),
            onTap: () => context.read<SessionCubit>().disconnect(),
          ),
        ],
      );
}

class _EmptyConversations extends StatelessWidget {
  const _EmptyConversations({
    required this.onNewChat,
  });

  final VoidCallback onNewChat;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.chatEmpty,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: onNewChat,
              child: Text(context.l10n.chatEmptyCTA),
            ),
            const SizedBox(height: kToolbarHeight),
          ],
        ),
      );
}
