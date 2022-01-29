import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pahiream_frontend/features/main_page/features/paged_main_content/presentation/cubit/pager_cubit.dart';
import 'package:pahiream_frontend/features/main_page/features/paged_main_content/presentation/widgets/pager.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/models/post.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/models/posts_data.dart';
import 'package:pahiream_frontend/features/main_page/features/post/presentation/cubit/pahiram_posts_cubit.dart';
import 'package:pahiream_frontend/features/profile/presentation/widgets/cubit/user_inv_pager_cubit.dart';
import 'package:pahiream_frontend/features/profile/presentation/widgets/my_post_widget.dart';

// ! PAHIRAM POST
class CurrentUsersPosts extends StatefulWidget {
  const CurrentUsersPosts({Key? key}) : super(key: key);

  @override
  _CurrentUsersPostsState createState() => _CurrentUsersPostsState();
}

class _CurrentUsersPostsState extends State<CurrentUsersPosts> {
  @override
  Widget build(BuildContext context) {
    int currentPage = context.read<InventoryPagerCubit>().state;
    var pahiramData = context.read<PahiramPostsCubit>();

    return BlocConsumer<InventoryPagerCubit, int>(
      listener: (context, state) {},
      builder: (context, pageNum) {
        pahiramData.get10PostsPahiram(pageNum);

        return BlocConsumer<PahiramPostsCubit, PahiramPostsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is PahiramPostsLoading) {
              return buildLoading();
            } else if (state is PahiramPostsLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                //   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                //     PagerWidget(),
                //   ]),
                  buildCardWithData(state.postsData),
                //   SizedBox(
                //     height: 20,
                //   ),
                //   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                //     PagerWidget(),
                //   ]),
                ],
              );
            } else {
              return buildLoading();
            }
          },
        );
      },
    );
  }

  Widget buildLoading() {
    return const Center(
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildCardWithData(PostsData postsData) {
    var map = postsData.toMap();
    var sam = map['posts'];

    List<Post> batchOfPosts = [];
    Post onePost;

    sam.forEach((post) {
      onePost = Post.fromMap(post);
      batchOfPosts.add(onePost);
    });

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: batchOfPosts.length,
        itemBuilder: (context, index) {
          var singlePost = batchOfPosts[index];
          return MyPost(data: singlePost);
        },
      ),
    );
  }
}
