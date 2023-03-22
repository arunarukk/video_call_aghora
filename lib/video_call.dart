import 'dart:convert';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class VideoCall extends StatefulWidget {
  String channelName = "video_agora";

  VideoCall({required this.channelName});
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  late final AgoraClient _client;
  bool _loading = true;
  String tempToken = "";

  @override
  void initState() {
    getToken();

    super.initState();
  }

  Future<void> getToken() async {
    String link =
        "https://agora-node-tokenserver-1.arunkumarkk158.repl.co/access_token?channelName=${widget.channelName}";

    Response _response = await get(Uri.parse(link));
    Map data = jsonDecode(_response.body);
    print(data['token']);
    setState(() {
      tempToken = data["token"];
    });
    _client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: "997271ab098a4f1e9635712fb54f7889",
        tempToken: tempToken,
        channelName: widget.channelName,
      ),
      enabledPermission: [Permission.camera, Permission.microphone],
      agoraEventHandlers: AgoraRtcEventHandlers(
          leaveChannel: (state) => Navigator.pop(context)),
    );
    initAgora();
    Future.delayed(Duration(seconds: 1)).then(
      (value) => setState(() => _loading = false),
    );
  }

  void initAgora() async {
    await _client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  AgoraVideoViewer(
                    client: _client,
                  ),
                  AgoraVideoButtons(client: _client)
                ],
              ),
      ),
    );
    
  }
}
