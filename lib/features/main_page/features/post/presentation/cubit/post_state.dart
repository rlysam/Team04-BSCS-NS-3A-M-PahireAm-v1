part of 'post_cubit.dart';

@immutable
abstract class PostState {
  const PostState();
}

class PostInitial extends PostState {
  const PostInitial();
}

class PostLoading extends PostState {
  const PostLoading();
}

class PostLoaded extends PostState {
  final Post post;

  const PostLoaded(this.post);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PostLoaded && o.post== post;
  }

  @override
  int get hashCode => post.hashCode;

}

class PostError extends PostState {
  final String message;
  const PostError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PostError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
