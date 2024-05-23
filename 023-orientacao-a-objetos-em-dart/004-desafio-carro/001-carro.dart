class Carro {

  int _velocidadeMaxima=0;
  int _velocidadeAtual=0;

  Carro ({int max_vel=100,int atual_vel=0}) {
    this._velocidadeMaxima = max_vel;
    this._velocidadeAtual = atual_vel;
  }

  get getVelocidadeMaxima {
    return this._velocidadeMaxima;
  }

  get getVelocidadeAtual {
    return this._velocidadeAtual;
  }

  void acelerar() {
    this._velocidadeAtual += 5;

    if (estaNoLimite() == true) {
      this._velocidadeAtual -= 5;
    }
  }

  void frear() {
    this._velocidadeAtual -= 5;

    if (estaNoLimite() == true) {
      this._velocidadeAtual = 0;
    }
  }

  bool estaNoLimite() {
    if (_velocidadeAtual > _velocidadeMaxima) {
      return true;
    }
    else if (_velocidadeAtual < 0) {
      return true;
    }
    else {
      return false;
    }
  }
}