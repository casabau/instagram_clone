import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> with SingleTickerProviderStateMixin {
  TabController tabController;
  CameraController cameraController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 1, length: 3, vsync: this);
    initCamera();
  }

  Future<void> initCamera() async {
    final List<CameraDescription> cameras = await availableCameras();
    final CameraDescription camera =
        cameras.firstWhere((CameraDescription element) => element.lensDirection == CameraLensDirection.back);
    final CameraController cameraController = CameraController(camera, ResolutionPreset.medium);
    await cameraController.initialize();

    setState(() {
      this.cameraController = cameraController;
    });
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo'),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 6,
            child: Expanded(
              child: Column(
                children: <Widget>[
                  if (cameraController != null)
                    Center(
                      child: AspectRatio(
                        aspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height,
                        child: CameraPreview(cameraController),
                      ),
                    ),
                  Flexible(
                    child: Container(
                      alignment: AlignmentDirectional.bottomStart,
                      child: IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () {

                        },
                      ),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: IconButton(
                      icon: Icon(Icons.flash_off),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              color: Colors.black,
              alignment: AlignmentDirectional.center,
              constraints: const BoxConstraints.expand(),
              child: Container(
                width: 96.0,
                height: 96.0,
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.black,
          child: TabBar(
              indicatorColor: Colors.transparent,
              controller: tabController,
              onTap: (int i) {},
              tabs: const <Widget>[
                Tab(
                  text: 'Library',
                ),
                Tab(
                  text: 'Photo',
                ),
                Tab(
                  text: 'Video',
                ),
              ]),
        ),
      ),
    );
  }
}
