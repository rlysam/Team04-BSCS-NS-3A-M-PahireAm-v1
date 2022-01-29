import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pahiream_frontend/features/main_page/features/paged_main_content/presentation/cubit/pager_cubit.dart';
import 'package:pahiream_frontend/features/main_page/features/paged_main_content/presentation/widgets/pager.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/models/post.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/models/posts_data.dart';
import 'package:pahiream_frontend/features/main_page/features/post/presentation/cubit/pahiram_posts_cubit.dart';
import 'package:pahiream_frontend/features/main_page/features/post/presentation/cubit/pasabay_posts_cubit.dart';
import 'package:pahiream_frontend/features/main_page/features/post/presentation/widgets/post_widget.dart';
import 'package:pahiream_frontend/features/main_page/features/switch_button/presentation/cubit/switch_button_cubit.dart';

class MainContent extends StatefulWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchButtonCubit, bool>(
      builder: (context, isPasabay) {
        return BlocProvider(
          // get bulk of data na... then pass nalang
          create: (_) => PagerCubit(),
          child: SizedBox(
            child: ListView(
              shrinkWrap: true,
              children: [
                //   Note: Pag nag iba yung isPasabay State, matic mag re-reload na...
                isPasabay ? MgaPasabay() : MgaPahiram(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MgaPahiram extends StatefulWidget {
  const MgaPahiram({Key? key}) : super(key: key);

  @override
  _MgaPahiramState createState() => _MgaPahiramState();
}

class _MgaPahiramState extends State<MgaPahiram> {
  @override
  Widget build(BuildContext context) {
    int currentPage = context.read<PagerCubit>().state;
    var pahiramData = context.read<PahiramPostsCubit>();

    return BlocConsumer<PagerCubit, int>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, pageNum) {
        pahiramData.get10PostsPahiram(pageNum);

        return BlocConsumer<PahiramPostsCubit, PahiramPostsState>(
          listener: (context, state) {
            // if (state is PostsDataError) {
            //   Scaffold.of(context).showSnackBar(
            //     SnackBar(
            //       content: Text(state.message),
            //     ),
            //   );
            // }
          },
          builder: (context, state) {
            // if (state is PahiramPostsInitial) {
            //   return buildInitialInput();
            // }
            if (state is PahiramPostsLoading) {
              return buildLoading();
            } else if (state is PahiramPostsLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    PagerWidget(),
                  ]),
                  buildCardWithData(state.postsData),
                  const SizedBox( height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    PagerWidget(),
                  ]),
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

//   Widget buildInitialInput() {
//     return const Center(child: Text('initial value '),);
//   }

  Widget buildLoading() {
    return const Center(
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildCardWithData(PostsData postsData) {
// posts data ay binigay dito, tapos..
    var map = postsData.toMap();
    var sam = map['posts']; //LIST of posts

// Gagawin natin List of Post para...
    List<Post> batchOfPosts = [];
    Post onePost;

    sam.forEach((post) {
      onePost = Post.fromMap(post); //post single
      batchOfPosts.add(onePost);
    });

    // mag generate ng ListView.builder...

    return ListView(
      shrinkWrap: true,
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 5 / 4.3,
                crossAxisSpacing: 18,
                mainAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: batchOfPosts.length,
            itemBuilder: (context, index) {
              return PostWidget(data: batchOfPosts[index]);
            },
          ),
        ),
        // CityInputField()
      ],
    );
  }
}

class MgaPasabay extends StatefulWidget {
  const MgaPasabay({Key? key}) : super(key: key);

  @override
  State<MgaPasabay> createState() => _MgaPasabayState();
}

class _MgaPasabayState extends State<MgaPasabay> {
  @override
  Widget build(BuildContext context) {
    int currentPage = context.read<PagerCubit>().state;
    var pasabayData = context.read<PasabayPostsCubit>();

    return BlocConsumer<PagerCubit, int>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, pageNum) {
    pasabayData.get10PostsPasabay(pageNum);

        return BlocConsumer<PasabayPostsCubit, PasabayPostsState>(
          listener: (context, state) {
            // if (state is PostsDataError) {
            //   Scaffold.of(context).showSnackBar(
            //     SnackBar(
            //       content: Text(state.message),
            //     ),
            //   );
            // }
          },
          builder: (context, state) {
            if (state is PasabayPostsInitial) {
              return buildInitialInput();
            } else if (state is PasabayPostsLoading) {
              return buildLoading();
            } else if (state is PasabayPostsLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    PagerWidget(),
                  ]),
                  buildCardWithData(state.postsData),
                  const SizedBox( height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    PagerWidget(),
                  ]),
                ],
              );
            } else {
              return buildInitialInput();
            }
          },
        );
      },
    );
  }

  Widget buildInitialInput() {
    return const Center( child: Text('Initial Value bobo'),);
  }

  Widget buildLoading() {
    return const Center( child: CircularProgressIndicator());
  }

  Widget buildCardWithData(PostsData postsData) {
// posts data ay binigay dito, tapos..
    var map = postsData.toMap();
    var sam = map['posts']; //LIST of posts

// Gagawin natin List of Post para...
    List<Post> batchOfPosts = [];
    Post onePost;

    sam.forEach((post) {
      onePost = Post.fromMap(post); //post single
      batchOfPosts.add(onePost);
    });

    return ListView(
      shrinkWrap: true,
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 5 / 4.3,
                crossAxisSpacing: 18,
                mainAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: batchOfPosts.length,
            itemBuilder: (context, index) {
              return PostWidget(data: batchOfPosts[index]);
            },
          ),
        ),
        // CityInputField()
      ],
    );
  }
}
