import 'package:flutter/material.dart';

class CustomStreamBuilder<T> extends StatelessWidget {
  final Widget Function(T) loaderWidget;
  final Stream<T> stream;
  const CustomStreamBuilder(
      {Key key, @required this.loaderWidget, @required this.stream})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasData) {
          return loaderWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildError(snapshot);
        }
        return _buildCircularProgressIndicator();
      },
    );
  }

  Center _buildError(AsyncSnapshot<T> snapshot) =>
      Center(child: Text(snapshot.error.toString()));

  Center _buildCircularProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
