import 'package:flutter/material.dart';
import 'package:yesilsepet/Views/theme/appColors.dart';

class NewIngredientSearchBar extends StatefulWidget {
  const NewIngredientSearchBar({super.key});

  @override
  State<NewIngredientSearchBar> createState() => _NewIngredientSearchBarState();
}

class _NewIngredientSearchBarState extends State<NewIngredientSearchBar> {

  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.pureWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _textFieldController,
                    decoration: InputDecoration(
                      hintText: 'Elinizdeki malzemeleri giriniz...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  final text = _textFieldController.text;
                  _textFieldController.clear();
                  setState(() {
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Ekle',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 260,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.builder(
            itemCount: 10, // TODO
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ListTile(
                    title: Text(
                      "malzemeler[index].toString()",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.cancel, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          // malzemeler.removeAt(index); TODO
                        });
                      },
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    dense: true,
                  ),
                ),
              );
            },
          ),
        ),

      ],
    );
  }
}



// Widget buildNewTarifPage() {
//   return Stack(
//     children: [
//       SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           child: Center(
//             child: Column(
//               children: [
//                 const SizedBox(height: 10),
//                 const Row(
//                   children: [
//                     SizedBox(width: 20),
//                     Text(
//                       "Yapay zekaya tarif oluşturun!",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 5),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: cream,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: TextField(
//                             controller: _textFieldController,
//                             decoration: InputDecoration(
//                               hintText: 'Elinizdeki malzemeleri giriniz...',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 borderSide: BorderSide.none,
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       ElevatedButton(
//                         onPressed: () {
//                           final text = _textFieldController.text;
//                           // print('Text Field Content: $text');
//                           _textFieldController.clear();
//                           setState(() {
//                             malzemeler.add(text);
//                           });
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.orange,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: const Text(
//                           'Ekle',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   height: 260,
//                   width: 350,
//                   decoration: BoxDecoration(
//                     color: cream,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: ListView.builder(
//                     itemCount: malzemeler.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
//                         child: Card(
//                           elevation: 2,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           child: ListTile(
//                             title: Text(
//                               malzemeler[index].toString(),
//                               style: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             trailing: IconButton(
//                               icon: const Icon(Icons.cancel, color: Colors.red),
//                               onPressed: () {
//                                 setState(() {
//                                   malzemeler.removeAt(index);
//                                 });
//                               },
//                             ),
//                             contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                             dense: true,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Switch(
//                               value: isLactoseFree,
//                               onChanged: (value) {
//                                 setState(() {
//                                   isLactoseFree = value;
//                                 });
//                               },
//                             ),
//                             const Text("Laktozsuz"),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             Switch(
//                               value: isGlutenFree,
//                               onChanged: (value) {
//                                 setState(() {
//                                   isGlutenFree = value;
//                                 });
//                               },
//                             ),
//                             const Text("Glutensiz"),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             Switch(
//                               value: isVegan,
//                               onChanged: (value) {
//                                 setState(() {
//                                   isVegan = value;
//                                 });
//                               },
//                             ),
//                             const Text("Vegan"),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             const SizedBox(width: 20),
//                             Switch(
//                               value: isDairyFree,
//                               onChanged: (value) {
//                                 setState(() {
//                                   isDairyFree = value;
//                                 });
//                               },
//                             ),
//                             const Text("Dairy-free"),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () async {
//                     setState(() {
//                       _isProcessing = true;
//                     });
//                     List<String> limitler = [
//                       if (isLactoseFree) "laktozsuz",
//                       if (isGlutenFree) "glutensiz",
//                       if (isVegan) "vegan",
//                       if (isDairyFree) "dairy-free"
//                     ];
//
//                     final response = await talkWithGemini(malzemeler, limitler);
//
//                     setState(() {
//                       _isProcessing = false;
//                     });
//                     if (response != null) {
//                       List<String> responseWords = response.toString().split('**');
//                       String documentName = responseWords.length > 1
//                           ? '${responseWords[0]} ${responseWords[1]}'
//                           : responseWords[0];
//
//                       await FirebaseFirestore.instance
//                           .collection('tarifler')
//                           .doc('tarifPromtları')
//                           .update({
//                         documentName: {
//                           'tarif': response,
//                           'isDiary': isDairyFree,
//                           'isVegan': isVegan,
//                           'isLactose': isLactoseFree,
//                           'isGluten': isGlutenFree,
//                         }
//                       });
//                       setState(() {
//                         malzemeler.clear();
//                         isLactoseFree = false;
//                         isGlutenFree = false;
//                         isVegan = false;
//                         isDairyFree = false;
//                       });
//
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('$documentName başarıyla oluşturuldu!'),
//                           backgroundColor: Colors.green,
//                         ),
//                       );
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Tarif oluşturulamadı, lütfen tekrar deneyin.'),
//                           backgroundColor: Colors.red,
//                         ),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: const Text(
//                     'Yarat',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       Visibility(
//         visible: _isProcessing,
//         child: Container(
//           color: Colors.black.withOpacity(0.5),
//           child: Center(
//             child: Lottie.asset(
//               'assets/animations/foodAnimation.json',
//               width: 100,
//               height: 100,
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }