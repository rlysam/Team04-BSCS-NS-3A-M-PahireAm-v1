part of 'pahiram_posts_cubit.dart';


@immutable
abstract class PahiramPostsState {
  const PahiramPostsState();
}

class PahiramPostsInitial extends PahiramPostsState {
  const PahiramPostsInitial();
}

class PahiramPostsLoading extends PahiramPostsState {
  const PahiramPostsLoading();
}

class PahiramPostsLoaded extends PahiramPostsState {
  final PostsData postsData;
  const PahiramPostsLoaded(this.postsData);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PahiramPostsLoaded && o.postsData == postsData;
  }

  @override
  int get hashCode => postsData.hashCode;
}

class PahiramPostsError extends PahiramPostsState {
  final String message;
  const PahiramPostsError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PahiramPostsError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

