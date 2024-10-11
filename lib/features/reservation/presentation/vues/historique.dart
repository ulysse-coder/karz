import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:karz/core/widgets/heading1.dart';
import 'package:karz/features/authentification/presentation/app/controller/user_controller.dart';
import 'package:karz/features/reservation/data/models/reservation_model.dart';
import 'package:karz/features/reservation/presentation/app/bloc/bloc/reservation_bloc.dart';
import 'package:karz/features/reservation/presentation/app/bloc/controllers/reservation_controller.dart';
import 'package:karz/features/reservation/presentation/vues/reservation_historic_item.dart';

class History extends StatefulWidget{
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History>{
  UserController userController = Get.find();
  ReservationController reservationController = Get.find();

  @override
  void initState() {
    super.initState();
    context.read<ReservationBloc>().add(GetReservationsByUserEvent(userId: userController.currentConductor.uid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context); // Revenir à la page précédente
            //print("Icône de l'AppBar cliquée");
          },
        ),
        title: Text('Mes réservations'),
        backgroundColor: Colors.grey,
      ),
      body: BlocBuilder<ReservationBloc, ReservationState>(
        builder: (_, state) {
          if(state is ReservationLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is ReservationsLoaded) {
            reservationController.reservations = state.reservations as List<ReservationModel>;

            return ListView.builder(
              itemCount: reservationController.reservations.length,
              itemBuilder: (_, index) {
                return ReservationHistoricItem(reservation: reservationController.reservations[index]);
              }
            );
          }

          return const Center(
            child: Heading1(text: "Une erreur s'est produite", textAlign: TextAlign.center,),
          );
        },
      )
    );
  }
}
