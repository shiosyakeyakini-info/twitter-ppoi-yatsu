import 'package:flutter/widgets.dart';
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
      final url = files[0].thumbnailUrl ?? files[0].url;
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          url,
          fit: BoxFit.fitWidth,
          width: double.infinity,
        ),
      );
    }
    if (files.length == 2) {
      final url1 = files[0].thumbnailUrl ?? files[0].url;
      final url2 = files[1].thumbnailUrl ?? files[1].url;
      return Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                url1,
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                url2,
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
          )
        ],
      );
    }

    if (files.length == 3) {
      final url1 = files[0].thumbnailUrl ?? files[0].url;
      final url2 = files[1].thumbnailUrl ?? files[1].url;
      final url3 = files[2].thumbnailUrl ?? files[2].url;
      return Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                url1,
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
          ),
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(url2,
                    width: double.infinity, height: 150, fit: BoxFit.fitWidth),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(url3,
                    width: double.infinity, height: 150, fit: BoxFit.fitWidth),
              ),
            ],
          )
        ],
      );
    }

    final url1 = files[0].thumbnailUrl ?? files[0].url;
    final url2 = files[1].thumbnailUrl ?? files[1].url;
    final url3 = files[2].thumbnailUrl ?? files[2].url;
    final url4 = files[3].thumbnailUrl ?? files[3].url;

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
                child: Image.network(url1, height: 150, fit: BoxFit.fitWidth),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(url2, height: 150, fit: BoxFit.fitWidth),
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
                child: Image.network(url3, height: 150, fit: BoxFit.fitWidth),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(url4, height: 150, fit: BoxFit.fitWidth),
              ),
            ),
          ],
        )
      ],
    );
  }
}
