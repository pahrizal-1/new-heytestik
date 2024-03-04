// ignore_for_file: must_be_immutable, use_build_context_synchronously, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_product_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/alamat_page.dart';
import 'package:heystetik_mobileapps/models/customer/payment_method_model.dart';
import 'package:heystetik_mobileapps/pages/solution/selesai_pembayaran_produk_page.dart';
import 'package:heystetik_mobileapps/widget/Text_widget.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_transaksi_widget.dart';

import '../../theme/theme.dart';
import '../../widget/produk_widget.dart';

class CheckOutPage extends StatefulWidget {
  bool isCart;
  CheckOutPage({required this.isCart, super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  OrderProductController state = Get.put(OrderProductController());

  @override
  void initState() {
    super.initState();

    print("LIST awal ${state.listProductItem.length}");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.isLoading.value = true;
      await state.selectAddress(context);
      await state.getPaymentmethod(context);
      if (state.addressId.value > 0) {
        await state.shippingMethod(
          context,
          isOnTap: false,
          userAddressId: state.addressId.value,
        );
      }
      state.totalAmountFunc();
      state.isLoading.value = false;
      print("LIST ini ${state.listProductItem.length}");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(
              width: 11,
            ),
            Text(
              'Checkout',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
          ],
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          title: "Sedang menyiapkan pesananmu ...",
          isLoading: state.isLoading.value,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26, right: 25, top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Alamat',
                            style: blackTextStyle.copyWith(fontSize: 18),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => SelectAddress());
                            },
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: greenColor,
                              size: 26,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (state.address.value.isEmpty) {
                            Get.to(() => Alamatpage());
                          }
                        },
                        child: Container(
                          width: 340,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 19, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: const Color(0xffD9D9D9),
                            ),
                          ),
                          child: state.address.value.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(
                                      () => Text(
                                        state.recipientName.value,
                                        style: blackTextStyle,
                                      ),
                                    ),
                                    Obx(
                                      () => Text(
                                        state.recipientPhone.value,
                                        style: blackTextStyle,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Obx(
                                      () => Text(
                                        state.address.value,
                                        style: subTitleTextStyle.copyWith(
                                            fontSize: 13,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    Obx(
                                      () => Text(
                                        state.noteForCourier.value,
                                        style: subTitleTextStyle.copyWith(
                                            fontSize: 13,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Belum ada alamat',
                                      style: subTitleTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text('+ Tambah Alamat Baru',
                                        style: grenTextStyle.copyWith(
                                            fontSize: 15))
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const dividergreen(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: lsymetric,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Detail Produk',
                        style: blackHigtTextStyle.copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ...state.listProductItem.map((e) {
                        return DetailProduk(
                          // discon: '20%',
                          // priceDiscon: 'Rp.800.000',
                          price:
                              CurrencyFormat.convertToIdr(e['totalPrice'], 0),
                          nameProduk: e['productName'],
                          item: e['qty'].toString(),
                          note: e['notes'],
                          urlImg: "${Global.FILE}/${e['img']}",
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const dividergreen(),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: lsymetric,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pilih Pengiriman & Pembayaran',
                        style: blackHigtTextStyle.copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => BoxPengriman(
                          type: 'Shipping',
                          urlIcons: 'assets/icons/delivery-icons.png',
                          title: state.shippingName.value.isEmpty
                              ? 'Pilih Pengiriman'
                              : state.shippingName.value,
                          onTap: () {
                            if (state.addressId.value <= 0 ||
                                state.getShippingMethod.isEmpty) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertWidget(
                                  subtitle:
                                      "Harap pilih alamat terlebih dahulu",
                                ),
                              );
                              return;
                            }
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              builder: (context) =>
                                  const PilihPengirimMoreDialog(),
                            );
                          },
                          width: 30,
                        ),
                      ),
                      Obx(
                        () => BoxPengriman(
                          type: 'Bank',
                          urlIcons: state.bankImage.value.isEmpty
                              ? 'assets/icons/cod-icons.png'
                              : '${Global.FILE}/${state.bankImage.value}',
                          title: state.bankName.value.isEmpty
                              ? 'Pilih Metode Pembayaran'
                              : state.bankName.value,
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              enableDrag: false,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.only(
                                  topEnd: Radius.circular(25),
                                  topStart: Radius.circular(25),
                                ),
                              ),
                              builder: (context) => Wrap(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 60,
                                          left: 10,
                                          right: 10,
                                          bottom: 60,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Image.asset(
                                                    'assets/icons/danger-icons.png',
                                                    width: 20,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 17,
                                                ),
                                                Text(
                                                  'Pilih Metode Pembayaran',
                                                  style: blackHigtTextStyle
                                                      .copyWith(fontSize: 20),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 40,
                                            ),
                                            state.getPaymentMethod.isEmpty
                                                ? Center(
                                                    child: Text(
                                                      'Belum ada motode pembayaran',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'ProximaNova',
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  )
                                                : GroupedListView<Data, String>(
                                                    elements: state
                                                        .getPaymentMethod
                                                        .toList(),
                                                    groupBy: (element) =>
                                                        element.segment
                                                            .toString(),
                                                    groupComparator: (value1,
                                                            value2) =>
                                                        value2
                                                            .compareTo(value1),
                                                    order: GroupedListOrder.ASC,
                                                    useStickyGroupSeparators:
                                                        true,
                                                    shrinkWrap: true,
                                                    keyboardDismissBehavior:
                                                        ScrollViewKeyboardDismissBehavior
                                                            .onDrag,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    groupSeparatorBuilder:
                                                        (String value) =>
                                                            Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        dividergreen(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 10,
                                                                  top: 10,
                                                                  left: 20,
                                                                  right: 20),
                                                          child: Text(
                                                            value,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    itemBuilder: (c, element) {
                                                      return InkWell(
                                                        onTap: () {
                                                          if (element
                                                              .isActive!) {
                                                            state.idPayment
                                                                    .value =
                                                                element.id!
                                                                    .toInt();
                                                            state.paymentMethod
                                                                .value = element
                                                                    .method ??
                                                                '-';
                                                            state.bankName
                                                                    .value =
                                                                element.name ??
                                                                    '-';
                                                            state.paymentType
                                                                    .value =
                                                                element.type ??
                                                                    '-';
                                                            state.bankImage
                                                                .value = element
                                                                    .mediaPaymentMethod
                                                                    ?.media
                                                                    ?.path ??
                                                                '';

                                                            Get.back();
                                                          }
                                                        },
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 20,
                                                                  top: 10,
                                                                  bottom: 10,
                                                                  left: 20),
                                                          height: 35,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Image.network(
                                                                    '${Global.FILE}/${element.mediaPaymentMethod!.media!.path.toString()}',
                                                                    width: 40,
                                                                    height: 35,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 19,
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        element.name ??
                                                                            '-',
                                                                        style: blackTextStyle
                                                                            .copyWith(
                                                                          fontSize:
                                                                              15,
                                                                          color: element.isActive!
                                                                              ? blackColor
                                                                              : greyColor,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        element.isActive!
                                                                            ? element.description ??
                                                                                '-'
                                                                            : 'Tidak tersedia untuk transaksi ini',
                                                                        style: blackRegulerTextStyle.copyWith(
                                                                            fontSize:
                                                                                12),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  const Spacer(),
                                                                  element.isActive!
                                                                      ? Obx(
                                                                          () =>
                                                                              Icon(
                                                                            state.idPayment.value == element.id
                                                                                ? Icons.radio_button_on
                                                                                : Icons.circle_outlined,
                                                                            size:
                                                                                23,
                                                                            color: state.idPayment.value == element.id
                                                                                ? greenColor
                                                                                : blackColor,
                                                                          ),
                                                                        )
                                                                      : Container(),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          width: 30,
                        ),
                      ),
                      BoxPengriman(
                        type: 'Promo',
                        urlIcons: 'assets/icons/persen_icons.png',
                        title: 'Lebih Hemat Pake Promo',
                        onTap: () {},
                        width: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const dividergreen(),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: lsymetric,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rincian Pembayaran',
                        style: blackHigtTextStyle.copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Obx(
                        () => TextBoldSpacebetwen(
                          title: 'Total Produk',
                          title1: '',
                          title2: CurrencyFormat.convertToIdr(
                            state.totalAmountProduct.value,
                            0,
                          ),
                        ),
                      ),
                      Obx(
                        () => TextBoldSpacebetwen(
                          title: 'Biaya Pengiriman',
                          title1: '',
                          title2: CurrencyFormat.convertToIdr(
                            state.shippingPrice.value,
                            0,
                          ),
                        ),
                      ),
                      const TextBoldSpacebetwen(
                        title: 'Biaya Pembayaran',
                        title1: '',
                        title2: '-',
                      ),
                      const TextBoldSpacebetwen(
                        title: 'Diskon Promo',
                        title1: '',
                        title2: '-',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PPN',
                            style: subGreyTextStyle.copyWith(
                                fontSize: 15,
                                color: Color(0XFF323232),
                                fontWeight: regular),
                          ),
                          Text(
                            'Gratis',
                            style: blackHigtTextStyle.copyWith(
                                fontSize: 15, color: redColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Obx(
                        () => TextBoldSpacebetwen(
                          title: 'Total Tagihan',
                          title1: '',
                          title2: CurrencyFormat.convertToIdr(
                            state.totalAmount.value,
                            0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => state.isLoading.value
            ? SizedBox(
                height: 5,
              )
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total ${state.listProductItem.length} Produk',
                          style: blackRegulerTextStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => Text(
                                CurrencyFormat.convertToIdr(
                                  state.totalAmount.value,
                                  0,
                                ),
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 20),
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_up,
                            )
                          ],
                        ),
                      ],
                    ),
                    Obx(
                      () => LoadingWidget(
                        isLoading: state.isMinorLoading.value,
                        child: InkWell(
                          onTap: () async {
                            await state.orderProduct(
                              context,
                              widget.isCart,
                              doInPost: () async {
                                Get.offAll(SelesaikanPembayaranProdukPage(
                                  isWillPop: true,
                                  orderId: state.orderId.value,
                                  bankImage: state.bankImage.value,
                                  expireTime: state.expireTime.value,
                                  paymentMethodId: state.idPayment.value,
                                ));
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 38, vertical: 16),
                            height: 51,
                            decoration: BoxDecoration(
                              color: greenColor,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/check_button.png',
                                  width: 17,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Bayar',
                                  style: whiteTextStyle.copyWith(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

class SelectAddress extends StatefulWidget {
  const SelectAddress({super.key});

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  OrderProductController state = Get.put(OrderProductController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.isLoading.value = true;
      await state.selectAddress(context);
      state.isLoading.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(
              width: 11,
            ),
            Text(
              'Pilih Alamat',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                bool res = await Get.to(() => Alamatpage());
                if (res) {
                  await state.selectAddress(context);
                }
              }),
        ],
      ),
      body: Stack(
        children: [
          Obx(
            () => LoadingWidget(
              isLoading: state.isLoading.value,
              child: state.getAddress.value.isEmpty
                  ? Center(
                      child: Text(
                        'Belum ada alamat',
                        style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontSize: 20,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ...state.getAddress.value.map((e) {
                            return ListTile(
                              leading: Icon(Icons.home),
                              visualDensity: VisualDensity(vertical: 4),
                              title: Text(
                                '${e.recipientName} ${e.mainAddress! ? '(ALAMAT UTAMA)' : ''}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              selected: e.mainAddress! ? true : false,
                              selectedColor: greenColor,
                              subtitle: Text(e.pinpointAddress.toString()),
                              onTap: () async {
                                if (e.id! > 0) {
                                  await state.shippingMethod(
                                    context,
                                    isOnTap: true,
                                    userAddressId: e.id!,
                                    recipientN: e.recipientName ?? '-',
                                    recipientP: e.recipientPhone ?? '-',
                                    addr: e.pinpointAddress ?? '-',
                                    noteForC: e.noteForCourier ?? '-',
                                  );
                                }
                              },
                            );
                          })
                        ],
                      ),
                    ),
            ),
          ),
          Obx(
            () => state.isLoadingShipping.value
                ? Opacity(
                    opacity: 0.8,
                    child: ModalBarrier(
                      dismissible: false,
                      color: Colors.grey[100],
                    ),
                  )
                : Container(),
          ),
          Obx(
            () => state.isLoadingShipping.value
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LoadingMore(),
                      Padding(
                        padding: const EdgeInsets.only(right: 12, left: 12),
                        child: Text(
                          'Sedang mencari pengiriman (kurir) yang cocok dengan lokasi tujuan ...',
                          style: subGreyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}

class BoxPengriman extends StatelessWidget {
  final String type;
  final String urlIcons;
  final String title;
  final double width;
  final VoidCallback? onTap;
  const BoxPengriman({
    Key? key,
    required this.type,
    required this.urlIcons,
    required this.title,
    this.onTap,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 9),
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            if (type == 'Bank')
              if (title == 'Pilih Metode Pembayaran')
                Image.asset(
                  urlIcons,
                  width: width,
                )
              else
                Image.network(
                  urlIcons,
                  width: width,
                ),
            if (type == 'Promo' ||
                type == 'Shipping' && title == 'Pilih Pengiriman')
              Image.asset(
                urlIcons,
                width: width,
              ),
            if (type == 'Bank' ||
                type == 'Promo' ||
                type == 'Shipping' && title == 'Pilih Pengiriman')
              const SizedBox(
                width: 17,
              ),
            Text(
              title,
              style: blackHigtTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.keyboard_arrow_right,
              size: 25,
              color: greenColor,
            )
          ],
        ),
      ),
    );
  }
}
