// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:winkels_customer/ui/utils/custom_widgets/card_store.dart';
// import 'package:winkels_customer/ui/utils/custom_widgets/category_item.dart';
// import 'package:winkels_customer/ui/utils/custom_widgets/item_card.dart';
// import 'package:winkels_customer/ui/utils/custom_widgets/search_text_field.dart';
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomCustomAppBar(
//           children: [
//             IconStatusCustomBar(
//               icon: icon,
//               textIcon: textIcon,
//               onPressed: this.onPressed,
//             ),
//             IconStatusCustomBar(icon: icon, textIcon: textIcon, onPressed: this.onPressed),
//             IconStatusCustomBar(icon: icon, textIcon: textIcon, onPressed: this.onPressed),
//             IconStatusCustomBar(icon: icon, textIcon: textIcon, onPressed: this.onPressed),
//
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//               ),
//             ), // The dummy child
//
//             IconStatusCustomBar(
//               icon: icon,
//               textIcon: textIcon,
//               onPressed: this.onPressed,
//             ),
//           ],
//           textIcon: 'Home',
//           icon: Icon(Icons.home_outlined),
//           onPressed: () {
//             debugPrint('Icono presionado');
//           }),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.location_on),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text('La Felicidad, Bogotá'),
//                   Icon(
//                     Icons.location_on,
//                     color: Colors.transparent,
//                   ),
//                 ],
//               ),
//               Text(
//                 'Categorias',
//                 style: TextStyle(fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               SearchTextField(
//                 hintText: 'Buscar Categoria',
//               ),
//               CategoryCard(
//                 text: 'Viveres',
//                 imageAsset: 'assets/icons/ic_viveres.png',
//               ),
//               StoreCard(
//                 nameStore: 'Tienda 1',
//               ),
//               ItemCard(
//                 text: 'Huevos Blancos',
//                 imageAsset: 'assets/images/img_egg.png',
//               ),
//               Text(
//                 'Categorias',
//                 style: TextStyle(fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               SearchTextField(
//                 hintText: 'Buscar Categoria',
//               ),
//               CategoryCard(
//                 text: 'Viveres',
//                 imageAsset: 'assets/icons/ic_viveres.png',
//               ),
//               StoreCard(
//                 nameStore: 'Tienda 1',
//               ),
//               ItemCard(
//                 text: 'Huevos Blancos',
//                 imageAsset: 'assets/images/img_egg.png',
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class BottomCustomAppBar extends StatelessWidget {
//   final Icon icon;
//   final String textIcon;
//   final Function onPressed;
//   final List<Widget> children;
//
//   const BottomCustomAppBar({
//     Key key,
//     @required this.icon,
//     this.textIcon,
//     this.onPressed,
//     this.children,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       child: ClipRRect(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//         child: BottomAppBar(
//           notchMargin: 4,
//           color: Colors.white,
//           shape: CircularNotchedRectangle(),
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: children,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class IconStatusCustomBar extends StatelessWidget {
//   const IconStatusCustomBar({
//     Key key,
//     @required this.icon,
//     @required this.textIcon,
//     this.onPressed,
//   }) : super(key: key);
//
//   final Icon icon;
//   final String textIcon;
//   final Function onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             icon,
//             Text(textIcon),
//           ],
//         ),
//       ),
//     );
//   }
// }
