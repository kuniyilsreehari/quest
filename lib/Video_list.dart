import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

List<String> listitem = [
  'Personal and Key Transferable\n Employment Skills and Knowledge',
  'Minerals and Energy Resources',
  'Magnetic Effects of Electric Current.',
  'Basic Arithmatics',
  'Reflection and Refraction.',
];

List<String> videoUrls = [
  'https://www.youtube.com/watch?v=9V15JSsBERo',
  'https://www.youtube.com/watch?v=9V15JSsBERo',
  'https://www.youtube.com/watch?v=9V15JSsBERo',
  'https://www.youtube.com/watch?v=9V15JSsBERo',
  'https://www.youtube.com/watch?v=9V15JSsBERo',
];

class Video_list extends StatefulWidget {
  const Video_list({Key? key}) : super(key: key);

  @override
  State<Video_list> createState() => _Video_listState();
}

class _Video_listState extends State<Video_list> {
  List<VideoPlayerController?> _videoControllers =
  List.generate(videoUrls.length, (_) => null);

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < videoUrls.length; i++) {
      _videoControllers[i] = VideoPlayerController.network(videoUrls[i])
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  void dispose() {
    for (var controller in _videoControllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(text: 'DETAILS'),
            Tab(text: 'ANNOUNCEMENT'),
            Tab(text: 'VIDEOS'),
            Tab(text: 'STUDY MATERIALS'),
          ]),
          title: Text("VIDEOS LIST"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Container(
              child: ListView.builder(
                itemCount: listitem.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunch(videoUrls[index])) {
                              await launch(videoUrls[index]);
                            } else {
                              print("Could not launch ${videoUrls[index]}");
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                _videoControllers[index]!.value.isInitialized
                                    ? AspectRatio(
                                  aspectRatio: _videoControllers[index]!
                                      .value
                                      .aspectRatio,
                                  child: VideoPlayer(_videoControllers[index]!),
                                )
                                    : Container(),
                                Icon(
                                  Icons.play_circle_filled,
                                  size: 48,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listitem[index],
                              style: TextStyle(
                                fontSize: 19,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "22 sep",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.lightGreen,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                              onPressed: () {},
                              child: Text('General Study'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: "Add next",
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
