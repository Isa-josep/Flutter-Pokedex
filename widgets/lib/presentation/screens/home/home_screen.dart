import 'package:flutter/material.dart';
import 'package:widgets/config/menu/menu_items.dart';
import 'package:widgets/presentation/screens/buttons/button_screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {

    appMenuItems;
    return ListView.builder(
      //physics:const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final item = appMenuItems[index];

        return _CustomListTile(item: item);
      },
      );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(item.title),
      splashColor: theme.secondary, //color del splash 
      //TODO: cambiar el color del splash
      subtitle: Text(item.subTitle),
      leading: Icon(item.icon, color: theme.primary),
      trailing:  Icon(Icons.subdirectory_arrow_right_outlined,color : theme.primary),
      onTap: (){
         
        // Navigator.of(context).push(
        // MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );
        Navigator.pushNamed(context, item.link);
      },
    );
  }
}