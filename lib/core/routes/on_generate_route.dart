import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_pro/views/tools/Terminology/pageOne.dart';
import '../../views/explore/components/Questions/Nursing/Nursing CBT Questions/Nursing_CBT_Questions.dart';
import '../../views/explore/components/Questions/Nursing/Nursing Interview Questions/Nursing_Interview_Questions.dart';
import '../../views/explore/components/Questions/Nursing/Nursing NCLEX Questions/Nursing_Nclex_Questions.dart';
import '../../views/explore/components/Questions/Nursing/Nursing Prometric Questions/Nursing_Prometric_Questions.dart';
import '../../views/explore/components/Questions/Questions_MainScreenClass.dart';
import '../../views/home/post_page/components/translate/main.dart';
import '../../views/tools/ChatRooms/ChatRooms.dart';
import '../../views/tools/MedicalCalculators/MedicalCalcMainClass.dart';
import '../../views/tools/Terminology/Terminology_MainScreenClass.dart';

import '../../views/tools/notes/main.dart';
import '../models/author.dart';
import '../../views/explore/all_authors_page.dart';
import '../../views/home/post_page/components/view_post_image_full_screen.dart';
import '../../views/settings/information_page.dart';

import '../../views/auth/forgot_password_page.dart';
import '../../views/auth/login_animation.dart';
import '../../views/auth/login_intro_page.dart';
import '../../views/auth/login_page.dart';
import '../../views/auth/signup_page.dart';
import '../../views/entrypoint/entrypoint.dart';
import '../../views/entrypoint/loading_app_page.dart';
import '../../views/explore/author_page.dart';
import '../../views/explore/category_page.dart';
import '../../views/explore/search_page.dart';
import '../../views/explore/tag_posts_page.dart';
import '../../views/home/notification_page/notification_page.dart';
import '../../views/home/post_page/comment_page.dart';
import '../../views/home/post_page/post_page.dart';
import '../../views/onboarding/select_language_theme_page.dart';
import '../models/article.dart';
import '../models/post_tag.dart';
import 'app_routes.dart';
import 'unknown_page.dart';

class RouteGenerator {

  static Route? onGenerate(RouteSettings settings) {
    final route = settings.name;
    final args = settings.arguments;

    switch (route) {
      case AppRoutes.initial:
        return CupertinoPageRoute(builder: (_) => const LoadingAppPage());

      //      Added Routes       //
      case AppRoutes.medicalcalc:
        return CupertinoPageRoute(builder: (_) => const MedicalCalcClass());


      case AppRoutes.notes:
        return CupertinoPageRoute(builder: (_) => const MyNoteApp());

      case AppRoutes.translate:
        return CupertinoPageRoute(builder: (_) => TranslatorApp());

      case AppRoutes.chatrooms:
        return CupertinoPageRoute(builder: (_) => ChatRooms());

      case AppRoutes.terminology:
        return CupertinoPageRoute(builder: (_) => TerminologyMainClass());


      case AppRoutes.questions:
        return CupertinoPageRoute(builder: (_) => QuestionsMainScreen());

      case AppRoutes.nursingprometrikquestions:
        return CupertinoPageRoute(builder: (_) => PrometricNursingQuestions());

      case AppRoutes.nursingnclexquestions:
        return CupertinoPageRoute(builder: (_) => NCLEXNursingQuestions());

      case AppRoutes.nursingcbtquestions:
        return CupertinoPageRoute(builder: (_) => CBTNursingQuestions());

      case AppRoutes.nursinginterviewquestions:
        return CupertinoPageRoute(builder: (_) => InterviewNursingQuestions());

      case AppRoutes.contact:
        return CupertinoPageRoute(builder: (_) => const ContactPage());


      case AppRoutes.pageOneMedicalTerms:
        return CupertinoPageRoute(builder: (_) => TerminologyPage());
      case AppRoutes.pageTwoMedicalTerms:
        return CupertinoPageRoute(builder: (_) => const ContactPage());
      case AppRoutes.pageThreeMedicalTerms:
        return CupertinoPageRoute(builder: (_) => const ContactPage());
      case AppRoutes.pageFourMedicalTerms:
        return CupertinoPageRoute(builder: (_) => const ContactPage());
      case AppRoutes.pageFiveMedicalTerms:
        return CupertinoPageRoute(builder: (_) => const ContactPage());
      case AppRoutes.pageSixMedicalTerms:
        return CupertinoPageRoute(builder: (_) => const ContactPage());
      case AppRoutes.pageSevenMedicalTerms:
        return CupertinoPageRoute(builder: (_) => const ContactPage());
      case AppRoutes.pageEightMedicalTerms:
        return CupertinoPageRoute(builder: (_) => const ContactPage());


    //      //      //      //      //      //      //      //      //

      case AppRoutes.loadingApp:
        return CupertinoPageRoute(builder: (_) => const LoadingAppPage());

      case AppRoutes.selectThemeAndLang:
        return CupertinoPageRoute(
            builder: (_) => const SelectLanguageAndThemePage());

      case AppRoutes.entryPoint:
        return CupertinoPageRoute(builder: (_) => const EntryPointUI());

      case AppRoutes.login:
        return CupertinoPageRoute(builder: (_) => const LoginPage());

      case AppRoutes.loginAnimation:
        return CupertinoPageRoute(builder: (_) => const LoggingInAnimation());

      case AppRoutes.loginIntro:
        return CupertinoPageRoute(builder: (_) => const LoginIntroPage());

      case AppRoutes.signup:
        return CupertinoPageRoute(builder: (_) => const SignUpPage());

      case AppRoutes.forgotPass:
        return CupertinoPageRoute(builder: (_) => const ForgotPasswordPage());

      case AppRoutes.search:
        return CupertinoPageRoute(builder: (_) => const SearchPage());

      case AppRoutes.notification:
        return CupertinoPageRoute(builder: (_) => const NotificationPage());

      case AppRoutes.post:
        if (args is ArticleModel) {
          return CupertinoPageRoute(builder: (_) => PostPage(article: args));
        } else {
          return errorRoute();
        }

      case AppRoutes.comment:
        if (args is ArticleModel) {
          return CupertinoPageRoute(builder: (_) => CommentPage(article: args));
        } else {
          return errorRoute();
        }

      case AppRoutes.category:
        if (args is CategoryPageArguments) {
          return CupertinoPageRoute(
              builder: (_) => CategoryPage(arguments: args));
        } else {
          return errorRoute();
        }

      case AppRoutes.tag:
        if (args is PostTag) {
          return CupertinoPageRoute(builder: (_) => TagPage(tag: args));
        } else {
          return errorRoute();
        }

      case AppRoutes.authorPage:
        if (args is AuthorData) {
          return CupertinoPageRoute(
              builder: (_) => AuthorPostPage(author: args));
        } else {
          return errorRoute();
        }

      case AppRoutes.contact:
        return CupertinoPageRoute(builder: (_) => const ContactPage());

      case AppRoutes.viewImageFullScreen:
        if (args is String) {
          return CupertinoPageRoute(
              builder: (_) => ViewImageFullScreen(url: args));
        } else {
          return errorRoute();
        }

      case AppRoutes.allAuthors:
        return CupertinoPageRoute(builder: (_) => const AllAuthorsPage());

      default:
        return errorRoute();
    }
  }

  static Route? errorRoute() =>
      CupertinoPageRoute(builder: (_) => const UnknownPage());

}
