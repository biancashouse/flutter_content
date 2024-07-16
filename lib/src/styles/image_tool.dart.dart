import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class ImageTool extends StatefulWidget {
  final TargetModel tc;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;

  const ImageTool({
    super.key,
    required this.tc,
    this.ancestorHScrollController,
    this.ancestorVScrollController,
  });

  @override
  State<ImageTool> createState() => _ImageToolState();
}

class _ImageToolState extends State<ImageTool> {
  // late GlobalKey _buttonGk;

  @override
  void initState() {
    // _buttonGk = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
      padding: const EdgeInsets.all(18.0),
      child: Container(color: Colors.blue[50]),
    );
  }

  // Widget _pickImageBtn(context) => SizedBox(
  //   height: 60,
  //   child: TextButton.icon(
  //     key: _buttonGk,
  //     onPressed: () async {
  //       if (kIsWeb) {
  //         FilePickerPopupMenu.pickImage(FileType.image, widget.tc, mounted: mounted,);
  //       } else {
  //         await Callout(
  //           cId: CAPI.PICK_IMAGE.feature(),
  //           targetGKF: () => _buttonGk,
  //           contents: ()=>FilePickerPopupMenu(
  //             tc:widget.tc,
  //           ),
  //           heightF:()=> kIsWeb ? 300 : 350,
  //           widthF:()=> 340,
  //           initialCalloutAlignment: Alignment.bottomCenter,
  //           initialTargetAlignment: Alignment.topCenter,
  //           barrierOpacity: .25,
  //           barrierHolePadding: 10,
  //           arrowType: ArrowType.THIN_REVERSED,
  //           arrowColor: Colors.red,
  //           barrierHasCircularHole: true,
  //           showCloseButton: true,
  //           separation: 30,
  //         ).show();
  //       }
  //     },
  //     label: Text('optional image here: tap to pick...', style: TextStyle(color: Colors.blue)),
  //     icon: Icon(Icons.image_outlined, size: 36, color: Colors.blue),
  //   ),
  // );
}
