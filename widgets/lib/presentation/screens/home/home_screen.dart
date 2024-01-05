import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/config/menu/menu_items.dart';
import 'package:widgets/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey =GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey, 
      appBar: AppBar(
        title: const Text('Widgets'),
      ),
      body: const _HomeView(),
      drawer:   SideMenu(scaffoldKey: scaffoldKey)
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
         context.push(item.link);
      },
    );
  }
}
