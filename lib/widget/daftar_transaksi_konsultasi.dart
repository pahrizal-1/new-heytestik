// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';

// import '../controller/customer/transaction/history/all_history_transaction_controller.dart';
// import '../core/convert_date.dart';
// import '../core/currency_format.dart';
// import '../core/global.dart';
// import '../pages/setings&akun/menunggu_pembayaran_page.dart';
// import '../theme/theme.dart';
// import 'daftar_transaksi_widgets.dart';

// class DaftarTransaksiKonsultasi extends StatelessWidget {
//   DaftarTransaksiKonsultasi({super.key});

//   final AllHistoryTransactionController state =
//       Get.put(AllHistoryTransactionController());

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: whiteColor,
//                 borderRadius: BorderRadius.circular(7),
//                 boxShadow: [
//                   BoxShadow(
//                     color: blackColor,
//                     blurRadius: 0.5,
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
//                 child: InkWell(
//                   onTap: () {
//                     Get.to(() => MenungguPemayaranPage());
//                   },
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 25,
//                         height: 25,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage(
//                                 'assets/icons/transaksi_logo.png',
//                               ),
//                               fit: BoxFit.cover),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 11,
//                       ),
//                       Text(
//                         'Menunggu Pembayaran',
//                         style: blackHigtTextStyle.copyWith(fontSize: 15),
//                       ),
//                       const Spacer(),
//                       Obx(
//                         () => state.totalPending.value == 0
//                             ? Container()
//                             : Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 5, vertical: 2),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     color: redColor),
//                                 child: Text(
//                                   state.totalPending.value.toString(),
//                                   style: whiteTextStyle.copyWith(fontSize: 10),
//                                 ),
//                               ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Image.asset(
//                         'assets/icons/arrow-left-hight.png',
//                         width: 24,
//                         height: 24,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: spaceHeigt,
//             ),
//             FutureBuilder(
//               future: state.getAllHistory(context),
//               builder: (context, AsyncSnapshot snapshot) {
//                 print(snapshot.connectionState);
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Column(
//                     children: [
//                       shimmerWidget(
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(vertical: 5),
//                           width: MediaQuery.of(context).size.width,
//                           height: 140,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(7),
//                             color: whiteColor,
//                           ),
//                         ),
//                       ),
//                       shimmerWidget(
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(vertical: 5),
//                           width: MediaQuery.of(context).size.width,
//                           height: 140,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(7),
//                             color: whiteColor,
//                           ),
//                         ),
//                       ),
//                       shimmerWidget(
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(vertical: 5),
//                           width: MediaQuery.of(context).size.width,
//                           height: 140,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(7),
//                             color: whiteColor,
//                           ),
//                         ),
//                       ),
//                       shimmerWidget(
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(vertical: 5),
//                           width: MediaQuery.of(context).size.width,
//                           height: 140,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(7),
//                             color: whiteColor,
//                           ),
//                         ),
//                       ),
//                       shimmerWidget(
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(vertical: 5),
//                           width: MediaQuery.of(context).size.width,
//                           height: 140,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(7),
//                             color: whiteColor,
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 }
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   if (snapshot.hasData) {
//                     return state.historyNotPending.isEmpty
//                         ? Center(
//                             child: Text(
//                               'Belum ada transaksi',
//                               style: TextStyle(
//                                 fontWeight: bold,
//                                 fontFamily: 'ProximaNova',
//                                 fontSize: 20,
//                               ),
//                             ),
//                           )
//                         : ListView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount: state.historyNotPending.length,
//                             itemBuilder: (BuildContext context, index) {
//                               if (state.historyNotPending[index]
//                                       .transactionType ==
//                                   'CONSULTATION') {
//                                 return TransaksiKonsultan(
//                                   namaDokter: state.historyNotPending[index]
//                                               .consultation ==
//                                           null
//                                       ? '-'
//                                       : state.historyNotPending[index]
//                                           .consultation.doctor.fullname,
//                                   tanggal: ConvertDate.defaultDate(state
//                                           .historyNotPending[index].createdAt ??
//                                       '-'),
//                                   pesanan: 'Konsultasi',
//                                   progres: state.historyNotPending[index]
//                                               .status ==
//                                           'MENUNGGU_PEMBAYARAN'
//                                       ? 'Menunggu Pembayaran'
//                                       : state.historyNotPending[index].status ==
//                                               'READY'
//                                           ? 'Ready'
//                                           : state.historyNotPending[index]
//                                                       .status ==
//                                                   'REVIEW'
//                                               ? 'Review'
//                                               : state.historyNotPending[index]
//                                                           .status ==
//                                                       'AKTIF'
//                                                   ? 'Aktif'
//                                                   : state
//                                                               .historyNotPending[
//                                                                   index]
//                                                               .status ==
//                                                           'SELESAI'
//                                                       ? 'Selesai'
//                                                       : '-',
//                                   keluhan: state.historyNotPending[index]
//                                               .consultation ==
//                                           null
//                                       ? '-'
//                                       : state
//                                           .historyNotPending[index]
//                                           .consultation
//                                           .medicalHistory
//                                           .interestCondition
//                                           .name,
//                                   harga: CurrencyFormat.convertToIdr(
//                                       state.historyNotPending[index].totalPaid,
//                                       0),
//                                   img: state.historyNotPending[index]
//                                               .consultation ==
//                                           null
//                                       ? '-'
//                                       : '${Global.FILE}/${state.historyNotPending[index].consultation.doctor.mediaUserProfilePicture.media.path}',
//                                 );
//                               }

//                               if (state.historyNotPending[index]
//                                       .transactionType ==
//                                   'TREATMENT') {
//                                 return TransaksiTreatment(
//                                   item: state.historyNotPending[index]
//                                       .transactionTreatmentItems,
//                                   tanggal: ConvertDate.defaultDate(state
//                                           .historyNotPending[index].createdAt ??
//                                       '-'),
//                                   pesanan: 'Treatment',
//                                   progres: state.historyNotPending[index]
//                                               .status ==
//                                           'MENUNGGU_PEMBAYARAN'
//                                       ? 'Menunggu Pembayaran'
//                                       : state.historyNotPending[index].status ==
//                                               'MENUNGGU_KONFIRMASI_KLINIK'
//                                           ? 'Menunggu Konfirmasi Klinik'
//                                           : state.historyNotPending[index]
//                                                       .status ==
//                                                   'KLINIK_MENGKONFIRMASI'
//                                               ? 'Klinik Mengkonfirmasi'
//                                               : state.historyNotPending[index]
//                                                           .status ==
//                                                       'SELESAI'
//                                                   ? 'Selesai'
//                                                   : '-',
//                                   harga: CurrencyFormat.convertToIdr(
//                                       state.historyNotPending[index].totalPaid,
//                                       0),
//                                 );
//                               }
//                               return null;
//                             });
//                   } else {
//                     return Center(
//                       child: Text(
//                         'Belum ada transaksi',
//                         style: TextStyle(
//                           fontWeight: bold,
//                           fontFamily: 'ProximaNova',
//                           fontSize: 20,
//                         ),
//                       ),
//                     );
//                   }
//                 } else {
//                   return Text('Connection State: ${snapshot.connectionState}');
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
