import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nfc_manager/nfc_manager.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NFC read and write'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<bool>(
          future: NfcManager.instance.isAvailable(),
          builder: (ctx, snapshot) => snapshot.data != true
              ? Center(child: Text('NfcManager:isAvailable():${snapshot.data}'))
              : Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  direction: Axis.vertical,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.all(4),
                        constraints: BoxConstraints.expand(),
                        decoration: BoxDecoration(border: Border.all()),
                        child: SingleChildScrollView(
                          child: ValueListenableBuilder(
                            valueListenable: controller.result,
                            builder: (ctx, value, _) => Text('${value ?? ''}'),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: GridView.count(
                        padding: EdgeInsets.all(4),
                        crossAxisCount: 2,
                        childAspectRatio: 4,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        children: [
                          ElevatedButton(
                              onPressed: controller.tagRead,
                              child: Text('Tag Read')),
                          ElevatedButton(
                              onPressed: controller.ndefWrite,
                              child: Text('Ndef Write')),
                          ElevatedButton(
                              onPressed: controller.ndefWriteLock,
                              child: Text('Ndef Write Lock'))
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
