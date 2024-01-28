import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mfm/mfm.dart';
import 'package:misskey_dart/misskey_dart.dart';

class MisskeyNoteMedia extends StatelessWidget {
  final List<DriveFile> files;

  const MisskeyNoteMedia({
    super.key,
    required this.files,
  });

  @override
  Widget build(BuildContext context) {
    if (files.isEmpty) {
      return const SizedBox.shrink();
    }

    if (files.length == 1) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: _InFile(
          file: files[0],
          fit: BoxFit.fitWidth,
          width: double.infinity,
        ),
      );
    }
    if (files.length == 2) {
      return Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: _InFile(
                file: files[0],
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: _InFile(
                file: files[1],
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
          )
        ],
      );
    }

    if (files.length == 3) {
      return Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: _InFile(
                file: files[0],
                fit: BoxFit.fitHeight,
                width: double.infinity,
                height: 400,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: _InFile(
                      file: files[1], height: 195, fit: BoxFit.fitHeight),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: _InFile(
                      file: files[2], height: 195, fit: BoxFit.fitHeight),
                ),
              ],
            ),
          )
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:
                    _InFile(file: files[0], height: 150, fit: BoxFit.fitWidth),
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 10)),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:
                    _InFile(file: files[1], height: 150, fit: BoxFit.fitWidth),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:
                    _InFile(file: files[2], height: 150, fit: BoxFit.fitWidth),
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 10)),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child:
                    _InFile(file: files[3], height: 150, fit: BoxFit.fitWidth),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _InFile extends StatefulWidget {
  final DriveFile file;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const _InFile({
    required this.file,
    this.width,
    this.height,
    this.fit,
  });

  @override
  State<StatefulWidget> createState() => _InFileState();
}

class _InFileState extends State<_InFile> {
  late bool isSensitiveOpen = false;

  @override
  Widget build(BuildContext context) {
    final url = widget.file.thumbnailUrl ?? widget.file.url;

    if (widget.file.isSensitive && !isSensitiveOpen) {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: ColorFiltered(
                colorFilter:
                    const ColorFilter.mode(Colors.black45, BlendMode.multiply),
                child: Image.network(
                  url,
                  width: widget.width,
                  height: widget.height,
                  fit: widget.fit,
                ),
              )),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Mfm(
                      style: TextStyle(color: Colors.white),
                      mfmText:
                          "<b>内容の警告: センシティブな内容</b>\n\n作成者が、このツイートをセンシティブな内容として設定しました。"),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSensitiveOpen = true;
                      });
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    child: const Text(
                      "表示する",
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Image.network(
      url,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
    );
  }
}
