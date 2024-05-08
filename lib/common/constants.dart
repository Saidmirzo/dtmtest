import 'package:dtmtest/common/res/assets.gen.dart';
import 'package:dtmtest/common/res/locale_keys.g.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/pages/web_admins.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/presentation/pages/web_advertising.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/pages/web_categories.dart';
import 'package:dtmtest/features/admin_panel/web_home/presentation/web_home.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/pages/web_quizes.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/presentation/tarifs.dart';
import 'package:dtmtest/features/admin_panel/web_users/presentation/pages/web_users.dart';
import 'package:easy_localization/easy_localization.dart';

List<String> adminMenu = [
  "Home",
  "Users",
  "Admins",
  "Categories",
  "Quizes",
  "Tarifs",
  "Advertising",
];
List<String> adminIcons = [
  Assets.icons.home.path,
  Assets.icons.person.path,
  Assets.icons.person.path,
  Assets.icons.categories.path,
  Assets.icons.quizes.path,
  Assets.icons.tarifs.path,
  Assets.icons.advertising.path,
];

getPage(int index) {
  switch (index) {
    case 0:
      return const WebHomePage();
    case 1:
      return const WebUsersPage();
    case 2:
      return const WebAdminsPage();
    case 3:
      return const WebCategoriesPage();
    case 4:
      return const WebQuizesPage();
    case 5:
      return const WebTarifsPage();
    case 6:
      return const WebAdvrtisingPage();
    default:
      return const WebHomePage();
  }
}

List<String> labels = [
  tr(LocaleKeys.home_home),
  tr(LocaleKeys.home_inbox),
  tr(LocaleKeys.home_menu),
  tr(LocaleKeys.home_account)
];
List<SvgGenImage> listIcons = [
  Assets.icons.home,
  Assets.icons.category,
  Assets.icons.history,
  Assets.icons.profile
];
String timeFunction() {
  int hour = DateTime.now().hour; // Soatni olish

  if (hour >= 22 || hour < 5) {
    return LocaleKeys.home_goodnight.tr(); // "Hayrli tun"
  } else if (hour < 11) {
    return LocaleKeys.home_goodmorning.tr(); // "Hayrli tong"
  } else if (hour < 18) {
    return LocaleKeys.home_goodafternoon.tr(); // "Hayrli kun"
  } else {
    return LocaleKeys.home_goodevening.tr(); // "Hayrli kech"
  }
}

String extractImageId(String url) {
  int startIndex = url.indexOf('/public/');
  int endIndex = url.lastIndexOf('.jpg');
  if (startIndex == -1 || endIndex == -1 || endIndex < startIndex) {
    return 'Invalid URL';
  }
  return url.substring(startIndex, endIndex);
}
