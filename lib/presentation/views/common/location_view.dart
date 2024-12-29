import 'package:carting/assets/assets/icons.dart';
import 'package:carting/presentation/views/common/app_lat_long.dart';
import 'package:carting/presentation/views/common/clusterized_icon_painter.dart';
import 'package:carting/presentation/views/common/location_service.dart';
import 'package:carting/presentation/views/common/map_point.dart';
import 'package:carting/utils/log_service.dart';

import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:carting/assets/colors/colors.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/widgets/w_button.dart';

class LocationView extends StatefulWidget {
  const LocationView({
    super.key,
    required this.onTap,
    this.isOne = false,
    this.point1,
    this.point2,
    required this.isFirst,
  });
  final Function(MapPoint? point) onTap;
  final bool isOne;
  final MapPoint? point1;
  final MapPoint? point2;
  final bool isFirst;

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  late TextEditingController controllerLat;
  late TextEditingController controllerLong;
  late YandexMapController mapController;
  List<MapPoint> list = [];

  CameraPosition? _userLocation;
  CameraPosition? _position;

  String _address = 'Manzil aniqlanmoqda...';

  /// Значение текущего масштаба карты
  var _mapZoom = 0.0;

  @override
  void initState() {
    getMerk();
    controllerLat =
        TextEditingController(text: widget.point1?.name ?? "Nomalum");
    controllerLong =
        TextEditingController(text: widget.point2?.name ?? "Nomalum");

    super.initState();
    AndroidYandexMap.useAndroidViewSurface = true;
    _initPermission().ignore();
  }

  getMerk() {
    if (widget.point1 != null) {
      Log.i('Kirdik');
      list.add(widget.point1!);
      setState(() {});
    }
  }

  /// Метод, который включает слой местоположения пользователя на карте
  /// Выполняется проверка на доступ к местоположению, в случае отсутствия
  /// разрешения - выводит сообщение
  Future<void> _initLocationLayer() async {
    final locationPermissionIsGranted =
        await Permission.location.request().isGranted;

    if (locationPermissionIsGranted) {
      await mapController.toggleUserLayer(visible: true);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Нет доступа к местоположению пользователя'),
          ),
        );
      });
    }
  }

  /// Метод для получения коллекции кластеризованных маркеров
  ClusterizedPlacemarkCollection _getClusterizedCollection({
    required List<PlacemarkMapObject> placemarks,
  }) {
    return ClusterizedPlacemarkCollection(
      mapId: const MapObjectId('clusterized-1'),
      placemarks: placemarks,
      radius: 50,
      minZoom: 15,
      onClusterAdded: (self, cluster) async {
        return cluster.copyWith(
          appearance: cluster.appearance.copyWith(
            opacity: 1.0,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromBytes(
                  await ClusterIconPainter(cluster.size).getClusterIconBytes(),
                ),
              ),
            ),
          ),
        );
      },
      onClusterTap: (self, cluster) async {
        await mapController.moveCamera(
          animation:
              const MapAnimation(type: MapAnimationType.linear, duration: 0.3),
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: cluster.placemarks.first.point,
              zoom: _mapZoom + 1,
            ),
          ),
        );
      },
    );
  }

  /// Метод для генерации объектов маркеров для отображения на карте
  List<PlacemarkMapObject> _getPlacemarkObjects(BuildContext context) {
    return list
        .map(
          (point) => PlacemarkMapObject(
            mapId: MapObjectId('MapObject $point'),
            point: Point(latitude: point.latitude, longitude: point.longitude),
            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  'assets/images/location.png',
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  Future<String> getPlaceMarkFromYandex(double lat, double lon) async {
    try {
      final resultWithSession = await YandexSearch.searchByPoint(
        point: Point(latitude: lat, longitude: lon),
        searchOptions: const SearchOptions(
          searchType: SearchType.geo,
          geometry: false,
        ),
      );

      final results = await resultWithSession.$2;
      if (results.items != null) {
        if (results.items!.isNotEmpty) {
          final address =
              results.items!.first.toponymMetadata?.address.formattedAddress ??
                  'Unknown location';
          return address;
        }
      }
      return 'No address found';
    } catch (e) {
      print('Error getting address: $e');
      return 'Error getting address';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -2),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 5,
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFFB7BFC6),
              ),
            ),
            const SizedBox(height: 16),
            // From Location
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: scaffoldSecondaryBackground,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: controllerLat,
                    decoration: const InputDecoration(
                      labelText: 'Qayerdan',
                      hintText: 'Toshkent, Yakkasaroy tumani',
                      border: InputBorder.none,
                    ),
                  ),
                  if (!widget.isOne) ...[
                    const Divider(height: 1),
                    // To Location
                    TextField(
                      controller: controllerLong,
                      decoration: const InputDecoration(
                        labelText: 'Qayerga',
                        hintText: 'Manzilni tanlang',
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // Confirm button
            SafeArea(
              top: false,
              child: WButton(
                onTap: () {
                  widget.onTap(MapPoint(
                    name: _address,
                    latitude: _position?.target.latitude ?? 0,
                    longitude: _position?.target.longitude ?? 0,
                  ));
                },
                text: AppLocalizations.of(context)!.confirm,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _initLocationLayer();
          await _fetchCurrentLocation();
        },
        backgroundColor: white,
        shape: const CircleBorder(),
        child: AppIcons.gps.svg(),
      ),
      body: Stack(
        children: <Widget>[
          // Google Map
          YandexMap(
            onMapCreated: (controller) async {
              mapController = controller;
              mapController.moveCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: Point(
                    latitude: const TashketnLoaction().lat,
                    longitude: const TashketnLoaction().long,
                  ),
                ),
              ));
              await _initLocationLayer();
            },
            onCameraPositionChanged: (cameraPosition, reason, finished) async {
              print("Map tapped at: $cameraPosition");
              if (finished) {
                _address = await getPlaceMarkFromYandex(
                  cameraPosition.target.latitude,
                  cameraPosition.target.longitude,
                );
                _position = cameraPosition;
                if (widget.isFirst) {
                  controllerLat.text = _address;
                } else {
                  controllerLong.text = _address;
                }
                print("Map tapped at: $_address");
              }
              setState(() {
                _mapZoom = cameraPosition.zoom;
              });
            },
            mapObjects: [
              _getClusterizedCollection(
                placemarks: _getPlacemarkObjects(context),
              ),
            ],
            onUserLocationAdded: (view) async {
              // получаем местоположение пользователя
              _userLocation = await mapController.getUserCameraPosition();
              // если местоположение найдено, центрируем карту относительно этой точки
              if (_userLocation != null) {
                await mapController.moveCamera(
                  CameraUpdate.newCameraPosition(
                    _userLocation!.copyWith(zoom: 15),
                  ),
                  animation: const MapAnimation(
                    type: MapAnimationType.linear,
                    duration: 0.3,
                  ),
                );
              }
              // меняем внешний вид маркера - делаем его непрозрачным
              return view.copyWith(
                arrow: view.arrow.copyWith(
                  opacity: 1,
                  icon: PlacemarkIcon.single(
                    PlacemarkIconStyle(
                      image: BitmapDescriptor.fromAssetImage(
                        'assets/images/location_current.png',
                      ),
                      scale: .2,
                    ),
                  ),
                ),
                pin: view.pin.copyWith(
                  opacity: 1,
                  icon: PlacemarkIcon.single(
                    PlacemarkIconStyle(
                      image: BitmapDescriptor.fromAssetImage(
                        'assets/images/location_current.png',
                      ),
                      scale: .2,
                    ),
                  ),
                ),
              );
            },
            onMapTap: (Point point) async {
              mapController.moveCamera(
                CameraUpdate.newCameraPosition(CameraPosition(target: point)),
                animation: const MapAnimation(duration: 1.0),
              );
            },
          ),
          // Location marker in the center
          Center(
            child: CircleAvatar(
              backgroundColor: white,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: AppIcons.mapPin.svg(),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CircleAvatar(
                backgroundColor: white,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
          // Positioned(
          //   bottom: 16,
          //   right: 16,
          //   child: CircleAvatar(
          //     backgroundColor: white,
          //     child: IconButton(
          //       onPressed: () {
          //         Navigator.pop(context);
          //       },
          //       icon: AppIcons.gps.svg(),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  /// Проверка разрешений на доступ к геопозиции пользователя
  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  /// Получение текущей геопозиции пользователя
  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = TashketnLoaction();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    _moveToCurrentLocation(location);
  }

  /// Метод для показа текущей позиции
  Future<void> _moveToCurrentLocation(
    AppLatLong appLatLong,
  ) async {
    mapController.moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 15,
        ),
      ),
    );
  }
}
