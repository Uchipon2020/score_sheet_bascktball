import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScoreSheet extends StatefulWidget {
  const ScoreSheet({Key? key}) : super(key: key);

  @override
  ScoreSheetState createState() => ScoreSheetState();
}

class ScoreSheetState extends State<ScoreSheet> {
  int _timerMinutesValue = 6;
  int _timerSecondsValue = 0;
  int _timerMilliValue = 0;
  bool _paused = true;

  final Stream<int> _periodicStream =
      Stream.periodic(const Duration(milliseconds: 10), (i) => i);
  int _previousStreamValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(8),
      child: StreamBuilder(
        stream: this._periodicStream,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != this._previousStreamValue) {
              print('SCORE SHEET TIMER');
              this._previousStreamValue = snapshot.data!;
              if (!_paused) {
                this._timerMilliValue--;
                if (_timerMilliValue < 0) {
                  _timerMilliValue = 99;
                  this._timerSecondsValue--;
                  if (_timerSecondsValue < 0) {
                    _timerSecondsValue = 59;
                    this._timerMinutesValue--;
                    if (_timerMinutesValue < 0) {
                      this._paused = true;
                    }
                  }
                }
              }
            }
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('MAIN TIME'),
              Card(child: _buildTimerUI()),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTimerUI() {
    return Column(
      children: <Widget>[
        Text(
          '${_timerMinutesValue.toString().padLeft(2, '0')} : ${_timerSecondsValue.toString().padLeft(2, '0')} : ${_timerMilliValue.toString().padLeft(2, '0')}',
          style: //Theme.of(context).textTheme.headline2,
              const TextStyle(
            fontSize: 64,
            fontFeatures: [
              FontFeature.tabularFigures(),
            ],
          ),
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              alignment: Alignment.centerLeft,
              icon: Icon(this._paused ? Icons.play_arrow : Icons.pause),
              onPressed: () => setState(() => this._paused = !this._paused),
            ),
            IconButton(
              alignment: Alignment.center,
              icon: const Icon(Icons.stop),
              onPressed: () => setState(
                () {
                  this._timerMinutesValue = 6;
                  this._timerSecondsValue = 0;
                  this._timerMilliValue = 0;
                  this._paused = true;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
