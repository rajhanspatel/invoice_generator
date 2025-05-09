import 'dart:ui';

import 'package:invoice_generator_2/pages/utills/headers.dart';

class Invoice_Page extends StatefulWidget {
  const Invoice_Page({super.key});

  @override
  State<Invoice_Page> createState() => _Invoice_PageState();
}

class _Invoice_PageState extends State<Invoice_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(heading: "Invoice Generate", context: context),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: MyRoute.invoiceOption
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, e['route']);
                  },
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                      child: Card(
                        color: Colors.white.withOpacity(0.5),
                        shadowColor: Colors.grey,
                        elevation: 3,
                        margin: const EdgeInsets.all(10),
                        shape: OutlineInputBorder(
                          gapPadding: 10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            "lib/assets/logo.png",
                            height: 40,
                          ),
                          title: Text(
                            e['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, e['route']);
                            },
                            icon: const Icon(Icons.navigate_next),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, MyRoute.pdfPage),
        label: const Text("PDF"),
        backgroundColor: const Color(0xffcae1f3),
        icon: const Icon(Icons.picture_as_pdf),
      ),
    );
  }
}
