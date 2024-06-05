import 'package:auto_route/annotations.dart';
import 'package:dtmtest/common/components/custom_appbar.dart';
import 'package:dtmtest/common/costomaizable.dart';
import 'package:dtmtest/common/res/res.dart';
import 'package:dtmtest/features/mobile/tests/presentation/widget/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

@RoutePage()
class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppGradient.backgroundGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          text: "Biz haqimizda",
        ),
        body: ThemesBackgroundContainer(
          color: const Color.fromRGBO(255, 255, 255, 1),
          child: Markdown(
            padding: const EdgeInsets.symmetric(horizontal: 15)
                .copyWith(top: 30, bottom: 50),
            physics: const BouncingScrollPhysics(),
            data: '''

"Bil Dung" ilovasi — bu foydalanuvchilarga turli fanlardan onlayn testlar ishlash va ularning natijalarini kuzatib borish imkoniyatini beruvchi mobil dastur. Ushbu ilova o‘quvchilar va talabalarga turli fanlar bo‘yicha bilimlarini sinovdan o‘tkazish va o‘z ustida ishlash imkoniyatini taqdim etadi. Dastur yordamida foydalanuvchilar o‘z bilimlarini muntazam ravishda tekshirib borishlari va natijalarini yaxshilash yo‘llarini topishlari mumkin.

**Asosiy xususiyatlar:**

- **Turli fanlar bo‘yicha testlar:** Matematika, fizika, kimyo, biologiya va boshqa ko‘plab fanlardan keng qamrovli testlar mavjud.
- **Natijalar tahlili:** Har bir testdan so‘ng foydalanuvchilarga ularning natijalarini tahlil qilish va qayerda yaxshilash kerakligini ko‘rsatuvchi batafsil hisobotlar taqdim etiladi.
- **Foydalanuvchi do‘stona interfeys:** Ilova oson navigatsiya va yoqimli dizayn bilan jihozlangan, bu esa foydalanuvchilarga dastur orqali oson harakatlanish imkonini beradi.

**Biz haqimizda:**

"Bil Dung" ilovasi "Simpl Solution Team" tomonidan ishlab chiqilgan bo‘lib, bizning jamoamiz ta'limiy texnologiyalar sohasida sifatli va innovatsion yechimlar yaratishga intiladi.

"Simpl Solution Team" jamoasi sifatli ta'limiy mahsulotlar yaratish orqali ta'lim sohasida o‘zgarishlar kiritishni maqsad qilgan. Bizning asosiy maqsadimiz foydalanuvchilarimizga eng yaxshi ta'limiy tajribani taqdim etish va ularning o‘z bilimlarini rivojlantirishlariga ko‘maklashishdir.

Bizning ilovamiz sizga o‘zingizni sinab ko‘rish va o‘qish jarayonida qo‘l keladigan asosiy vosita bo‘lishiga umid qilamiz. "Bil Dung" bilan o‘z bilimingizni yangi bosqichga ko‘tarishingiz mumkin!

**Dasturchilar:**
1. Usmonov Akramjon;
2. Bahromov Saidmirzo;
3. Botiraliyev Baxtiyor;

**UX/UI:**
1. Abdurasulova Shahriniso;
''',
          ),
        ),
      ),
    );
  }
}
