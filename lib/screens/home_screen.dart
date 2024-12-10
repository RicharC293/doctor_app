import 'package:doctor_app_template/main.dart';
import 'package:doctor_app_template/models/doctor_model.dart';
import 'package:doctor_app_template/models/medical_service_model.dart';
import 'package:doctor_app_template/notifier/theme_notifier.dart';
import 'package:doctor_app_template/screens/reservation_screen.dart';
import 'package:doctor_app_template/services/medical_services.dart';
import 'package:doctor_app_template/utils/colors.dart';
import 'package:doctor_app_template/widgets/doctor_card.dart';
import 'package:doctor_app_template/widgets/medical_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    context.read<ThemeNotifier>().initData();
  }

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
        actions: [
          // const CircleAvatar(
          //   backgroundColor: Colors.red,
          //   backgroundImage: AssetImage("assets/images/avatar.png"),
          // ),

          /// light_mode -> Icono de sol
          /// dark_mode -> Icono de luna
          IconButton(
              onPressed: () {
                context.read<ThemeNotifier>().toggleTheme();
              },
              icon: Selector<ThemeNotifier, bool>(
                  selector: (context, notifier) => notifier.isDark,

                  /// child -> Widget no cambia su estado
                  builder: (context, isDark, child) {
                    if (isDark) {
                      return const Icon(Icons.dark_mode);
                    }
                    return const Icon(Icons.light_mode);
                  })),
        ],
      ),
      drawer: const Drawer(),

      /// Consumer -> escuchar los cambios del ThemeNotifier
      /// Un widget que escucha los cambios de todo un notifier
      /// diferencia con el selector es que este escucha todo el notifier, mientras
      /// que el selector escucha una parte del notifier
      body: Consumer<ThemeNotifier>(builder: (context, notifier, child) {
        if (notifier.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(
          onRefresh: () async {
            await notifier.getServices();
          },
          child: ListView(
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
              TextField(
                decoration: const InputDecoration(
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
                onChanged: (value) {
                  notifier.filterDoctorsByName(value);
                },
              ),

              const SizedBox(height: 16),

              /// GridView -> Grid de elementos -> Scroll
              /// 2 columnas y 2 filas
              // GridView(
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 16,
              //     mainAxisSpacing: 16,
              //   ),
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   children: [
              //     MedicalCard(
              //       color: const Color(0xff7166F9),
              //       srcIcon: "assets/svg/diagnostic.svg",
              //       title: "Diagnostic",
              //       onTap: () {
              //         MedicalServices().getServices();
              //       },
              //     ),
              //     MedicalCard(
              //       color: const Color(0xffFF7854),
              //       srcIcon: "assets/svg/dental.svg",
              //       title: "Dental",
              //       onTap: () {},
              //     ),
              //     MedicalCard(
              //       color: const Color(0xffFEA725),
              //       srcIcon: "assets/svg/surgeon.svg",
              //       title: "Surgeon",
              //       onTap: () {},
              //     ),
              //     MedicalCard(
              //       color: const Color(0xff68EEBE),
              //       srcIcon: "assets/svg/medicines.svg",
              //       title: "Medicines",
              //       onTap: () {
              //         Navigator.pushNamed(context, ReservationScreen.routeName);
              //       },
              //     ),
              //   ],
              // ),

              /// FutureBuilder -> consumir un servicio
              // FutureBuilder(
              //   /// No es una buena práctica tener el servicio aquí
              //   future: MedicalServices().getServices(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const Center(child: CircularProgressIndicator());
              //     }
              //     if (snapshot.hasError) {
              //       return Text("Ha ocurrido un error: ${snapshot.error}");
              //     }
              //     final data = snapshot.data as List<MedicalServiceModel>;
              //     return GridView.builder(
              //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         crossAxisSpacing: 16,
              //         mainAxisSpacing: 16,
              //       ),
              //       shrinkWrap: true,
              //       physics: const NeverScrollableScrollPhysics(),
              //       itemBuilder: (context, index) {
              //         final service = data[index];
              //         return MedicalCard(
              //           color: HexColor(service.color),
              //           srcIcon: service.icon,
              //           title: service.name,
              //           onTap: () {},
              //         );
              //       },
              //       itemCount: data.length,
              //     );
              //   },
              // ),

              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final service = notifier.services[index];
                  return MedicalCard(
                    color: HexColor(service.color),
                    srcIcon: service.icon,
                    title: service.name,
                    onTap: () {},
                  );
                },
                itemCount: notifier.services.length,
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

              /// Lista de doctores
              const SizedBox(height: 16),
              const Text(
                "Top Doctors",
                style: TextStyle(
                  color: Color(0xff25282B),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final doctor = notifier.filteredDoctors[index];
                  return DoctorCard(
                    image: doctor.image,
                    name: doctor.name,
                    speciality: doctor.speciality,
                    medicalCenter: doctor.medicalCenter,
                    rating: doctor.rating,
                    onTap: () {
                      /// Se usa para pasar parámteros a la siguiente pantalla
                      Navigator.pushNamed(
                        context,
                        ReservationScreen.routeName,
                        arguments: {
                          "id": doctor.id,
                          "doctor": doctor.name,
                          "specialty": doctor.speciality,
                        },
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemCount: notifier.filteredDoctors.length,
              ),
            ],
          ),
        );
      }),
    );
  }
}
