import 'package:app_login_screen/color.dart';
import 'package:app_login_screen/map/locations.dart';
import 'package:app_login_screen/wind/home_page.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {

  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  List<Marker> allMarkers = [];

  final CustomInfoWindowController _customInfoWindowController =
  CustomInfoWindowController();

  static const _initialCameraPosition = CameraPosition(
      target: LatLng(11.0168, 76.9558),
      zoom: 11.0);

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    for (var element in placesOfInterest) {
      allMarkers.add(Marker(
        markerId: MarkerId(element.name),
        draggable: false,
        position: element.coordinates,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0, 4.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 120.0,
                      width: 105.0,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(element.thumbnail),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 3.0),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8.0),
                          Text(
                            element.name,
                            style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'LibreBold'),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            element.designation,
                            style: const TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Comforta'),
                          ),
                          const SizedBox(height: 3.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 5.0),
                              Text(
                                element.rating,
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Comforta'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 7.0),
                          const Divider(thickness: 1.0, height: 1.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const CircleAvatar(
                                  foregroundImage: NetworkImage(
                                      'https://e7.pngegg.com/pngimages/915/706/png-clipart-blue-call-icon-dialer-android-google-play-telephone-phone-blue-text.png'),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const CircleAvatar(
                                  foregroundImage: NetworkImage(
                                      'https://news.wirefly.com/sites/phonedog.com/files/styles/blog_entry/public/android-messages-icon.jpg?itok=pVmsm2T3'),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const CircleAvatar(
                                  foregroundImage: NetworkImage(
                                      'https://w7.pngwing.com/pngs/672/164/png-transparent-whatsapp-icon-whatsapp-logo-computer-icons-zubees-halal-foods-whatsapp-text-circle-unified-payments-interface-thumbnail.png'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            element.coordinates,
          );
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Employee Locations'),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.offAll(() => const HomePage());
          },
          child: const Icon(
              Icons.arrow_back,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 50.0,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              onTap: (position) {
                _customInfoWindowController.hideInfoWindow!();
              },
              onCameraMove: (position) {
                _customInfoWindowController.onCameraMove!();
              },
              onMapCreated: (GoogleMapController controller) async {
                _customInfoWindowController.googleMapController = controller;
              },
              initialCameraPosition: _initialCameraPosition,
              markers: Set.from(allMarkers),
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 135,
            width: 300,
            offset: 50,
          ),
        ],
      ),
    );
  }
}
