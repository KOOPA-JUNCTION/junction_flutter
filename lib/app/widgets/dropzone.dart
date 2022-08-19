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
          onDrop: uploadFile,
          //onDropMultiple: uploadedsFile,
          onHover: () => setState(() => highlight = true),
          onLeave: () => setState(() => highlight = false),
        ),
      ],
    ));
  }

  Future uploadFile(dynamic event) async {
    final data = await controller.getFileData(event);
    final type = await controller.getFileMIME(event);
    final name = event.name;
    widget.onDroppedFile({
      "name": name,
      "data": data,
      "type": type,
    });
    setState(() {
      highlight = false;
    });
  }

  Widget buildDecoration({required Widget child}) {
    final colorBackground = highlight ? Colors.red : Colors.white;
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
