import 'package:doctor_app_template/widgets/medical_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_open_sharp), // SVG - menu.svg
          onPressed: () {
            // Abrir el drawer
            _scaffoldKey.currentState?.openDrawer();
            // _scaffoldKey.currentState?.openEndDrawer();
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.red,
              backgroundImage: AssetImage("assets/images/avatar.png"),
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      // endDrawer: const Drawer(),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          /// RichText -> Texto con diferentes estilos
          /// InlineSpan -> TextSpan
          RichText(
            text: const TextSpan(
              text: "Find ",
              style: TextStyle(
                color: Color(0xff25282B),
                fontSize: 34,
                fontWeight: FontWeight.w300,
              ),
              children: [
                TextSpan(
                  text: "your doctor",
                  style: TextStyle(
                    color: Color(0xffA0A4A8),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// Input de búsqueda -> TextField -> Ingresar texto
          const TextField(
            decoration: InputDecoration(
              hintText: "Search doctor, medicines etc",
              hintStyle: TextStyle(
                color: Color(0xffCACCCF),
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Color(0xfff6f6f6),
              suffixIcon: Icon(
                Icons.search,
                color: Color(0xff25282B),
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// GridView -> Grid de elementos -> Scroll
          /// 2 columnas y 2 filas
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              MedicalCard(
                color: const Color(0xff7166F9),
                srcIcon: "assets/svg/diagnostic.svg",
                title: "Diagnostic",
                onTap: (){},
              ),
              MedicalCard(
                color: const Color(0xff7166F9),
                srcIcon: "assets/svg/diagnostic.svg",
                title: "Diagnostic",
                onTap: (){},
              ),
              MedicalCard(
                color: const Color(0xff7166F9),
                srcIcon: "assets/svg/diagnostic.svg",
                title: "Diagnostic",
                onTap: (){},
              ),
              MedicalCard(
                color: const Color(0xff7166F9),
                srcIcon: "assets/svg/diagnostic.svg",
                title: "Diagnostic",
                onTap: (){},
              ),
            ],
          ),

          // GridView.count(
          //   crossAxisCount: 2,
          //   shrinkWrap: true,
          //   children: [
          //     Text("1"),
          //     Text("1"),
          //     Text("1"),
          //     Text("1"),
          //   ],
          // )
        ],
      ),
    );
  }
}
