import 'state.dart';

class StateMachine {
  final List<State> _states = [
    State(
        text:
            'Paciente com glicemia capilar > 250mg/dL. \n\nHá sinais/sintomas de cetoacidose diabética ou estado hiperosmolar?',
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
}
