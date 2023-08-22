import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ceremony_screen/screens/ceremony_screen.dart';
import '../../constants.dart';
import '../data_provider/all_ceremonies_api_client.dart';
import '../repository/all_ceremonies_repository.dart';
import '../widgets/function_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route = "/homeScreen";

  final AllCeremoniesRepository allCeremoniesRepository =
      const AllCeremoniesRepository(
    allCeremoniesAPIClient: AllCeremoniesAPIClient(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Functions",
          style: TextStyle(
            fontFamily: GoogleFonts.merienda().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: const SizedBox.shrink(),
        leadingWidth: 0.0,
        primary: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: defaultPadding,
            left: defaultPadding,
            right: defaultPadding,
          ),
          child: StreamBuilder(
            stream: allCeremoniesRepository.fetchAllCeremonies(),
            builder: (context, allCeremoniesSnapshot) {
              if (allCeremoniesSnapshot.connectionState ==
                  ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (allCeremoniesSnapshot.hasError) {
                return const Center(
                  child: Text("Error: Couldn't get all ceremonies!"),
                );
              }

              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: defaultPadding),
                itemCount: allCeremoniesSnapshot.data?.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: defaultPadding),
                  child: FunctionCard(
                    thumbnail: allCeremoniesSnapshot.data![index].thumbnail,
                    name: allCeremoniesSnapshot.data![index].name,
                    onTap: () {
                      Navigator.pushNamed(context, CeremonyScreen.route);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
