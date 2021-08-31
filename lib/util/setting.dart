class Setting {
  int _starTime;
  int _stopTime;
  int _quarter;
  int _score1;
  int _score2;
  int _foul1;
  int _foul2;

  @override
  String toString() {
    return 'Setting{_starTime: $_starTime, _stopTime: $_stopTime, _quarter: $_quarter, _score1: $_score1, _score2: $_score2, _foul1: $_foul1, _foul2: $_foul2}';
  }

  Setting(this._starTime, this._stopTime, this._quarter, this._score1,
      this._score2, this._foul1, this._foul2);

  int get foul2 => _foul2;

  set foul2(int value) {
    _foul2 = value;
  }

  int get foul1 => _foul1;

  set foul1(int value) {
    _foul1 = value;
  }

  int get score2 => _score2;

  set score2(int value) {
    _score2 = value;
  }

  int get score1 => _score1;

  set score1(int value) {
    _score1 = value;
  }

  int get quarter => _quarter;

  set quarter(int value) {
    _quarter = value;
  }

  int get stopTime => _stopTime;

  set stopTime(int value) {
    _stopTime = value;
  }

  int get starTime => _starTime;

  set starTime(int value) {
    _starTime = value;
  }
}
