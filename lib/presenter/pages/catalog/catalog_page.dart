import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:google_fonts/google_fonts.dart';import 'package:lottie/lottie.dart';import '../../../utils/catalog.dart';import '../../../utils/category_holder.dart';import '../catalog_child/catalog_child_page.dart';import 'bloc/catalog_bloc.dart';class CatalogPage extends StatefulWidget {  const CatalogPage({super.key});  @override  State<CatalogPage> createState() => _CatalogPageState();}class _CatalogPageState extends State<CatalogPage> {  final _bloc = CatalogBloc();  List<CategoryHolder> categoryHolder = [];  @override  void initState() {    _bloc.add(GetAllCatalogEvent());    super.initState();  }  @override  Widget build(BuildContext context) {    return BlocProvider(      create: (context) => _bloc,      child: BlocConsumer<CatalogBloc, CatalogState>(        listener: (context, state) {          if (state is GetAllCatalogState) {            state.data.data.categories?.forEach((element) {              categoryHolder.add(CategoryHolder(                  element.smallImage ?? '',                  element.name ?? '',                  element.slug ?? '',                  element.childs ?? []));            });          }          // if (state is ClickItemForSlugState) {          //   Navigator.push(          //       context,          //       MaterialPageRoute(          //           builder: (context) =>          //   CatalogChildPage(data: )          //               // ProductsPage(state.title, state.slug)));          // }          if (state is ClickItemForChildState) {            Navigator.push(                context,                MaterialPageRoute(                    builder: (context) => CatalogChildPage(                          data: state.data,                          name: state.name,                        )));          }        },        builder: (context, state) {          if (state is LoadingState) {            return Scaffold(              body: Padding(                padding: const EdgeInsets.only(top: 28),                child: Column(                children: [                  SizedBox(width: double.infinity,),                  LinearProgressIndicator()                ],              ),              ),            );          } else {            return Scaffold(              appBar: AppBar(                automaticallyImplyLeading: false,                title: Column(                  children: [                    TextField(                      decoration: InputDecoration(                        border: OutlineInputBorder(                            borderSide: BorderSide(                                color: Colors.black12                            )                        ),                        enabledBorder: OutlineInputBorder(                          borderSide: BorderSide(                              color: Colors.black12),                        ),                        disabledBorder: OutlineInputBorder(                          borderSide: BorderSide(                              color: Colors.black12),                        ),                        filled: true,                        fillColor: Colors.black12,                        hintText: 'Sotib olish',                        isDense: true,                      // Added this                        contentPadding: EdgeInsets.all(8),  // Added this                      ),                    )                  ],                ),              ),              body: SafeArea(                child: ListView.builder(                    itemCount: categoryHolder.length,                    itemBuilder: (context, index) {                      return catalogItem(categoryHolder[index].image,                          categoryHolder[index].name, () {                        _bloc.add(ClickItemForChildEvent(                            categoryHolder[index].child,                            categoryHolder[index].name));                      });                    }),              ),            );          }        },      ),    );  }}