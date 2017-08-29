// Copyright (c) 2017, Richard Ambler. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of function_tree;

// A tree node with a single child node.
class _Branch extends _FunctionTree {
  _Branch(this.child, List<String> variableNames) : super(variableNames);
  _FunctionTree child;
  @override
  String toString() => tex.replaceFirst("C", child.toString());
}

// Branches

class _FunctionBranch extends _Branch {
  _FunctionBranch(_FunctionTree child, Function composite,
      String latexRepresentation, List<String> variableNames)
      : super(child, variableNames) {
    f = (List<num> variables) => composite(child(variables));
    tex = latexRepresentation;
  }
}

class _ParenthesisBranch extends _Branch {
  _ParenthesisBranch(_FunctionTree child, List<String> variableNames)
      : super(child, variableNames) {
    f = (List<num> variables) => child(variables);
    tex = r"\left( C \right) ";
  }
}

class _NegativeBranch extends _Branch {
  _NegativeBranch(_FunctionTree child, List<String> variableNames)
      : super(child, variableNames) {
    f = (List<num> variables) => -child(variables);
    tex = "-C ";
  }
}

class _PositiveBranch extends _Branch {
  _PositiveBranch(_FunctionTree child, List<String> variableNames)
      : super(child, variableNames) {
    f = (List<num> variables) => child(variables);
    tex = "C ";
  }
  @override
  String toString() => tex.replaceFirst("C", child.toString());
}
