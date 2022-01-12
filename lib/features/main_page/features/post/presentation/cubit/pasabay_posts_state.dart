part of 'pasabay_posts_cubit.dart';

@immutable
abstract class PasabayPostsState {
  const PasabayPostsState();
}

class PasabayPostsInitial extends PasabayPostsState {
  const PasabayPostsInitial();
}

class PasabayPostsLoading extends PasabayPostsState {
  const PasabayPostsLoading();
}

class PasabayPostsLoaded extends PasabayPostsState {
  final PostsData postsData;
  const PasabayPostsLoaded(this.postsData);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PasabayPostsLoaded && o.postsData == postsData;
  }

  @override
  int get hashCode => postsData.hashCode;
}

class PasabayPostsError extends PasabayPostsState {
  final String message;
  const PasabayPostsError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PasabayPostsError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

