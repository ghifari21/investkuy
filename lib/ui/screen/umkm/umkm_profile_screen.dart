import 'package:flutter/material.dart';
import 'package:investkuy/ui/screen/notification/notifikasi_screen.dart';
import 'package:investkuy/ui/screen/setting/informasi_akun_screen.dart';
import 'package:investkuy/ui/screen/setting/password_screen.dart';
import 'package:investkuy/ui/screen/setting/pin_screen.dart';
import 'package:investkuy/ui/screen/setting/tambah_rekening_screen.dart';
import 'package:investkuy/ui/screen/setting/verifikasi_akun.dart';

class UmkmProfile extends StatefulWidget {
  const UmkmProfile({super.key, required this.title});

  final String title;

  @override
  _UmkmProfileState createState() => _UmkmProfileState();
}

class _UmkmProfileState extends State<UmkmProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xff19A7CE),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_rounded),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Notifikasi(title: 'Notifikasi'))
              );
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.account_circle_rounded,
                    size: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Alief Muhammad Abdillah"),
                        Text("Pedagang UMKM",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Informasi Akun",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.email_outlined,
                              color: Colors.black,
                            ),
                          ),
                          Text("Email",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal
                            ),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.phone,
                              color: Colors.black,
                            ),
                          ),
                          Text("No. Handphone",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: null,
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.home_work,
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                            child: Text("Alamat",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TambahRekening(title: 'Tambah Rekening'))
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.credit_card,
                                  color: Colors.black,
                                ),
                              ),
                              Text("Rekening Bank",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Pengaturan Akun",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const InformasiAkun(title: 'Ubah Informasi Akun'))
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Ubah Informasi Akun",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Password(title: 'Ubah Password'))
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Ubah Password",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Pin(title: 'Ubah PIN'))
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Ubah PIN",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const VerifikasiAkun(title: 'Verifikasi Akun'))
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Verifikasi Akun",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Lainnya",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Pusat Bantuan",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Tentang Aplikasi",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(Icons.logout_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              Text("Keluar Aplikasi",
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
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