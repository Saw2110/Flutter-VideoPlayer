import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:videoapplication/src/video/video.dart';

List<SingleChildWidget> blocList = [
  BlocProvider<VideoBloc>(create: (BuildContext context) => VideoBloc()),
];
