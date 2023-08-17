import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'uicontrol_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI Controls'),
      ),
      body: _UIControlView(),
    );
  }
}

class _UIControlView extends StatefulWidget {
  const _UIControlView();

  @override
  State<_UIControlView> createState() => _UIControlViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlViewState extends State<_UIControlView> {
  bool isDeveloper = true;
  Transportation selectedTrans = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text(selectedTrans.name),
          children: [
            RadioListTile(
                title: const Text('Car'),
                subtitle: const Text('Viajar por Car'),
                value: Transportation.car,
                groupValue: selectedTrans,
                onChanged: (value) {
                  setState(() {
                    selectedTrans = Transportation.car;
                  });
                }),
            RadioListTile(
                title: const Text('Plane'),
                subtitle: const Text('Viajar por Plane'),
                value: Transportation.plane,
                groupValue: selectedTrans,
                onChanged: (value) {
                  setState(() {
                    selectedTrans = Transportation.plane;
                  });
                }),
            RadioListTile(
                title: const Text('Boat'),
                subtitle: const Text('Viajar por Boat'),
                value: Transportation.boat,
                groupValue: selectedTrans,
                onChanged: (value) {
                  setState(() {
                    selectedTrans = Transportation.boat;
                  });
                }),
            RadioListTile(
                title: const Text('Submarine'),
                subtitle: const Text('Viajar por Submarine'),
                value: Transportation.submarine,
                groupValue: selectedTrans,
                onChanged: (value) {
                  setState(() {
                    selectedTrans = Transportation.submarine;
                  });
                }),
          ],
        ),
        CheckboxListTile(
            title: const Text('Desayuno'),
            value: wantsBreakfast,
            onChanged: (value) {
              setState(() {
                wantsBreakfast = !wantsBreakfast;
              });
            }),
        CheckboxListTile(
            title: const Text('Almuerzo'),
            value: wantsLunch,
            onChanged: (value) {
              setState(() {
                wantsLunch = !wantsLunch;
              });
            }),
        CheckboxListTile(
            title: const Text('Cena'),
            value: wantsDinner,
            onChanged: (value) {
              setState(() {
                wantsDinner = !wantsDinner;
              });
            }),
      ],
    );
  }
}
