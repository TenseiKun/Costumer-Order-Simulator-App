import 'dart:async';
import 'dart:math';
import 'package:fcsfs_order_process_plattechfinals/model.dart/randomFoods.dart';
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
  List<Foods> randomFoods = [
    Foods(foodList: 'Burger'),
    Foods(foodList: 'Spaghetti'),
    Foods(foodList: 'Pizza\nSoda'),
    Foods(foodList: 'Fried Chicken\nFries'),
    Foods(foodList: 'Hotdog'),
    Foods(foodList: 'Tapsilog'),
    Foods(foodList: 'Pancit\nLumpia'),
    Foods(foodList: 'Adobo'),
    Foods(foodList: 'Kare-Kare\nRice'),
    Foods(foodList: 'Sinigang'),
    Foods(foodList: 'Bistek Tagalog\nIced Tea'),
    Foods(foodList: 'Lechon Kawali\nRice\nSprite'),
    Foods(foodList: 'Pork BBQ'),
    Foods(foodList: 'Chicken Inasal'),
    Foods(foodList: 'Shawarma\nJuice'),
    Foods(foodList: 'Dimsum Platter'),
    Foods(foodList: 'Tempura\nSushi\nMiso Soup'),
    Foods(foodList: 'Fishball\nKikiam'),
    Foods(foodList: 'Takoyaki'),
    Foods(foodList: 'Burgers\nFries\nMilkshake'),
    Foods(foodList: 'Carbonara\nGarlic Bread'),
    Foods(foodList: 'Tocilog'),
    Foods(foodList: 'Ham Sandwich\nApple Juice'),
    Foods(foodList: 'Ramen\nGreen Tea'),
    Foods(foodList: 'Mango Float'),
    Foods(foodList: 'Halo-Halo'),
    Foods(foodList: 'Ice Cream Sundae'),
    Foods(foodList: 'Donut\nCoffee'),
    Foods(foodList: 'Corned Beef\nRice'),
    Foods(foodList: 'Choco Lava Cake\nVanilla Ice Cream'),
    Foods(foodList: 'Milk Tea\nFries'),
    Foods(foodList: 'Taho'),
    Foods(foodList: 'Siomai\nRice'),
    Foods(foodList: 'Tuna Sandwich\nIced Coffee'),
    Foods(foodList: 'Eggplant Omelette\nGarlic Rice'),
    Foods(foodList: 'Cheesecake\nFruit Shake'),
    Foods(foodList: 'Nachos\nCola'),
    Foods(foodList: 'Bibingka\nPuto Bumbong'),
    Foods(foodList: 'Lasagna\nCaesar Salad'),
    Foods(foodList: 'Chicken Nuggets\nJuice'),
    Foods(foodList: 'Pork Sisig\nEgg\nRice'),
    Foods(foodList: 'Mami\nPandesal'),
    Foods(foodList: 'Beef Tapa\nGarlic Rice\nEgg'),
    Foods(foodList: 'Vegetable Lumpia\nRice'),
    Foods(foodList: 'Burger Steak\nMashed Potatoes'),
    Foods(foodList: 'Bacon\nEgg\nToast'),
    Foods(foodList: 'Grilled Cheese\nTomato Soup'),
    Foods(foodList: 'Rice Bowl\nFruit Cup'),
    Foods(foodList: 'Sweet and Sour Pork\nRice'),
    Foods(foodList: 'Crispy Pata\nCoke'),
    Foods(foodList: 'Kwek-Kwek\nPalamig'),
  ];
  List<RandomName> randomNames = [
    RandomName(characterName: 'David Agudo', gender: 'male'),
    RandomName(characterName: 'Criz Moreno', gender: 'male'),
    RandomName(characterName: 'Bonifacio Bautista', gender: 'male'),
    RandomName(characterName: 'Juan dela Cruz', gender: 'male'),
    RandomName(characterName: 'Maria Santos', gender: 'female'),
    RandomName(characterName: 'Josefina Tan', gender: 'female'),
    RandomName(characterName: 'Alfonso Reyes', gender: 'male'),
    RandomName(characterName: 'Liza Rodriguez', gender: 'female'),
    RandomName(characterName: 'Carlos Garcia', gender: 'male'),
    RandomName(characterName: 'Antonio Alvarez', gender: 'male'),
    RandomName(characterName: 'Elena Cruz', gender: 'female'),
    RandomName(characterName: 'Fernando Lopez', gender: 'male'),
    RandomName(characterName: 'Miguel Rivera', gender: 'male'),
    RandomName(characterName: 'Isabella Martinez', gender: 'female'),
    RandomName(characterName: 'Ryan Johnson', gender: 'male'),
    RandomName(characterName: 'Emily Thompson', gender: 'female'),
    RandomName(characterName: 'Michael Smith', gender: 'male'),
    RandomName(characterName: 'Sarah Davis', gender: 'female'),
    RandomName(characterName: 'James Williams', gender: 'male'),
    RandomName(characterName: 'John Brown', gender: 'male'),
    RandomName(characterName: 'Jessica Taylor', gender: 'female'),
    RandomName(characterName: 'Alexandra Lee', gender: 'female'),
    RandomName(characterName: 'Evan Clark', gender: 'male'),
    RandomName(characterName: 'Grace Harris', gender: 'female'),
    RandomName(characterName: 'Andrew Young', gender: 'male'),
    RandomName(characterName: 'Sophia Walker', gender: 'female'),
    RandomName(characterName: 'Jack Martinez', gender: 'male'),
    RandomName(characterName: 'Ava Robinson', gender: 'female'),
    RandomName(characterName: 'William Turner', gender: 'male'),
    RandomName(characterName: 'Charlotte White', gender: 'female'),
    RandomName(characterName: 'Henry King', gender: 'male'),
    RandomName(characterName: 'Jackie Campbell', gender: 'female'),
    RandomName(characterName: 'Oliver Wright', gender: 'male'),
    RandomName(characterName: 'Maya Phillips', gender: 'female'),
    RandomName(characterName: 'Carter Evans', gender: 'male'),
    RandomName(characterName: 'Isaiah Carter', gender: 'male'),
    RandomName(characterName: 'Lucas Mitchell', gender: 'male'),
    RandomName(characterName: 'Zoe Scott', gender: 'female'),
    RandomName(characterName: 'Grace Hill', gender: 'female'),
    RandomName(characterName: 'Dylan Adams', gender: 'male'),
    RandomName(characterName: 'Mia Perez', gender: 'female'),
    RandomName(characterName: 'Samantha Baker', gender: 'female'),
    RandomName(characterName: 'Ben Taylor', gender: 'male'),
    RandomName(characterName: 'Olivia Green', gender: 'female'),
    RandomName(characterName: 'Mason Nelson', gender: 'male'),
    RandomName(characterName: 'Chloe Young', gender: 'female'),
    RandomName(characterName: 'Daniel King', gender: 'male'),
    RandomName(characterName: 'Anna Scott', gender: 'female'),
    RandomName(characterName: 'Raul Delgado', gender: 'male'),
    RandomName(characterName: 'Ricardo Aquino', gender: 'male'),
    RandomName(characterName: 'Veronica Garcia', gender: 'female'),
    RandomName(characterName: 'Ariel Dizon', gender: 'female'),
    RandomName(characterName: 'Catherine Reyes', gender: 'female'),
    RandomName(characterName: 'Lorenzo Ramos', gender: 'male'),
    RandomName(characterName: 'Lily Sanchez', gender: 'female'),
    RandomName(characterName: 'Paolo Torres', gender: 'male'),
    RandomName(characterName: 'Miguel Salazar', gender: 'male'),
    RandomName(characterName: 'Isabelle Cruz', gender: 'female'),
    RandomName(characterName: 'Samuel Matthews', gender: 'male'),
    RandomName(characterName: 'Kaitlyn Peterson', gender: 'female'),
    RandomName(characterName: 'Victoria Wong', gender: 'female'),
    RandomName(characterName: 'Antonio Rodriguez', gender: 'male'),
    RandomName(characterName: 'Jennifer Bell', gender: 'female'),
    RandomName(characterName: 'Henry Jackson', gender: 'male'),
    RandomName(characterName: 'Sarah Murphy', gender: 'female'),
    RandomName(characterName: 'Lucas Harrison', gender: 'male'),
    RandomName(characterName: 'Sophia Martinez', gender: 'female'),
    RandomName(characterName: 'Liam Turner', gender: 'male'),
    RandomName(characterName: 'Aidan Lopez', gender: 'male'),
    RandomName(characterName: 'Gabrielle Johnson', gender: 'female'),
    RandomName(characterName: 'Zara Thompson', gender: 'female'),
    RandomName(characterName: 'Mason Martinez', gender: 'male'),
    RandomName(characterName: 'Diana Sullivan', gender: 'female'),
    RandomName(characterName: 'Ethan Garcia', gender: 'male'),
    RandomName(characterName: 'Chloe Morgan', gender: 'female'),
    RandomName(characterName: 'Nathaniel Ward', gender: 'male'),
    RandomName(characterName: 'Elijah Clark', gender: 'male'),
    RandomName(characterName: 'Olivia Baker', gender: 'female'),
    RandomName(characterName: 'Benjamin Lewis', gender: 'male'),
    RandomName(characterName: 'Jessica Wright', gender: 'female'),
    RandomName(characterName: 'Hannah Mitchell', gender: 'female'),
    RandomName(characterName: 'William Harris', gender: 'male'),
    RandomName(characterName: 'Evelyn Peterson', gender: 'female'),
    RandomName(characterName: 'Gabriel Evans', gender: 'male'),
    RandomName(characterName: 'Julia Cook', gender: 'female'),
    RandomName(characterName: 'Luke Rogers', gender: 'male'),
    RandomName(characterName: 'Emily Price', gender: 'female'),
    RandomName(characterName: 'Michael Cooper', gender: 'male'),
    RandomName(characterName: 'Lola Santos', gender: 'female'),
    RandomName(characterName: 'Karla Gutierrez', gender: 'female'),
    RandomName(characterName: 'Julian Medina', gender: 'male'),
    RandomName(characterName: 'Chester Ramirez', gender: 'male'),
    RandomName(characterName: 'Adrian Williams', gender: 'male'),
    RandomName(characterName: 'Ruby Santiago', gender: 'female'),
  ];

  Timer? _processTimer;
  Timer? _waitingTimer;
  final Set<Orders> recentlyAddedOrders = {};
  int _nextOrderNo = 1;
  bool priorityNo = false;

  @override
  void initState() {
    super.initState();

    _processTimer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        for (var order in queueList) {
          if (order.processTime > 0) {
            order.processTime--;
            if (order.processTime == 0) {
              order.timeReachedZero = DateTime.now();
            }
          } else {
            order.delayTime++;
          }
        }
        refresh();
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
    final randomIndex2 = random.nextInt(randomFoods.length);
    final newOrder = Orders(
      name: randomNames[randomIndex].characterName,
      foods: randomFoods[randomIndex2].foodList,
      specifiedGender: randomNames[randomIndex].gender,
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

  void refresh() {
    setState(() {
      if (priorityNo == false) {
        queueList.sort((a, b) {
          if (a.processTime == 0 && b.processTime == 0) {
            return (a.timeReachedZero ?? DateTime.now())
                .compareTo(b.timeReachedZero ?? DateTime.now());
          } else if (a.processTime == 0) {
            return -1;
          } else if (b.processTime == 0) {
            return 1;
          } else {
            return a.processTime.compareTo(b.processTime);
          }
        });
      } else {
        queueList.sort((a, b) => a.orderNo.compareTo(b.orderNo));
      }
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
                  Text("Order No. : ${order.orderNo}", style: textName),
                  Text("Process Time: ${order.processTime}",
                      style: textTimeforProcessDialog),
                  Text("Delay Time: ${order.delayTime}",
                      style: textTimeforWaitingDialog),
                  Text("Waiting Time: ${order.waitingTime}",
                      style: textTimeforWaitingDialog),
                  space10,
                  Text(
                    'Food to be ordered: ',
                    style: textName,
                  ),
                  Text(
                    order.foods,
                    style: textName,
                  ),
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
      switchButton: Switch(
          value: priorityNo,
          onChanged: (bool value) {
            setState(() {
              priorityNo = value;
            });
            refresh();
          }),
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
                      q.specifiedGender == 'male' ? Icons.man : Icons.woman,
                      color: Colors.grey,
                    ),
                    title: Text(
                      q.name,
                      style: textName,
                    ),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
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
                            spaceW10,
                            textCenter(
                              "Waiting Time: ${q.waitingTime}",
                              style: textTimeforWaiting,
                            ),
                          ],
                        ),
                        if (q.processTime == 0) ...[
                          space10,
                          Flexible(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                minimumSize: Size(0, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () => _deleteQueueAtIndex(index),
                              icon: Icon(
                                Icons.check,
                                size: 20,
                                color: Colors.black,
                              ),
                              label: Text(
                                "Finish Order",
                                style: textButtonSmall,
                              ),
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
