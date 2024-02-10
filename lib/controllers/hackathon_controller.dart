import 'package:get/get.dart';
import '../models/hackathons_model.dart';


class HackathonController extends GetxController {
  final hackathons = <Hackathon>[].obs;

  @override
  void onInit() {
    fetchHackathons();
    super.onInit();
  }

  void fetchHackathons() async {
    try {
      final hackathonsList = await Hackathon.fetchHackathons();
      if (hackathonsList.isNotEmpty) {
        hackathons.assignAll(hackathonsList);
      }
    } catch (e) {
      print(e);
    }
  }

  void fetchHackathon(int id) async {
    try {
      final hackathon = await Hackathon.fetchHackathon(id);
      print(hackathon.name);
    } catch (e) {
      print(e);
    }
  }
}