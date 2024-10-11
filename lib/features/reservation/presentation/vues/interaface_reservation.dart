import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:karz/core/constants/colors.dart';
import 'package:karz/core/constants/dimensions.dart';
import 'package:karz/core/utilities/enum.dart';
import 'package:karz/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:karz/features/authentification/presentation/vues/home_page.dart';
import 'package:karz/features/parking/data/models/place_model.dart';
import 'package:karz/features/parking/presentation/app/bloc/parking_bloc.dart';
import 'package:karz/features/parking/presentation/app/controllers/parking_controller.dart';
import 'package:karz/features/reservation/data/models/reservation_model.dart';
import 'package:karz/features/reservation/presentation/app/bloc/bloc/reservation_bloc.dart';
import 'package:karz/features/reservation/presentation/app/bloc/controllers/reservation_controller.dart';

import '../../../../core/widgets/heading1.dart';
import '../../../../core/widgets/heading2.dart';
import '../../../../core/widgets/standard_text.dart';

class InterfaceReservation extends StatefulWidget {
  const InterfaceReservation({Key? key}) : super(key: key);

  @override
  State<InterfaceReservation> createState() => _InterfaceReservationState();
}

class _InterfaceReservationState extends State<InterfaceReservation> {
  UserController userController = Get.find();
  ReservationController reservationController = Get.find();
  ParkingController parkingController = Get.find();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Rx<TimeOfDay> startime = const TimeOfDay(hour: 0, minute: 0).obs;
  final TextEditingController _matricule = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _startTime = TextEditingController();
  final TextEditingController _endTime = TextEditingController();
  final RxBool _isEndTimeFieldEnabled = false.obs;
  final Rx<PlaceModel> _selectedPlace = PlaceModel.empty().obs;
  final _placeColors = {
    PlaceStatus.reserved: Colors.redAccent,
    PlaceStatus.free: Colors.green,
    PlaceStatus.occupied: Colors.deepOrange
  };

  @override
  void initState() {
    super.initState();
    context.read<ParkingBloc>().add(GetPlacesByParkingEvent(
      parkingId: parkingController.currentParking.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text(
          'Réserver une place',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Itim',
            color: primary,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ParkingBloc, ParkingState>(
        builder: (context, state) {
          if (state is PlaceLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PlacesLoadedState) {
            parkingController.places = state.places as List<PlaceModel>;

            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(
                    top: paddingH16,
                    left: paddingW16,
                    right: paddingW16
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Selectionez une place',
                      style: TextStyle(
                        fontSize: font24
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: paddingH10, horizontal: paddingW16),
                  sliver: SliverGrid.count(
                    mainAxisSpacing: paddingW10,
                    crossAxisSpacing: paddingH10,
                    crossAxisCount: 6,
                    children: List.generate(
                      parkingController.places.length, (index) {
                        PlaceModel place = parkingController.places[index];
                        return InkWell(
                          onTap: () {
                            if(place.status != PlaceStatus.free) {
                              Get.dialog(
                                barrierDismissible: false,
                                AlertDialog(
                                  title: Heading1(text: "Attention"),
                                  surfaceTintColor: Colors.white,
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateColor.resolveWith((states) => primary),
                                        padding: MaterialStateProperty.resolveWith((states) =>
                                          EdgeInsets.symmetric(
                                            horizontal: paddingW20,
                                            vertical: paddingH10
                                          )
                                        ),
                                        shape: MaterialStateProperty.resolveWith((states) =>
                                        RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius15)))
                                      )
                                    ),
                                      child: const Heading2(
                                        text: "OK",
                                        color: Colors.white,
                                      )
                                    )
                                  ],
                                  content: StandardText(text: "Cette place est déjà reservée", color: primary, fontSize: font14 + 2,),
                                )
                              );

                              return;
                            }

                            _selectedPlace.value = place;
                          },
                          child: Obx(() => Container(
                              decoration: BoxDecoration(
                                  color: place == _selectedPlace.value ? Colors.greenAccent : _placeColors[place.status]
                              ),
                              child: Center(
                                child:  Text(
                                  parkingController.places[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),
                              )
                          )),
                        );
                      } 
                    ),
                  )
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: paddingW16, vertical: paddingH20),
                  sliver: SliverToBoxAdapter(
                    child: SizedBox(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _matricule,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: 'Ex: 3434RC',
                                  labelText: "Numero d'immatriculation",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(radius15),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 5, //5
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(radius15),
                                    borderSide: const BorderSide(
                                      color: primary,
                                    ),
                                  ),
                                  suffix: const Icon(
                                    Icons.car_repair_outlined,
                                    color: secondary,
                                  )
                              ),
                              validator: (value) {
                                return value!.isEmpty ? "champ requis" : null;
                              },
                              onChanged: (value) {
                                _matricule.text = value;
                              },
                            ),
                            SizedBox(height: height16,),
                            TextFormField(
                              onTap: () {
                                _datePicker();
                              },
                              controller: _date,
                              readOnly: true,
                              decoration: InputDecoration(
                                  labelText: "Date de reservation",
                                  hintText: _date.text,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(radius15),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: (5), //5
                                    ),
                                  ),
                                  suffix: const Icon(
                                    Icons.calendar_month_outlined,
                                    color: secondary,
                                  )
                              ),
                              validator: (value) {
                                return value!.isEmpty ? "champ requis" : null;
                              },
                              onChanged: (value) {
                                _date.text = value;
                              },
                            ),
                            SizedBox(height: height16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: marginW16),
                                    child: TextFormField(
                                      onTap: () {
                                        _timePicker('start');
                                      },
                                      readOnly: true,
                                      controller: _startTime,
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                          hintText: 'Depart',
                                          labelText: "Heure de depart",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(radius15),
                                            borderSide: const BorderSide(
                                              color: primary,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(radius15),
                                            borderSide: const BorderSide(
                                              color: primary,
                                            ),
                                          ),
                                          suffix: const Icon(
                                            Icons.timer_outlined,
                                            color: secondary,
                                          )
                                      ),
                                      validator: (value) {
                                        return value!.isEmpty ? "champ requis" : null;
                                      },
                                      onChanged: (value) {
                                        _startTime.text = value;
                                      },
                                    )
                                  ),
                                ),
                                Expanded(
                                  child: Obx(() => TextFormField(
                                    onTap: () {
                                      _isEndTimeFieldEnabled.value ? _timePicker('end') : null;
                                    },
                                    readOnly: true,
                                    enabled: _isEndTimeFieldEnabled.value,
                                    controller: _endTime,
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                        hintText: 'Depart',
                                        labelText: "Heure de Fin",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(radius15),
                                          borderSide: const BorderSide(
                                            color: primary,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(radius15),
                                          borderSide: const BorderSide(
                                            color: primary,
                                          ),
                                        ),
                                        suffix: const Icon(
                                          Icons.timer_outlined,
                                          color: secondary,
                                        )
                                    ),
                                    validator: (value) {
                                      return value!.isEmpty ? "champ requis" : null;
                                    },
                                    onChanged: (value) {
                                      _startTime.text = value;
                                    },
                                  ))
                                )
                              ],
                            ),
                            SizedBox(height: height16,),
                            ListTile(
                              onTap: () => Get.bottomSheet(
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(radius30),
                                      topRight: Radius.circular(radius30)
                                    )
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        // onTap: () => Get.to(() => AddPaymentCardViewForm()),
                                        leading: const Icon(Icons.add_card, color: secondary),
                                        trailing: const Icon(Icons.arrow_forward_ios_outlined, color: secondary,),
                                        title: Text(
                                          "Ajouter une carte",
                                          softWrap: true,
                                          style: TextStyle(
                                              fontSize: font20,
                                              fontFamily: "itim"
                                          ),
                                        ),
                                      ),
                                      const Divider(),
                                      Expanded(
                                        child: ListView.separated(
                                          itemCount: 5,
                                          separatorBuilder: (_, index) => const Divider(),
                                          itemBuilder: (context, index) => Container(),
                                        )
                                      )
                                    ],
                                  )
                                )
                              ),
                              leading: const Icon(Icons.paid_outlined, color: secondary),
                              trailing: const Icon(Icons.arrow_drop_down_circle_outlined, color: secondary,),
                              title: Text(
                                "Mode de paiement",
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: font20,
                                  fontFamily: "itim"
                                ),
                              ),
                              subtitle: Text(
                                "Cliquer pour choisir ou ajouter un mode de paiment",
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: font14,
                                  fontFamily: "itim",
                                  color: Colors.grey[600]
                                ),
                              )
                            )
                          ]
                        ),
                      )
                    )
                  ),
                ),
              ]
            );
          }
          return const Center(
            child: Text("Une erreur s'est produite"),
          );
        },
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if(_formKey.currentState!.validate()) {
            _selectedPlace.value = _selectedPlace.value.copyWith(status: PlaceStatus.reserved);

            context.read<ParkingBloc>().add(UpdatePlaceEvent(parkingId: parkingController.currentParking.id, place: _selectedPlace.value));

            reservationController.currentVehicule = reservationController.currentVehicule.copyWith(matricule: _matricule.text);
            reservationController.currentReservation = ReservationModel(
                id: '',
                conductorId: userController.currentConductor.uid,
                conductorName: userController.currentConductor.name,
                conductorPhone: userController.currentConductor.phone,
                vehicule: reservationController.currentVehicule,
                place: _selectedPlace.value,
                parkingId: parkingController.currentParking.id,
                parkingAddress: parkingController.currentParking.address.fullAddress,
                date: _date.text,
                startTime: _startTime.text,
                endTime: _endTime.text,
                status: ReservationStatus.pending
            );
            debugPrint("===== Current reservation: ${reservationController.currentReservation}");
            context.read<ReservationBloc>().add(CreateReservationEvent(
              reservation: reservationController.currentReservation
            ));

            // clear text field
            _matricule.clear();
            _date.clear();
            _startTime.clear();
            _endTime.clear();
          }
        },
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: paddingH10),
          margin: EdgeInsets.symmetric(vertical: marginH16, horizontal: marginW16),
          decoration: BoxDecoration(
            color: secondary,
            borderRadius: BorderRadius.circular(radius15)
          ),
          child: BlocConsumer<ReservationBloc, ReservationState>(
            listener: (_, state) {
              if (state is ReservationCreated) {
                Get.offAll(() => const HomePage());
              }
            },
            builder: (context, state) {
              if (state is ReservationLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white,),
                );
              }

              return Text(
                'Reserver',
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  fontSize: font24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'itim',
                  color: Colors.white
                ),
              );
          })
        ),
      ),
    );
  }

  void _datePicker() async {
    DateTime? picker = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), 
      lastDate: DateTime(DateTime.now().year, DateTime.now().month + 1)
    );

    if(picker != null) {
      setState(() {
        _date.text = picker.toString().split(' ')[0];
        debugPrint("======= START TIME: ${_date.text}");
      });
    }
  }

  void _timePicker(String time) async {
    TimeOfDay? timePicker = await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now()
    );

    if(timePicker != null) {
      if(time == 'start') {
        setState(() {
          _startTime.text = timePicker.format(context);
          _isEndTimeFieldEnabled.value = _startTime.text.isNotEmpty;
          debugPrint("======= START TIME: ${_startTime.text}");
          return;
        });
      }

      setState(() {
        _endTime.text = timePicker.format(context);
        debugPrint("======= START TIME: ${_endTime.text}");
        return;
      });
    }
  }
}
