import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:videoapplication/core/error/exception.dart';
import 'package:videoapplication/src/video/video.dart';

import '../api/video_repository.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoRepository _videoRepository = VideoRepository();

  VideoBloc() : super(VideoInitial()) {
    on<VideoEvent>(_getVideoHandeller);
  }

  Future<void> _getVideoHandeller(
    VideoEvent event,
    Emitter<VideoState> emit,
  ) async {
    try {
      emit(GettingVideo());

      final result = await _videoRepository.fetchVideoList();

      emit(VideoLoaded(result.videoList));
      if (result.error != null) {
        emit(VideoError(result.error));
      }
    } on APIException {
      emit(const VideoError("Data not found "));
    }
  }
}
