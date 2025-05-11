import 'dart:async';
import 'dart:math';
import 'package:fcsfs_order_process_plattechfinals/model.dart/randomNameModel.dart';
import 'package:flutter/material.dart';
import 'package:fcsfs_order_process_plattechfinals/model.dart/queueModel.dart';
import 'package:fcsfs_order_process_plattechfinals/styling/scaffold.dart';
import 'package:fcsfs_order_process_plattechfinals/styling/spacing.dart';
import 'package:fcsfs_order_process_plattechfinals/styling/textStyle.dart';

class Queue extends StatefulWidget {
  const Queue({super.key});

  @override
  State<Queue> createState() => _QueueState();
}

class _QueueState extends State<Queue> {
  List<Orders> queueList = [];
  List<RandomName> randomNames = [
    RandomName(characterName: 'David Agudo'),
    RandomName(characterName: 'Criz Moreno'),
    RandomName(characterName: 'Bonifacio Bautista'),
    RandomName(characterName: 'Juan dela Cruz'),
    RandomName(characterName: 'Maria Santos'),
    RandomName(characterName: 'Josefina Tan'),
    RandomName(characterName: 'Alfonso Reyes'),
    RandomName(characterName: 'Liza Rodriguez'),
    RandomName(characterName: 'Carlos Garcia'),
    RandomName(characterName: 'Antonio Alvarez'),
    RandomName(characterName: 'Elena Cruz'),
    RandomName(characterName: 'Fernando Lopez'),
    RandomName(characterName: 'Miguel Rivera'),
    RandomName(characterName: 'Isabella Martinez'),
    RandomName(characterName: 'Ryan Johnson'),
    RandomName(characterName: 'Emily Thompson'),
    RandomName(characterName: 'Michael Smith'),
    RandomName(characterName: 'Sarah Davis'),
    RandomName(characterName: 'James Williams'),
    RandomName(characterName: 'John Brown'),
    RandomName(characterName: 'Jessica Taylor'),
    RandomName(characterName: 'Alexandra Lee'),
    RandomName(characterName: 'Evan Clark'),
    RandomName(characterName: 'Grace Harris'),
    RandomName(characterName: 'Andrew Young'),
    RandomName(characterName: 'Sophia Walker'),
    RandomName(characterName: 'Jack Martinez'),
    RandomName(characterName: 'Ava Robinson'),
    RandomName(characterName: 'William Turner'),
    RandomName(characterName: 'Charlotte White'),
    RandomName(characterName: 'Henry King'),
    RandomName(characterName: 'Jackie Campbell'),
    RandomName(characterName: 'Oliver Wright'),
    RandomName(characterName: 'Maya Phillips'),
    RandomName(characterName: 'Carter Evans'),
    RandomName(characterName: 'Isaiah Carter'),
    RandomName(characterName: 'Lucas Mitchell'),
    RandomName(characterName: 'Zoe Scott'),
    RandomName(characterName: 'Grace Hill'),
    RandomName(characterName: 'Dylan Adams'),
    RandomName(characterName: 'Mia Perez'),
    RandomName(characterName: 'Samantha Baker'),
    RandomName(characterName: 'Ben Taylor'),
    RandomName(characterName: 'Olivia Green'),
    RandomName(characterName: 'Mason Nelson'),
    RandomName(characterName: 'Chloe Young'),
    RandomName(characterName: 'Daniel King'),
    RandomName(characterName: 'Anna Scott'),
    RandomName(characterName: 'Raul Delgado'),
    RandomName(characterName: 'Ricardo Aquino'),
    RandomName(characterName: 'Veronica Garcia'),
    RandomName(characterName: 'Ariel Dizon'),
    RandomName(characterName: 'Catherine Reyes'),
    RandomName(characterName: 'Lorenzo Ramos'),
    RandomName(characterName: 'Lily Sanchez'),
    RandomName(characterName: 'Paolo Torres'),
    RandomName(characterName: 'Miguel Salazar'),
    RandomName(characterName: 'Isabelle Cruz'),
    RandomName(characterName: 'Samuel Matthews'),
    RandomName(characterName: 'Kaitlyn Peterson'),
    RandomName(characterName: 'Victoria Wong'),
    RandomName(characterName: 'Antonio Rodriguez'),
    RandomName(characterName: 'Jennifer Bell'),
    RandomName(characterName: 'Henry Jackson'),
    RandomName(characterName: 'Sarah Murphy'),
    RandomName(characterName: 'Lucas Harrison'),
    RandomName(characterName: 'Sophia Martinez'),
    RandomName(characterName: 'Liam Turner'),
    RandomName(characterName: 'Aidan Lopez'),
    RandomName(characterName: 'Gabrielle Johnson'),
    RandomName(characterName: 'Zara Thompson'),
    RandomName(characterName: 'Mason Martinez'),
    RandomName(characterName: 'Diana Sullivan'),
    RandomName(characterName: 'Ethan Garcia'),
    RandomName(characterName: 'Chloe Morgan'),
    RandomName(characterName: 'Nathaniel Ward'),
    RandomName(characterName: 'Elijah Clark'),
    RandomName(characterName: 'Olivia Baker'),
    RandomName(characterName: 'Benjamin Lewis'),
    RandomName(characterName: 'Jessica Wright'),
    RandomName(characterName: 'Hannah Mitchell'),
    RandomName(characterName: 'William Harris'),
    RandomName(characterName: 'Evelyn Peterson'),
    RandomName(characterName: 'Gabriel Evans'),
    RandomName(characterName: 'Julia Cook'),
    RandomName(characterName: 'Luke Rogers'),
    RandomName(characterName: 'Emily Price'),
    RandomName(characterName: 'Michael Cooper'),
    RandomName(characterName: 'Lola Santos'),
    RandomName(characterName: 'Karla Gutierrez'),
    RandomName(characterName: 'Julian Medina'),
    RandomName(characterName: 'Chester Ramirez'),
    RandomName(characterName: 'Adrian Williams'),
    RandomName(characterName: 'Ruby Santiago'),
  ];

  Timer? _processTimer;
  Timer? _waitingTimer;
  final Set<Orders> recentlyAddedOrders = {};
  int _nextOrderNo = 1;

  @override
  void initState() {
    super.initState();

    _processTimer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        for (var order in queueList) {
          if (order.processTime > 0) {
            order.processTime--;
          } else {
            order.delayTime++;
          }
        }
        queueList.sort((a, b) => a.processTime.compareTo(b.processTime));
      });
    });

    _waitingTimer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        for (var order in queueList) {
          order.waitingTime++;
        }
      });
    });
  }

  @override
  void dispose() {
    _processTimer?.cancel();
    _waitingTimer?.cancel();
    super.dispose();
  }

  void _AddQueue() {
    final random = Random();
    final randomIndex = random.nextInt(randomNames.length);
    final newOrder = Orders(
      name: randomNames[randomIndex].characterName,
      orderNo: _nextOrderNo++,
      processTime: random.nextInt(90) + 1,
      waitingTime: 0,
      delayTime: 0,
    );

    setState(() {
      queueList.add(newOrder);
      queueList.sort((a, b) => a.processTime.compareTo(b.processTime));
      recentlyAddedOrders.add(newOrder);
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        recentlyAddedOrders.remove(newOrder);
      });
    });
  }

  void _deleteQueueAtIndex(int index) {
    setState(() {
      queueList.removeAt(index);
    });
  }

  void _showOrderDetailsDialog(Orders order) {
    Timer? timer;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            timer ??= Timer.periodic(Duration(seconds: 1), (_) {
              if (Navigator.of(dialogContext).canPop()) {
                setState(() {});
              } else {
                timer?.cancel();
              }
            });

            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: Text("Order Details"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: ${order.name}", style: textName),
                  Text("Order No.: ${order.orderNo}", style: textName),
                  Text("Process Time: ${order.processTime}",
                      style: textTimeforProcessDialog),
                  Text("Delay Time: ${order.delayTime}",
                      style: textTimeforWaitingDialog),
                  Text("Waiting Time: ${order.waitingTime}",
                      style: textTimeforWaitingDialog),
                ],
              ),
              actions: [
                TextButton(
                  child: Text("Close"),
                  onPressed: () {
                    timer?.cancel();
                    Navigator.of(dialogContext).pop();
                  },
                )
              ],
            );
          },
        );
      },
    ).then((_) {
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return scaffold1(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: queueList.length,
              itemBuilder: (context, index) {
                final q = queueList[index];
                final isNew = recentlyAddedOrders.contains(q);

                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: isNew ? Colors.amber[200] : Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.circle_rounded,
                      color: Colors.grey,
                    ),
                    title: Text(
                      q.name,
                      style: textName,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            textCenter(
                              q.processTime > 0
                                  ? "Process Time: ${q.processTime}"
                                  : "Delay Time: ${q.delayTime}",
                              style: q.processTime > 0
                                  ? textTimeforProcess
                                  : textTimeforWaiting,
                            ),
                            space10,
                            textCenter(
                              "Waiting Time: ${q.waitingTime}",
                              style: textTimeforWaiting,
                            ),
                          ],
                        ),
                        if (q.processTime == 0) ...[
                          SizedBox(width: 10),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () => _deleteQueueAtIndex(index),
                            icon: Icon(
                              Icons.check,
                              size: 18,
                              color: Colors.black,
                            ),
                            label: Text(
                              "Finish Order",
                              style: textName,
                            ),
                          ),
                        ]
                      ],
                    ),
                    subtitle: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        _showOrderDetailsDialog(q);
                      },
                      child: Text(
                        'Check Detailed Information >',
                        style: textOpenInfo,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: textCenter('Insert Random Order'),
            onTap: _AddQueue,
            tileColor: Colors.white70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
