import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/core/constants/colors.dart';
import 'package:ulysse_app/core/constants/dimensions.dart';
import 'package:ulysse_app/core/utilities/enum.dart';
import 'package:ulysse_app/features/authentification/presentation/app/controller/user_controller.dart';
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
  final TextEditingController _duration = TextEditingController();

  @override
  void initState() {
    super.initState();
    // context.read<ParkingBloc>().add(GetPlacesByParkingEvent(parkingId: parkingId));
  }

  @override
  Widget build(BuildContext context) {
    int largeurEcran = MediaQuery.of(context).size.width.floor();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text(
          'Réserver ma place',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Italianno',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: paddingH16, horizontal: paddingW16),
            sliver: SliverGrid.count(
              crossAxisCount: 4,
              children: List.generate(
                10, (index) => InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(paddingW10),
                    decoration: const BoxDecoration(
                      color: Colors.redAccent
                    ),
                    child: Text(
                      'A${index+1}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                )),
            )
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: paddingW16, vertical: paddingH20),
            sliver: SliverToBoxAdapter(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _matricule,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Matricule du vehicule',
                        contentPadding: EdgeInsets.all(paddingW10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(radius15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: (5), //5
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(radius15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: (5), //5
                          ),
                        ),
                        suffix: const Icon(
                          Icons.car_repair_outlined,
                          color: secondary,
                        )
                      ),
                      validator: (value) {
                        return value == null ? "champ requis" : null;
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
                        filled: true,
                        hintText: _date.text,
                        contentPadding: EdgeInsets.all(paddingW10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(radius15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: (5), //5
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
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
                        return value == null ? "champ requis" : null;
                      },
                      onChanged: (value) {
                        _date.text = value;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          onTap: () {
                            _timePicker();
                          },
                          readOnly: true,
                          controller: _startTime,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            hintText: 'Depart',
                            contentPadding: EdgeInsets.all(paddingW10), //10 //10
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: (largeurEcran / 72), //5
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(radius15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 5, //5
                              ),
                            ),
                            suffix: const Icon(
                              Icons.timer_outlined,
                              color: secondary,
                            )
                          ),
                          validator: (value) {
                            return value == null ? "champ requis" : null;
                          },
                          onChanged: (value) {
                            _startTime.text = value;
                          },
                        ),
                        TextFormField(
                          controller: _duration,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Duree',
                            contentPadding: EdgeInsets.all(paddingW10), //10 //10
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: (largeurEcran / 72), //5
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(radius15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 5, //5
                              ),
                            ),
                            suffix: const Text(
                              ': heure(s)',
                              style: TextStyle(
                                color: primary,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ),
                          validator: (value) {
                            return value == null ? "champ requis" : null;
                          },
                          onChanged: (value) {
                            _duration.text = value;
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        if(_formKey.currentState!.validate()) {
                          final endTimeHour = startime.value.hour + int.parse(_duration.text);
                          reservationController.currentReservation = ReservationModel(
                            id: '',
                            conductorId: userController.currentUser.uid,
                            conductorName: userController.currentUser.name,
                            conductorPhone: userController.currentUser.phone,
                            //TODO: (Need to pass correct vehicule model)
                            vehicule: VehiculeModel.empty(),
                            parkingId: parkingController.currentParking.id,
                            parkingAddress: parkingController.currentParking.address.fullAddress,
                            date: _date.text,
                            startTime: _startTime.text,
                            endTime: '${endTimeHour}hh:${startime.value.minute}m',
                            status: ReservationStatus.pending
                          );
                          // context.read<ReservationBloc>().add(CreateReservationEvent(
                          //   reservation: reservation));
                        }
                      },
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(radius15)
                        ),
                        child: Text(
                          'Reserver',
                          style: TextStyle(
                            fontSize: font20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'itim'
                          ),
                        ),
                      ),
                    )
                  ]
                )
              )
            ),
          ),
        ]
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
        _startTime.text = timePicker.toString();
        debugPrint("======= START TIME: ${_startTime.text}");
      });
    }
  }
}
