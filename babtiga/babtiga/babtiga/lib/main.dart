import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce UI Demo',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('E-commerce'),
        leading: Icon(
          Icons.menu,
          size: 30,
        ),
        actions: [
          Icon(Icons.notifications_none),
          SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(255, 211, 211, 211),
                ),
                child: Icon(Icons.shopping_cart_outlined)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian Pencarian dan Promosi
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search here...',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Expanded(
                          flex: 2,
                          child: Container(
                            height: 55,
                            // width: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Icon(Icons.filter_list),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 150,
                    color: const Color.fromARGB(255, 248, 207, 235),
                    child: Center(
                      child: Text(
                        'Today’s Deal\n50% OFF',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Bagian 'Top Rated Freelancers'
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      color: const Color.fromARGB(255, 233, 156, 202),
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Top Rated Freelancer",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "View All",
                        style: TextStyle(
                            fontSize: 13,
                            color: const Color.fromARGB(255, 227, 108, 180),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height:
                        8), 
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(0.1),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ProfileCard(
                              imageUrl:
                                  'https://cdn.pixabay.com/photo/2017/04/23/20/36/tulips-2254970_1280.jpg',
                              name: 'Freelancer ${index + 1}',
                            ),
                            SizedBox(
                                height:
                                    8),
                            Text(
                              "Developer", // Nama usaha
                              style: TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '4.9', // Rating
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            // Bagian 'Top Services'
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width /
                          3,
                      color: const Color.fromARGB(255, 233, 156, 202),
                      padding: EdgeInsets.all(
                          12.0), 
                      child: Text(
                        "Top Services",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "View All",
                        style: TextStyle(
                            fontSize: 13,
                            color: const Color.fromARGB(255, 227, 108, 180),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return ServiceCard(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2022/05/07/04/56/tulip-7179450_960_720.jpg',
                  service: 'Service ${index + 1}',
                  provider: 'Provider ${index + 1}',
                );
              },
            ),

            // Bagian 'Best Booking'
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SectionHeader(title: 'Best Booking'),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width /
                            3, // Setengah lebar layar
                        color: const Color.fromARGB(255, 233, 156, 202), // Warna latar belakang biru
                        padding: EdgeInsets.all(
                            12.0), // Padding untuk ruang di sekitar teks
                        child: Text(
                          "Best Boking",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 13,
                              color: const Color.fromARGB(255, 227, 108, 180),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 245, 198, 226),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        'Flat 60% OFF\non Best Booking',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        20), // Jarak antara teks promosi dan bagian berikutnya

                // Bagian gambar dan kartu
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      
                      // Menampilkan gambar di atas
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2017/02/15/13/40/tulips-2068692_1280.jpg'), // URL gambar
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: 16),

                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 1.0),
                          // leading: CircleAvatar(
                          //   radius: 30, // Ukuran lingkaran
                          //   backgroundImage: NetworkImage(imageUrl), // Gambar dari URL
                          // ),
                          title: Column(
                            // mainAxisAlignment: MainAxisAlignment.,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        "https://cdn.pixabay.com/photo/2014/04/09/15/39/tulips-320151_1280.jpg"),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Miss Zachary Will', // Nama
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Container(
                                            width: 130,
                                            child: Text(
                                              "Reloaded 1 of 704 libraries in 2,525ms (compile: 84 ms, reload: 970 ms, reassemble: 1349 ms).Reloaded 1 of 704 libraries in 2,525ms (compile: 84 ms, reload: 970 ms, reassemble: 1349 ms).",
                                              style: TextStyle(fontSize: 10),
                                              softWrap: true,
                                              maxLines: 2,
                                              overflow: TextOverflow
                                                  .visible, // Pengaturan overflow agar terlihat
                                            ),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(height: 4),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          'CTF', // Deskripsi singkat
                                          style: TextStyle(
                                              color: Colors.purple,
                                              fontSize: 10),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 23),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 16,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              '4.9', // Rating
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // subtitle: Padding(
                          //   padding: const EdgeInsets.only(left: 0),
                          //   child: Column(
                          //     children: [
                          //       Text("helll")
                          //     ],
                          //   ),
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Bagian 'Recommended Workshops'
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SectionHeader(title: 'Recommended Workshops'),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width /
                            1.5, // Setengah lebar layar
                        padding: EdgeInsets.all(
                            12.0), // Padding untuk ruang di sekitar teks
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 233, 156, 202),
                              const Color.fromARGB(255, 218, 168, 198),
                              Color.fromARGB(117, 255, 255, 255)
                            ], // Warna gradien biru dari kiri ke kanan
                            begin: Alignment.centerLeft, // Mulai dari kiri
                            end: Alignment.centerRight, // Akhir di kanan
                          ),
                        ),
                        child: Text(
                          "Recommended Workshops",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 13,
                              color: const Color.fromARGB(255, 227, 108, 180),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2 / 3.3,
              ),
              itemBuilder: (context, index) {
                return WorkshopCard(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2017/04/23/20/36/tulips-2254970_960_720.jpg',
                  title: 'Workshop ${index + 1}',
                  instructor: 'Instructor ${index + 1}',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Widget untuk Judul Seksi
class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: Text('View All'),
          ),
        ],
      ),
    );
  }
}

// Custom Widget untuk Profile Card
class ProfileCard extends StatelessWidget {
  final String imageUrl;
  final String name;

  ProfileCard({required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Container(
          //     height: 80,
          //     width: 80,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: NetworkImage(imageUrl), // URL gambar
          //         fit: BoxFit.cover, // Menyesuaikan gambar agar memenuhi ruang
          //       ),
          //       borderRadius: BorderRadius.circular(100),
          //     )),

          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 40,
           
          ),
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

// Custom Widget untuk Service Card
class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String service;
  final String provider;

  ServiceCard(
      {required this.imageUrl, required this.service, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: 160),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Container(
            height: 145,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2022/01/26/03/45/flowers-6967755_1280.jpg'), // URL gambar kamu
                fit:
                    BoxFit.cover, // Menyesuaikan gambar dengan ukuran container
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(
                      15)), // Jika ingin sudut melengkung seperti kartu
            ),
          ),
        ),
        Container(
          width: 295, // Menyesuaikan lebar kartu
          child: Transform.translate(
            offset: Offset(50, 0), // Menggeser kartu ke kanan
            child: Card(
              elevation: 5, // Menambahkan efek bayangan untuk tampilan kartu
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10), // Menambahkan sudut melengkung pada kartu
              ),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 18.0, vertical: 1.0),
                // leading: CircleAvatar(
                //   radius: 30, // Ukuran lingkaran
                //   backgroundImage: NetworkImage(imageUrl), // Gambar dari URL
                // ),
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Miss Zachary Will', // Nama
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Beautician', // Deskripsi singkat
                          style: TextStyle(color: Colors.purple, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 78),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '4.9', // Rating
                        style: TextStyle(fontSize: 14),
                      ),
                      Spacer(), // Memberi jarak antara rating dan tombol
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 227, 108, 180), // Warna tombol
                        ),
                        onPressed: () {},
                        child: Text(
                          'Book Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Custom Widget untuk Workshop Card
class WorkshopCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String instructor;

  WorkshopCard(
      {required this.imageUrl, required this.title, required this.instructor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar dengan ranting di sudut kanan atas dan BorderRadius
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ), // Border radius untuk gambar
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(104, 255, 255, 255),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 14),
                      SizedBox(width: 4),
                      Text(
                        "4.9", // Rating
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              instructor,
              style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 223, 122, 196)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "tes saja sapa tau jadi yakan?",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          SizedBox(height: 8), // Jarak antara teks dan tombol

          // Button di bagian bawah card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // Tambahkan aksi yang diinginkan saat tombol ditekan
              },
              child: Text("Book Now"), // Teks pada tombol
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    const Color.fromARGB(255, 227, 108, 180), // Warna teks tombol
              ),
            ),
          ),
        ],
      ),
    );
  }
}
