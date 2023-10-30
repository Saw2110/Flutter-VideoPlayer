part of 'video_bloc.dart';

@immutable
sealed class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

final class VideoInitial extends VideoState {}

final class GettingVideo extends VideoState {}

final class VideoLoaded extends VideoState {
  const VideoLoaded(this.videoList);

  final List<VideoDataModel> videoList;
}

final class VideoError extends VideoState {
  const VideoError(this.message);
  final String? message;
}
