import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ulysse_app/core/constants/colors.dart';
import 'package:ulysse_app/core/constants/dimensions.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:ulysse_app/features/parking/data/models/place_model.dart';
import 'package:ulysse_app/features/parking/presentation/app/bloc/parking_bloc.dart';
import 'package:ulysse_app/features/parking/presentation/app/controllers/parking_controller.dart';
import 'package:ulysse_app/features/reservation/data/models/reservation_model.dart';
import 'package:ulysse_app/features/reservation/data/models/vehicule_model.dart';
import 'package:ulysse_app/features/reservation/presentation/app/bloc/controllers/reservation_controller.dart';

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
  final TextEditingController _duration = TextEditingController();
  final RxBool _isEndTimeFieldEnabled = false.obs;

  @override
  void initState() {
    super.initState();
    // context.read<ParkingBloc>().add(GetPlacesByParkingEvent(
    //   parkingId: parkingController.currentParking.id));
  }

  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();

    return Scaffold(
      appBar: AppBar(
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
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: paddingH16, horizontal: paddingW16),
            sliver: SliverGrid.count(
              mainAxisSpacing: paddingW10,
              crossAxisSpacing: paddingH10,
              crossAxisCount: 6,
              children: List.generate(
                30, (index) => InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.redAccent
                    ),
                    child: Center(
                      child:  Text(
                        'A${index+1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    )
                  ),
                )),
            )
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: paddingW16, vertical: paddingH20),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                        SizedBox(height: height24,),
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
                        SizedBox(height: height24,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: marginW16),
                                child: TextFormField(
                                  onTap: () {
                                    _timePicker();
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
                                  _isEndTimeFieldEnabled.value ? _timePicker() : null;
                                },
                                readOnly: true,
                                enabled: _startTime.text.isNotEmpty,
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
                      ]
                  ),
                )
              )
            ),
          ),
        ]
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          if(_formKey.currentState!.validate()) {
            final endTimeHour = startime.value.hour + int.parse(_duration.text);
            // startime.text is like: 12:30 AM
            // First, split by " "
            // Then split by :
            // Then add the duration
            // convert _startTime into a DateTime variable
            final startDateTime = DateTime.parse(_startTime.text);
            // Add duration to the new startTime
            final endTime = startDateTime.add(Duration(hours: int.parse(_duration.text))).toString();
            debugPrint("======= End time: $endTime");
            reservationController.currentReservation = ReservationModel(
                id: '',
                conductorId: userController.currentUser.uid,
                conductorName: userController.currentUser.name,
                conductorPhone: userController.currentUser.phone,
                //TODO: (Need to pass correct vehicule model)
                vehicule: VehiculeModel.empty(),
                place: '',
                parkingId: parkingController.currentParking.id,
                parkingAddress: parkingController.currentParking.address.fullAddress,
                date: _date.text,
                startTime: _startTime.text,
                endTime: '${endTimeHour}hh:${startime.value.minute}m',
                status: ReservationStatus.pending
            );
            debugPrint("===== Current reservation: ${reservationController.currentReservation}");
            // context.read<ReservationBloc>().add(CreateReservationEvent(
            //   reservation: reservation));
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
          child: Text(
            'Reserver',
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(
                fontSize: font24,
                fontWeight: FontWeight.bold,
                fontFamily: 'itim',
                color: Colors.white
            ),
          ),
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

  void _timePicker() async {
    TimeOfDay? timePicker = await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now()
    );

    if(timePicker != null) {
      startime.value = timePicker;
      setState(() {
        _startTime.text = timePicker.format(context);
        debugPrint("======= START TIME: ${_startTime.text}");
      });
    }
  }
}
