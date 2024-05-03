import 'package:dtmtest/common/res/assets.gen.dart';
import 'package:dtmtest/common/res/locale_keys.g.dart';
import 'package:dtmtest/features/admin_panel/web_admins/presentation/web_admins.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/presentation/pages/web_advertising.dart';
import 'package:dtmtest/features/admin_panel/web_categories/presentation/web_categories.dart';
import 'package:dtmtest/features/admin_panel/web_home/presentation/web_home.dart';
import 'package:dtmtest/features/admin_panel/web_quizes/presentation/web_quizes.dart';
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
  tr(LocaleKeys.home),
  tr(LocaleKeys.inbox),
  tr(LocaleKeys.menu),
  tr(LocaleKeys.account)
];
List<SvgGenImage> listIcons = [
  Assets.icons.home,
  Assets.icons.category,
  Assets.icons.history,
  Assets.icons.profile
];
String timeFunction() {
  int dateTime = DateTime.now().hour;
  if (dateTime <= 9) {
    return "Hayrli tong";
  } else if (dateTime <= 17) {
    return "Hayrli kun";
  } else if (dateTime <= 22) {
    return "Hayrli kech";
  } else if (dateTime <= 4 || dateTime <= 24) {
    return "Hayrli tun";
  }
  return "Hayrli kun";
}
