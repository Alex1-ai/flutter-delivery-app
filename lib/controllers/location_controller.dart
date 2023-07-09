import 'dart:convert';

import 'package:food_delivery/data/respository/location_repo.dart';
import 'package:food_delivery/models/address_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/response_model.dart';

class LocationController extends GetxController implements GetxService {
  LocationRepo locationRepo;
  LocationController({required this.locationRepo});
  bool _loading = false;
  late Position _position;
  late Position _pickPosition;
  Placemark _placemark = Placemark();
  Placemark _pickPlacemark = Placemark();
  Placemark get placemark => _placemark;
  Placemark get pickPlacemark => _pickPlacemark;

  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;
  late List<AddressModel> _allAddressList;
  List<AddressModel> get allAddressList => _allAddressList;
  final List<String> _addressTypeList = ["home", "office", "others"];
  List<String> get addressTypeList => _addressTypeList;
  int _addressTypeIndex = 0;

  int get addressTypeIndex => _addressTypeIndex;
  late Map<String, dynamic> _getAddress;
  Map get getAddress => _getAddress;

  late GoogleMapController _mapController;
  GoogleMapController get mapController=>_mapController;
  bool _updateAddressData = true;
  bool _changeAddress = true;

  bool get loading => _loading;
  Position get position => _position;
  Position get pickPosition => _pickPosition;

  void setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }

  void updatePosition(CameraPosition position, bool fromAddress) async {
    if (_updateAddressData) {
      _loading = true;
      update();
      try {
        if (fromAddress) {
          _position = Position(
            longitude: position.target.longitude,
            latitude: position.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        } else {
          _pickPosition = Position(
            longitude: position.target.longitude,
            latitude: position.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        }
        // talking with the server
        if (_changeAddress) {
          String _address = await getAddressfromGeocode(
            LatLng(
              position.target.latitude,
              position.target.longitude,
            ),
          );
          fromAddress
              ? _placemark = Placemark(name: _address)
              : _pickPlacemark = Placemark(name: _address);
          //print(_placemark.country);
        }
      } catch (e) {
        print(e);
      }
    }
  }

// this is where i need to make changes for allowing 
// users to manually input there address/
  Future<String> getAddressfromGeocode(LatLng latlng) async {
    String _address = "Unknow Location Found";
    Response response = await locationRepo.getAddressfromGeocode(latlng);
    if (response.body["status"] == 'OK') {
      _address = response.body["results"][0]['formatted_address'].toString();
      print("printing address: " + _address);
      print(response.body);
      print(response);
    } else {
      print("Error getting the google api");
      print(response.body);
      print(response);
    }
    update();
    return _address;
  }

  AddressModel getUserAddress() {
    late AddressModel _addressModel;
    /*
    converting string to map using jsonDecode
*/

    _getAddress = jsonDecode(locationRepo.getUserAddress());
    try {
      _addressModel =
          AddressModel.fromJson(jsonDecode(locationRepo.getUserAddress()));
    } catch (e) {
      print(e);
    }
    return _addressModel;
  }

  void setAddressTypeIndex(int index) {
    _addressTypeIndex = index;
    update();
  }


  Future<ResponseModel>addAddress(AddressModel addressModel)async{
    _loading = true;
    update();
    Response response = await locationRepo.addAddress(addressModel);
    ResponseModel responseModel;
    if(response.statusCode==200){
      await getAddressList();
      String message = response.body["Message"];
      responseModel = ResponseModel(true, message);
      await saveUserAddress(addressModel);

    }else{
      print("could not save te address");
      responseModel = ResponseModel(false,response.statusText!);
    }
    update();
    return responseModel ;
  }

  Future<void> getAddressList()async{
    Response response = await locationRepo.getAllAddress();
    if(response.statusCode == 200){
      _addressList = [];
      _allAddressList = [];
      response.body.forEach((address){
        _addressList.add(AddressModel.fromJson(address));
        _allAddressList.add(AddressModel.fromJson(address));
      });
    

    }else{
      _addressList = [];
      _allAddressList = [];
    }
    update();
  }


  Future<bool> saveUserAddress(AddressModel addressModel)async{
    String userAddress = jsonEncode(addressModel.toJson());
    return await locationRepo.saveUserAddress(userAddress);

  }

  void clearADdressList(){
    _addressList = [];
    _allAddressList=[];
    update();
  }

}
