part of function_tree;

abstract class _Fork extends _Node {
  _Node left, right;
}

class _SumFork extends _Fork {
  _SumFork(_Node left, _Node right) {
    this
      ..left = left
      ..right = right;
  }

  @override
  num call(Map<String, num> variables) => left(variables) + right(variables);

  @override
  String toTeX() => '${left.toTeX()} + ${right.toTeX()} ';
}

class _DifferenceFork extends _Fork {
  _DifferenceFork(_Node left, _Node right) {
    this
      ..left = left
      ..right = right;
  }

  @override
  num call(Map<String, num> variables) => left(variables) - right(variables);

  @override
  String toTeX() => '${left.toTeX()} - ${right.toTeX()} ';
}

class _ProductFork extends _Fork {
  _ProductFork(_Node left, _Node right) {
    this
      ..left = left
      ..right = right;
  }

  @override
  num call(Map<String, num> variables) => left(variables) * right(variables);

  @override
  String toTeX() => r'L \cdot R'
      .replaceFirst('L', left.toTeX())
      .replaceFirst('R', right.toTeX());
}

class _QuotientFork extends _Fork {
  _QuotientFork(_Node left, _Node right) {
    this
      ..left = left
      ..right = right;
  }

  @override
  num call(Map<String, num> variables) => left(variables) / right(variables);

  @override
  String toTeX() => r'\frac{L}{R} '
      .replaceFirst('L', left.toTeX())
      .replaceFirst('R', right.toTeX());
}

class _RemainderFork extends _Fork {
  _RemainderFork(_Node left, _Node right) {
    this
      ..left = left
      ..right = right;
  }

  @override
  num call(Map<String, num> variables) => left(variables) % right(variables);

  @override
  String toTeX() => r'{L} \bmod {R} '
      .replaceFirst('L', left.toTeX())
      .replaceFirst('R', right.toTeX());
}

class _PowerFork extends _Fork {
  _PowerFork(_Node left, _Node right) {
    this
      ..left = left
      ..right = right;
  }

  @override
  num call(Map<String, num> variables) =>
      pow(left(variables), right(variables));

  @override
  String toTeX() => r'L^{R} '
      .replaceFirst('L', left.toTeX())
      .replaceFirst('R', right.toTeX());
}
