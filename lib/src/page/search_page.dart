// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final TextEditingController _searchController = TextEditingController();

//   final List<String> packages = [
//     'packages 1',
//     'packages 2',
//     'packages 3',
//     'packages 4',
//     'packages 5',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     List<String> filteredItems = List.from(packages);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Lista de packages'),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             controller: _searchController,
//             onChanged: (value) {
//               setState(() {
//                 filteredItems = packages
//                     .where((item) =>
//                         item.toLowerCase().contains(value.toLowerCase()))
//                     .toList();
//               });
//             },
//             decoration: const InputDecoration(
//               hintText: 'Pesquisar',
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredItems.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return const ListTile(
//                     // title: Text(filteredItems[index]),
//                     );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }