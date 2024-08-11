import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorCubit extends Cubit<String> {
  CalculatorCubit() : super('0');

  static CalculatorCubit get(context) => BlocProvider.of(context);

  String _expression = '';
  bool _justCalculated = false;

  void numberPressed(String number) {
    if (_justCalculated) {
      _expression = '';
      emit(number);
      _justCalculated = false;
    } else {
      if (state == '0') {
        emit(number);
      } else {
        emit(state + number);
      }
    }
    _expression += number;
  }

  void operationPressed(String operation) {
    if (_justCalculated) {
      _expression = state;
      _justCalculated = false;
    }
    emit(state + operation);
    _expression += operation;
  }

  void deleteLast() {
    if (state.isNotEmpty && state != '0') {
      emit(state.substring(0, state.length - 1));
      _expression = _expression.substring(0, _expression.length - 1);
      if (state.isEmpty) {
        emit('0');
      }
    }
  }

  void calculate() {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(_expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      emit(result.toString());
      _expression = result.toString();
      _justCalculated = true;
    } catch (e) {
      emit("Error");
      _expression = '';
      _justCalculated = false;
    }
  }

  void clear() {
    emit('0');
    _expression = '';
    _justCalculated = false;
  }

  void selectExpr(String expr) {
    switch (expr) {
      case '0' ||
            '1' ||
            '2' ||
            '3' ||
            '4' ||
            '5' ||
            '6' ||
            '7' ||
            '8' ||
            '9' ||
            '.':
        numberPressed(expr);
      case '+' || '-' || '*' || '/' || '%':
        operationPressed(expr);
      case 'C':
        clear();
      case 'del':
        deleteLast();
      case '=':
        calculate();

      default:
    }
  }
}
