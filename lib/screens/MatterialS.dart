import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/models/matrial_model.dart';

class MaterialStudent extends StatefulWidget {
  const MaterialStudent({
    Key? key,
    required this.material,
  }) : super(key: key);
  final List<MaterialModel> material;

  @override
  State<MaterialStudent> createState() => _MaterialStudentState();
}

class _MaterialStudentState extends State<MaterialStudent> {
  Future<void> _launchUrl(String? url) async {
    if (await launchUrl(Uri.parse(url!))) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Material',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 3,
        ),
        child: ListView.builder(
            itemCount: widget.material.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.orange),
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: Text(
                                  widget.material[index].name!,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                widget.material[index].updatedAt!.split(':')[0],
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              _launchUrl(widget.material[index].src);
                            },
                            child: Container(
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(
                                  25,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Icon(Icons.adobe_rounded),
                                    ),
                                    Text(
                                      widget.material[index].id.toString(),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 180.0),
                                      child:
                                          Icon(Icons.expand_circle_down_rounded),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              );
            }),
      ),
    );
  }
}
