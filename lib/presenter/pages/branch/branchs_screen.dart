// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:texnomart_clone_flutter/presenter/pages/branch/bloc/branchs_bloc.dart';
// import 'package:texnomart_clone_flutter/utils/branch_holder.dart';
// import 'package:texnomart_clone_flutter/utils/branch_item.dart';
//
// class BranchScreen extends StatefulWidget {
//   const BranchScreen({super.key});
//
//   @override
//   State<BranchScreen> createState() => _BranchScreenState();
// }
//
// class _BranchScreenState extends State<BranchScreen> {
//   List<BranchHolder> branchHolder = [];
//   final _bloc = BranchsBloc();
//
//   @override
//   void initState() {
//     _bloc.add(GetAllBranchEvent());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: _bloc..add(GetAllBranchEvent()),
//       child: BlocConsumer<BranchsBloc, GetAllBranchState>(
//         listener: (context, state) {
//
//         },
//         builder: (context, state) {
//           return Builder(
//             builder: (context) {
//               return Scaffold(
//                 appBar: AppBar(
//                   backgroundColor: Colors.yellow,
//                   automaticallyImplyLeading: false,
//                   title: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           InkWell(
//                               onTap: () {},
//                               child: const Icon(
//                                 Icons.arrow_back_ios,
//                                 size: 20,
//                               )),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           const Text(
//                             'Do`konlarimiz',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.w600),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             'Barchasi',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w300, fontSize: 14),
//                           ),
//                           Icon(
//                             Icons.keyboard_arrow_down_outlined,
//                             size: 18,
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 body: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextField(
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.black12)),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 width: 0,
//                                 style: BorderStyle.solid,
//                                 color: Colors.black12),
//                           ),
//                           disabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 width: 0,
//                                 style: BorderStyle.solid,
//                                 color: Colors.black12),
//                           ),
//                           filled: true,
//                           fillColor: Colors.black12,
//                           hintText: 'Sotib olish',
//                           isDense: true,
//                           hintStyle:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//                           contentPadding: EdgeInsets.all(8),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 12,
//                       ),
//                       Text(
//                         'Barchasi',
//                         style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
//                       ),
//                       SizedBox(
//                         height: 12,
//                       ),
//                       ListView.builder(
//                           itemCount: branchHolder.length,
//                           itemBuilder: (context, index) {
//                             return BranchItem(address: state.data[index] ,time: );
//                           })
//                     ],
//                   ),
//                 ),
//               );
//             }
//           );
//         },
//       ),
//     );
//   }
// }
