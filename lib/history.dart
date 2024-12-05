import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/app_state.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  const History({super.key,});

  @override
  HistoryState createState() => HistoryState();
}

class HistoryState extends State<History> {
  final ScrollController _scrollController = ScrollController();

  void _clearHistory(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Clear History'),
          content: const Text('Are you sure you want to clear your history?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Provider.of<AppState>(context, listen: false).clearHistory();
                Navigator.of(context).pop();
              },
              child: const Text('Clear'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final hasHistoryData = appState.historyItems.isNotEmpty;

    // Reverse the order of history items
    final reversedHistoryItems = List.from(appState.historyItems.reversed);

    return Scaffold(
      backgroundColor: const Color(0xFF21985F),
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: MediaQuery.of(context).size.width / 2 - 70,
            child: const Text(
              'HISTORY',
              style: TextStyle(
                fontFamily: 'RubikMoonrocks',
                fontSize: 26,
                letterSpacing: 4,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            left: 0,
            top: 120,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recent Activity',
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: reversedHistoryItems.map((item) {
                            final formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(item.dateTime);

                            return ListTile(
                              title: Text(item.result, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500, fontFamily: 'Teko',)),
                              subtitle: Text('Date & Time: $formattedDateTime', style: const TextStyle(fontSize: 15, fontFamily: 'Abel',)),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: hasHistoryData
          ? FloatingActionButton(
        onPressed: () {
          _clearHistory(context);
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.delete),
      )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
