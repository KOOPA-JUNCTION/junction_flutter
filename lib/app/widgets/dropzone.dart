import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class DropZoneWidget extends StatefulWidget {
  final ValueChanged<dynamic> onDroppedFile;
  final int ant = 0;

  const DropZoneWidget({Key? key, required this.onDroppedFile})
      : super(key: key);
  @override
  _DropZoneWidgetState createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropZoneWidget> {
  late DropzoneViewController controller;
  bool highlight = false;

  @override
  Widget build(BuildContext context) {
    return buildDecoration(
        child: Stack(
      children: [
        DropzoneView(
          onCreated: (controller) => this.controller = controller,
          onDropMultiple: uploadedsFile,
          onHover: () => setState(() => highlight = true),
          onLeave: () => setState(() => highlight = false),
        ),
      ],
    ));
  }

  Future uploadedsFile(List<dynamic>? event) async {
    int count = 0;
    int len = event!.length;
    for (int i = 0; i < len; i++) {
      final e = event[i];
      final data = await controller.getFileData(e);
      final type = await controller.getFileMIME(e);
      final name = e.name;
      count++;
      widget.onDroppedFile({
        "name": name,
        "data": data,
        "type": type,
        "index": count,
        "len": len,
      });
    }

    setState(() {
      highlight = false;
    });
  }

  Widget buildDecoration({required Widget child}) {
    final colorBackground = highlight ? Colors.red : Colors.black;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: colorBackground,
        child: child,
      ),
    );
  }
}
