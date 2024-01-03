import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'iu_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controles de flutter'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bike, horse, boat }

class _UiControlsViewState extends State<_UiControlsView> {
  bool activo = true;
  bool wantsBreakfast = false;
  bool wantsLouch = false;
  bool wantsDinner = false;
  Transportation selectedTransportation = Transportation.car;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text("Switch"),
          subtitle: const Text("Swictch de flutter"),
          value: activo,
          onChanged: (value) => setState(() {
            activo = !activo;
          }),
        ),

        ExpansionTile(
          title: const Text("vehículo de transporte"),
          subtitle: Text("$selectedTransportation"),
          children: [
            RadioListTile(
                value: Transportation.car,
                title: const Text("Carro"),
                subtitle: const Text("Viajar por caror"),
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.car;
                    })),
            RadioListTile(
                value: Transportation.boat,
                title: const Text("Barco"),
                subtitle: const Text("Viajar por barco"),
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.boat;
                    })),
            RadioListTile(
                value: Transportation.bike,
                title: const Text("Bicicleta"),
                subtitle: const Text("Viajar por bicicleta"),
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.bike;
                    })),
            RadioListTile(
              value: Transportation.horse,
              title: const Text("Caballo"),
              subtitle: const Text("Viajar por caballo"),
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.horse;
              }),
            )
          ],
        ),

         CheckboxListTile(
          title: const Text("Desayuno"),
          subtitle: const Text("Desea desayunar"),
          value: wantsBreakfast, 
          onChanged: (value) =>setState(() {
            wantsBreakfast = !wantsBreakfast;
          })
        ), 

        CheckboxListTile(
          title: const Text("Almuerzo"),
          subtitle: const Text("Desea almorzar"),
          value: wantsLouch, 
          onChanged: (value) =>setState(() {
            wantsLouch = !wantsLouch;
          })
        ),

        CheckboxListTile(
          title: const Text("Cena"),
          subtitle: const Text("Desea cenar"),
          value: wantsDinner, 
          onChanged: (value) =>setState(() {
            wantsDinner = !wantsDinner;
          })
        )
      ],
    );
  }
}
