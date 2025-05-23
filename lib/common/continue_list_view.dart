import 'package:flutter/material.dart';

class ContinueListView extends StatelessWidget {

  const ContinueListView({
    required this.separatorBuilder, required this.itemBuilder, required this.itemCount, required this.onLast, super.key,
  });
  final Widget Function(BuildContext, int) separatorBuilder;
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final Function onLast;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index == itemCount) {
          WidgetsBinding.instance.addPostFrameCallback((time) {
            onLast();
          });
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          return itemBuilder(context, index);
        }
      },
      separatorBuilder: separatorBuilder,
      itemCount: itemCount == 0 ? 0 : itemCount + 1,
    );
  }
}
