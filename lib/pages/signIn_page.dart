import 'package:auto_size_text/auto_size_text.dart';
import 'package:electric_tile_demo/pages/home_page.dart';
import 'package:electric_tile_demo/utils/constants/colors.dart';
import 'package:electric_tile_demo/utils/constants/svg_icons.dart';
import 'package:electric_tile_demo/utils/constants/text_styles.dart';
import 'package:electric_tile_demo/utils/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: _headerSignIn(),
              ),
              Expanded(
                flex: 7,
                child: _bodySignIn1(),
              ),
              Expanded(
                flex: 5,
                child: _bodySignIn2(),
              ),
              Expanded(
                flex: 2,
                child: _footerSignIn(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _bodySignIn1 extends StatelessWidget {
  const _bodySignIn1();

  @override
  Widget build(BuildContext context) {
    double gapBetweenColumnElements = MediaQuery.sizeOf(context).height * 0.03;
    return Column(
      children: [
        MyButton(
          onPressed: () {},
          label: "Registro con Google",
          icon: SvgIcons.googleLogo,
        ),
        Gap(gapBetweenColumnElements),
        MyButton(
          onPressed: () {},
          label: "Registro con Facebook",
          fontSize: 17,
          icon: SvgIcons.facebookLogo,
        ),
        Gap(gapBetweenColumnElements),
        MyButton(
          onPressed: () {},
          label: "Registro con apple",
          icon: SvgIcons.appleLogo,
        ),
        Gap(gapBetweenColumnElements),
        Row(
          children: [
            // Divider antes del texto, ocupa la mitad del espacio
            const Expanded(
              child: Divider(
                color: Colors.grey, // Puedes cambiar el color del divider
                thickness: 1, // Puedes cambiar el grosor
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0), // Añadir espacio alrededor del texto
              child: Text(
                "o",
                style: iTextStyles().smallText.copyWith(color: Colors.grey),
              ),
            ),
            // Divider después del texto, ocupa la otra mitad del espacio
            const Expanded(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _bodySignIn2 extends StatelessWidget {
  const _bodySignIn2();

  @override
  Widget build(BuildContext context) {
    double gapBetweenColumnElements = MediaQuery.sizeOf(context).height * 0.03;
    return Column(
      children: [
        MyButton(
          onPressed: () => Get.to(() => const HomePage()),
          label: "Crea una cuenta",
          backgroundColor: iColors.primary,
          foregroundcolor: Colors.white,
        ),
        Gap(gapBetweenColumnElements),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AutoSizeText(
              "¿Ya tienes una cuenta?",
              style: iTextStyles().subHeading1,
            ),
          ],
        ),
        Gap(gapBetweenColumnElements * 0.3),
        MyButton(onPressed: () {}, label: "Iniciar sesión")
      ],
    );
  }
}

class _footerSignIn extends StatelessWidget {
  const _footerSignIn();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "Al registrarte, aceptas los ",
            style: iTextStyles(foreGroundColor: Colors.grey).smallText),
        TextSpan(text: "Términos de Servicio ", style: iTextStyles().smallText),
        TextSpan(
            text: "y la ",
            style: iTextStyles(foreGroundColor: Colors.grey).smallText),
        TextSpan(
            text: "Política de Privacidad ", style: iTextStyles().smallText),
        TextSpan(
            text: "incluido el ",
            style: iTextStyles(foreGroundColor: Colors.grey).smallText),
        TextSpan(text: "Uso de Cookies.", style: iTextStyles().smallText),
      ])),
      // color: const Color.fromARGB(255, 255, 7, 81),
    );
  }
}

class _headerSignIn extends StatelessWidget {
  const _headerSignIn();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            style: iTextStyles().heading2,
            minFontSize: 38,
            "Explora",
            maxLines: 1,
          ),
          AutoSizeText(
            style: iTextStyles().heading1,
            "Únete a ET Manager",
            minFontSize: 14,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
