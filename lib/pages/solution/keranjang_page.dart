import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/wishlist_page.dart';

import '../../theme/theme.dart';
import '../../widget/button_widget.dart';

import '../../widget/produk_card_widget.dart';
import '../../widget/produk_widget.dart';
import '../../widget/show_dialog_sousions_payment.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Keranjang',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WishListPage(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/love-icons.svg',
              color: blackColor,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AkunHomePage(),
                ),
              );
            },
            child: SvgPicture.asset(
              'assets/icons/humberger-icons.svg',
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(39.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 25, top: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: Container(
                        width: 23,
                        padding: const EdgeInsets.all(4),
                        height: 23,
                        decoration: BoxDecoration(
                          color: isSelected ? greenColor : null,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              color: isSelected ? greenColor : borderColor),
                        ),
                        child: isSelected
                            ? Image.asset('assets/icons/chek_new.png')
                            : null,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Pilih semua',
                      style: blackRegulerTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const ProdukCardWidget(
            imageProduk: 'assets/images/penting1.png',
            merkProduk: 'Teenderm Hydra 40ml',
            penggunaanJadwal: 'Pagi & Malam',
            penggunaan: '2x sehari',
            harga: 'Rp175.000',
            hintText: 'Toner',
            namaProdik: 'Obat',
          ),
          const ProdukCardWidget(
            imageProduk: 'assets/images/penting1.png',
            merkProduk: 'Teenderm Hydra 40ml',
            penggunaanJadwal: 'Pagi & Malam',
            penggunaan: '2x sehari',
            harga: 'Rp175.000',
            hintText: 'Toner',
            namaProdik: 'Obat',
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: lsymetric,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kamu sempat lihat-lihat ini',
                  style: blackHigtTextStyle.copyWith(fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: lsymetric,
              child: Row(
                children: [
                  const ProdukKeranjang(
                    namaBrand: 'ISISPHARMA',
                    namaProduk: 'Teenderm Gel',
                    diskonProduk: '20%',
                    hargaDiskon: 'Rp1,100,00',
                    harga: 'Rp900.000',
                    urlImg: 'assets/images/plasma.png',
                    rating: '4.9 (120k)',
                  ),
                  const ProdukKeranjang(
                    namaBrand: 'CANTABRIA',
                    namaProduk:
                        'Neoretin Discrom Control Pigment Neutralizer Serum',
                    diskonProduk: '20%',
                    hargaDiskon: 'Rp500.000',
                    harga: 'Rp200.000',
                    urlImg: 'assets/images/catabria.png',
                    rating: '4.9 (120k)',
                  ),
                  const ProdukKeranjang(
                    namaBrand: 'ISISPHARMA',
                    namaProduk: 'Teenderm Gel',
                    diskonProduk: '20%',
                    hargaDiskon: 'Rp250.000',
                    harga: 'Rp200.000',
                    urlImg: 'assets/images/view-bg-skincare.png',
                    rating: '4.9 (120k)',
                  ),
                  const ProdukKeranjang(
                    namaBrand: 'ISISPHARMA',
                    namaProduk: 'Endocare Tensage Cream',
                    diskonProduk: '20%',
                    hargaDiskon: 'Rp250.000',
                    harga: 'Rp200.000',
                    urlImg: 'assets/images/catabria.png',
                    rating: '4.9 (120k)',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 25,
        ),
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Perawatan',
              style: blackRegulerTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  'Rp290.400',
                  style: blackHigtTextStyle.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  width: 12,
                ),
                const Icon(Icons.keyboard_arrow_down)
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ButtonGreenWidget(
              title: 'Bayar',
              onPressed: () {
                showModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(25),
                      topStart: Radius.circular(25),
                    ),
                  ),
                  builder: (context) => PesananMoreDialog(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
