import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:winkels_customer/ui/utils/custom_widgets/search_text_field.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.arrow_back_ios_outlined),
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      // ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Stack(
            children: [
              Container(
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(
                          width: 10,
                        ),
                        Text('La Felicidad, Bogotá'),
                        Icon(
                          Icons.location_on,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                    Text(
                      'Categorias',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SearchTextField(
                      hintText: 'Buscar Categoria',
                    ),
                    CategoryItem(),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Row(

                        children: [
                          Image.asset('assets/icons/ic_viveres.png'),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tienda 1'),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text('4.5'),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            Image.asset('assets/icons/ic_viveres.png'),
            Text('Viveres'),
          ],
        ),
      ),
    );
  }
}
