import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pahiream_frontend/features/main_page/features/post/data/repositories/post_posts_repository.dart';
import 'package:pahiream_frontend/features/main_page/features/post/presentation/cubit/pahiram_posts_cubit.dart';
import 'package:pahiream_frontend/features/main_page/features/post/presentation/cubit/pasabay_posts_cubit.dart';
import 'package:pahiream_frontend/features/main_page/features/switch_button/presentation/cubit/switch_button_cubit.dart';
import 'package:pahiream_frontend/features/main_page/screen/landing_screen_desktop.dart';
import 'package:pahiream_frontend/features/main_page/screen/landing_screen_tablet.dart';
import 'package:pahiream_frontend/utils/Responsive/responsive_layout.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SwitchButtonCubit(),
        ),
        BlocProvider(
          create: (_) => PahiramPostsCubit(FakeWeatherRepository()),
        ),
        BlocProvider(
          create: (_) => PasabayPostsCubit(FakeWeatherRepository()),
        ),
      ],
      child: buildLandingPage(),
    );
  }

  ResponsiveLayout buildLandingPage() {
    return const ResponsiveLayout(
      desktopBody: DesktopLanding(),
      tabletBody: TabletLanding(),
    );
  }
}
