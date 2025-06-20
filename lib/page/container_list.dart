import 'package:flutter/material.dart';

class ContainerList extends StatefulWidget {
  final String titleList;
  final List mainList;

  const ContainerList({super.key, required this.titleList, required this.mainList});

  @override
  State<ContainerList> createState() => _ContainerListState();
}

class _ContainerListState extends State<ContainerList> {

  @override
  Widget build(BuildContext context,) {
    return Column(
      children: [
        Container(height: 40, child: Text('${widget.titleList}')),
        Expanded(
          child: ListView.builder(
            itemCount: widget.mainList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text("${widget.mainList[index]["title"]}"),
                  height: 40,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
class ContainerList2 extends StatelessWidget {
  const ContainerList2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
