import 'package:flutter/material.dart';
import "../components/main_drawer.dart";
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;
  const SettingsScreen({
    Key? key,
    required this.onSettingsChanged,
    required this.settings,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      activeColor: Colors.amber,
      inactiveThumbColor: Colors.pink,
      inactiveTrackColor: Colors.pink,
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Filtros",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                    "Sem Glutém",
                    "Só exibe refeições sem Glutém!",
                    settings.isGlutenFree,
                    (value) => setState(() => settings.isGlutenFree = value)),
                _createSwitch(
                    "Sem Lactose",
                    "Só exibe refeições sem Lactose!",
                    settings.isLactoseFree,
                    (value) => setState(() => settings.isLactoseFree = value)),
                _createSwitch(
                    "Vegana",
                    "Só exibe refeições veganas!",
                    settings.isVegan,
                    (value) => setState(() => settings.isVegan = value)),
                _createSwitch(
                    "Vegetariana",
                    "Só exibe refeições vegetarianas!",
                    settings.isVegetarian,
                    (value) => setState(() => settings.isVegetarian = value)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
