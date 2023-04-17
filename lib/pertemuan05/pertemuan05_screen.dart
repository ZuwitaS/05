import 'package:praktek_05/pertemuan05/pertemuan05_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pertemuan05Screen extends StatefulWidget {
  Pertemuan05Screen({Key? key}) : super(key: key);
  @override
  State<Pertemuan05Screen> createState() => _Pertemuan05ScreenState();
}

class _Pertemuan05ScreenState extends State<Pertemuan05Screen> {
  //Status soal 1
  bool? soal1a = false;
  bool? soal1b = false;

  //Status soal 2
  String soal2 = 'answ';

  //Status pilih kelas
  bool kelasPagi = false;
  bool kelasSiang = false;

  @override
  Widget build(BuildContext context) {
    //class ini menggunkan provider Pertemuan05Provider
    final prov =  Provider.of<Pertemuan05Provider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pertemuan 05'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Soal 1: Menggunkan Checkbox
            const Text(
                '1. Memori yang berfungsi untuk tempat penyimpanan data sementara disebut..'),
            Row(
              children: [
                Text('a.'),
                SizedBox(width: 5),
                Checkbox(
                  value: soal1a,
                  onChanged: (val) {
                    setState(() {
                      soal1a = val;
                    });
                  },
                ),
                Text('RAM')
              ],
            ),
            Row(
              children: [
                Text('b.'),
                SizedBox(width: 5),
                Checkbox(
                  value: soal1b,
                  onChanged: (val) {
                    setState(() {
                      soal1b = val;
                    });
                  },
                ),
                Text('Random Access Memory')
              ],
            ),
            if (soal1a == false && soal1b == false)
            Container()
            else if (soal1a == true && soal1b == true)
            const Text('Jawaban sudah benar',style: TextStyle(color: Colors.green))
            else
            const Text('Jawaban masih salah, coba lagi',style: TextStyle(color: Colors.red)),

            //Soal 2: Menggunakan Checkbox
            const Text('2. Skema desain pembangunan naringan disebut..'),
            Row(
              children: [
                Text('a.'),
                SizedBox(width: 5),
                Radio(
                  value: 'topologi',
                  groupValue: soal2,
                  onChanged: (val) {
                    setState(() {
                      soal2 = 'topologi';
                    });
                  },
                ),
                Text('Topologi'),
              ],
            ),
            Row(
              children: [
                Text('b.'),
                SizedBox(width: 5),
                Radio(
                  value: 'desain jaringan',
                  groupValue: soal2,
                  onChanged: (val) {
                    setState(() {
                      soal2 = 'desain jaringan';
                    });
                  },
                ),
                Text('Desain Jaringan'),
              ],
            ),
            if ( soal2 == 'answ')
            Container()
            else if (soal2 == 'topologi')
            const Text('Benar',style: TextStyle(color: Colors.green),)
            else 
            const Text('Salah',style: TextStyle(color: Colors.red),),

            Text(
              'Feedback Soal',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Kelas'),
            Row(
              children: [
                ChoiceChip(
                  label: Text('Pagi'),
                  selectedColor: Colors.blue[200],
                  selected: kelasPagi,
                  onSelected: (val) {
                    setState(() {
                      kelasPagi = val;
                    });
                  },
                ),
                const SizedBox(width: 5),
                ChoiceChip(
                  label: Text('Siang'),
                  selectedColor: Colors.blue[200],
                  selected: kelasSiang,
                  onSelected: (val) {
                    setState(() {
                      kelasSiang = val;
                    });
                  },
                ),
              ],
            ),
            Text('Soal diatas telah dipelajari saat?..'),
            Row(
              children: [
                FilterChip(
                  label: Text('Sekolah'),
                  //Atur color disini
                  selectedColor: Colors.blue[200],
                  selected: prov.statusSekolah,
                  onSelected: (val) {
                    prov.setSekolah = val;
                  },
                ),
                const SizedBox(width: 5),
                FilterChip(
                  label: Text('Praktikum'),
                  //selectedColor: Colors.blue[200],
                  selected: prov.statusPraktik,
                  onSelected: (val) {
                    prov.setPraktik = val;
                  },
                ),
                const SizedBox(width: 5),
                FilterChip(
                  label: Text('Kursus'),
                  selectedColor: Colors.blue[200],
                  selected: prov.statusKursus,
                  onSelected: (val) {
                    prov.setKursus = val;
                  },
                ),
              ],
            ),
            //InputChip
            Container(
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                            "Peminatan saat sekolah?:"),
                      ],
                    ),
                  ),
                  // letakkan chip terpilih disini!
                  // atur state menggunakan setState atau Provider
                ],
              ),
            ),
            Row(
              children: [
                InputChip(
                  label: Text('TKJ'),
                  selectedColor: Colors.blue[200],
                  selected: prov.statusTKJ,
                  onSelected: (val) {
                    prov.setTKJ = val;
                    //atur state menggunakan setState atau Provider
                  },
                ),
                SizedBox(width: 5),
                InputChip(
                  label: Text('RPL'),
                  selectedColor: Colors.blue[200],
                  selected: prov.statusRPL,
                  onSelected: (val) {
                    prov.setRPL = val;
                    // atur state menggunkana setState atau Provider
                  },
                ),
                SizedBox(width: 5),
                InputChip(
                  label: Text('SMA'),
                  selectedColor: Colors.blue[200],
                  selected: prov.statusSMA,
                  onSelected: (val) {
                    prov.setSMA = val;
                    // atur state menggunkana setState atau Provider
                  },
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
