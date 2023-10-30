part of 'video_bloc.dart';

@immutable
sealed class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class GetVideoList extends VideoEvent {}
