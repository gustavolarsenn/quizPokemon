import 'state.dart';

class StateMachine {
  int _step = 0;

  final List<State> _states = [
    State(
        text:
            "Paciente com glicemia capilar > 250mg/dL. \n\nHá sinais/sintomas de cetoacidose diabética ou estado hiperosmolar?",
        choice1: 'Sim',
        choice2: 'Não'),
    State(
        text: 'Há suspeita de doença intercorrente (excluindo emergências)?',
        choice1: 'Sim',
        choice2: 'Não'),
    State(
        text: 'Cetonúria disponível (Se indisponível, considerar negativa)?',
        choice1: 'Positiva',
        choice2: 'Negativa'),
    State(
        text:
            'Aplicar insulina regular e reavaliar glicemia capilar em 2 horas.\n\nGlicemia abaixo de 250mg/dL?',
        choice1: 'Sim',
        choice2: 'Não'),
    State(
        text:
            'Provável descompensação crônica. Ajustar tratamento (considerar insulina). Solicitar controle de glicemia capilar. Orientar sinais de alarme e reavaliação breve',
        choice1: 'Reiniciar'),
    State(
        text:
            'Encaminhar para emergência imediatamente. Monitorar sinais vitais. Realizar hidratação EV com SF 0,9% enquanto aguarda o transporte',
        choice1: 'Reiniciar'),
    State(
        text:
            'Tratar complicações agudas. Aumentar transitoriamente dose total de insulina até resolução do quadro.',
        choice1: 'Reiniciar'),
  ];

  void nextStep(int listPos) {
    _step = listPos;
  }

  String getStateText() {
    return _states[_step].text;
  }

  String getChoice1() {
    return _states[_step].choice1;
  }

  String? getChoice2() {
    return _states[_step].choice2;
  }

  void reset() {
    _step = 0;
  }

  void checkChoice(bool userChoice) {
    if (_states[_step].choice1 == 'Reiniciar') {
      reset();
    } else {
      getPath(userChoice);
    }
  }

  void getPath(bool userChoice) {
    if (_states[_step].text ==
            "Paciente com glicemia capilar > 250mg/dL. \n\nHá sinais/sintomas de cetoacidose diabética ou estado hiperosmolar?" &&
        userChoice) {
      nextStep(_states.indexWhere(((state) =>
          state.text ==
          'Encaminhar para emergência imediatamente. Monitorar sinais vitais. Realizar hidratação EV com SF 0,9% enquanto aguarda o transporte')));
      return;
    }
    if (_states[_step].text ==
            "Paciente com glicemia capilar > 250mg/dL. \n\nHá sinais/sintomas de cetoacidose diabética ou estado hiperosmolar?" &&
        !userChoice) {
      nextStep(_states.indexWhere(((state) =>
          state.text ==
          'Há suspeita de doença intercorrente (excluindo emergências)?')));
      return;
    }

    if (_states[_step].text ==
            'Há suspeita de doença intercorrente (excluindo emergências)?' &&
        userChoice) {
      nextStep(_states.indexWhere(((state) =>
          state.text ==
          'Cetonúria disponível (Se indisponível, considerar negativa)?')));
      return;
    }
    if (_states[_step].text ==
            'Há suspeita de doença intercorrente (excluindo emergências)?' &&
        !userChoice) {
      nextStep(_states.indexWhere(((state) =>
          state.text ==
          'Provável descompensação crônica. Ajustar tratamento (considerar insulina). Solicitar controle de glicemia capilar. Orientar sinais de alarme e reavaliação breve')));
      return;
    }

    if (_states[_step].text ==
            'Cetonúria disponível (Se indisponível, considerar negativa)?' &&
        userChoice) {
      nextStep(_states.indexWhere(((state) =>
          state.text ==
          'Encaminhar para emergência imediatamente. Monitorar sinais vitais. Realizar hidratação EV com SF 0,9% enquanto aguarda o transporte')));
      return;
    }
    if (_states[_step].text ==
            'Cetonúria disponível (Se indisponível, considerar negativa)?' &&
        !userChoice) {
      nextStep(_states.indexWhere(((state) =>
          state.text ==
          'Aplicar insulina regular e reavaliar glicemia capilar em 2 horas.\n\nGlicemia abaixo de 250mg/dL?')));
      return;
    }

    if (_states[_step].text ==
            'Aplicar insulina regular e reavaliar glicemia capilar em 2 horas.\n\nGlicemia abaixo de 250mg/dL?' &&
        userChoice) {
      nextStep(_states.indexWhere(((state) =>
          state.text ==
          'Tratar complicações agudas. Aumentar transitoriamente dose total de insulina até resolução do quadro.')));
      return;
    }
    if (_states[_step].text ==
            'Aplicar insulina regular e reavaliar glicemia capilar em 2 horas.\n\nGlicemia abaixo de 250mg/dL?' &&
        !userChoice) {
      nextStep(_states.indexWhere(((state) =>
          state.text ==
          'Encaminhar para emergência imediatamente. Monitorar sinais vitais. Realizar hidratação EV com SF 0,9% enquanto aguarda o transporte')));
      return;
    }
  }
}
