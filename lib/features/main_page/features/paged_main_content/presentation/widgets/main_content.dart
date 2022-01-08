// TODO MAIN CONTENT Data
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
import 'package:provider/provider.dart';

class MainContent extends StatefulWidget {
  final bool isPasabay;
  const MainContent({Key? key, required this.isPasabay}) : super(key: key);

  @override
  _MainContentState createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // get bulk of data na... then pass nalang
      create: (_) => PagerCubit(),
      child: ListView(
        children: [
          PagerWidget(),
          widget.isPasabay ? MgaPasabay() : MgaPahiram(),
          PagerWidget(),
        ],
      ),
    );
  }
}

class MgaPahiram extends StatefulWidget {
  const MgaPahiram({Key? key}) : super(key: key);

  @override
  _MgaPahiramState createState() => _MgaPahiramState();
}

class _MgaPahiramState extends State<MgaPasabay> {

  @override
  Widget build(BuildContext context) {
    int currentPage = context.read<PagerCubit>().state;
    final pahiramData = context.read<PahiramPostsCubit>();
    pahiramData.get10PostsPahiram(currentPage);

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
        if (state is PahiramPostsInitial) {
          return buildInitialInput();
        } else if (state is PahiramPostsLoading) {
          return buildLoading();
        } else if (state is PahiramPostsLoaded) {
          return buildCardWithData(state.postsData);
        } else {
          return buildInitialInput();
        }
      },
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
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
      children: [
        Expanded(
          child: ListView.builder(
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


class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitPageNumber(context, value),
        textInputAction: TextInputAction.search,
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Enter Page Number",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitPageNumber(BuildContext context, String pahinaNumero) {
    final postsDataCubit1 = context.read<PasabayPostsCubit>();
    postsDataCubit1.get10PostsPasabay(int.parse(pahinaNumero));
    final postsDataCubit = context.read<PahiramPostsCubit>();
    postsDataCubit.get10PostsPahiram(int.parse(pahinaNumero));
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
    final pasabayData = context.read<PasabayPostsCubit>();
    pasabayData.get10PostsPasabay(currentPage);

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
          return buildCardWithData(state.postsData);
        } else {
          return buildInitialInput();
        }
      },
    );
  }


  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }


  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
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
      children: [
        Expanded(
          child: ListView.builder(
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

// TODO implement blocConsumer Pasabay widget
    // if else
