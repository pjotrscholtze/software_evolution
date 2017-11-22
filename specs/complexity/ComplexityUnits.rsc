module specs::complexity::ComplexityUnits

import IO;
import String;
import List;
import Set;
import ParseTree;
import util::FileSystem;


import lang::java::m3::Core;
import lang::java::m3::AST;
import lang::java::\syntax::Java15;
import specs::helpers::M3;
import specs::helpers::Loc;

import assignments::helpers::Defaults;
import assignments::metrics::ComplexityPerUnit;

str CLASS_NAME = "ComplexityUnits";

private void onlyIfTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "onlyIf");
  assertEquality(cyclomaticComplexity(method), 2, "onlyIfTest");
}

private void ifElseTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "ifElse");
  assertEquality(cyclomaticComplexity(method), 2, "ifElseTest");
}

private void doWhileTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "doWhile");
  assertEquality(cyclomaticComplexity(method), 2, "doWhileTest");
}

private void whileTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "normalWhile");
  assertEquality(cyclomaticComplexity(method), 2, "whileTest");
}

private void forTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "normalFor");
  assertEquality(cyclomaticComplexity(method), 2, "forTest");
}

private void forEachTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "forEach");
  assertEquality(cyclomaticComplexity(method), 2, "forEachTest");
}

private void singleCaseTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "singleCase");
  assertEquality(cyclomaticComplexity(method), 3, "singleCaseTest");
}

private void multipleCaseTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "multipleCase");
  assertEquality(cyclomaticComplexity(method), 4, "multipleCaseTest");
}

private void singleCatchTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "singleCatch");
  assertEquality(cyclomaticComplexity(method), 2, "singleCatchTest");
}

private void multipleCatchTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "multipleCatch");
  assertEquality(cyclomaticComplexity(method), 3, "multipleCatchTest");
}

private void conditionalTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "conditional");
  assertEquality(cyclomaticComplexity(method), 2, "conditionalTest");
}

private void singleConjunctionTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "singleConjunction");
  assertEquality(cyclomaticComplexity(method), 2, "singleConjunctionTest");
}

private void singleDisjunctionTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "singleDisjunction");
  assertEquality(cyclomaticComplexity(method), 2, "singleDisjunctionTest");
}

private void multipleConjunctionTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "multipleConjunction");
  assertEquality(cyclomaticComplexity(method), 3, "multipleConjunctionTest");
}

private void multipleDisjunctionTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "multipleDisjunction");
  assertEquality(cyclomaticComplexity(method), 3, "multipleDisjunctionTest");
}

private void e2eTest(M3 m3) {
  MethodBody method = getMethodBodyFromM3(m3, CLASS_NAME, "e2e");
  assertEquality(cyclomaticComplexity(method), 20, "e2eTest");
}

list[&T] testables = [
  onlyIfTest,
  ifElseTest,
  doWhileTest,
  whileTest,
  forTest,
  forEachTest,
  singleCaseTest,
  multipleCaseTest,
  singleCatchTest,
  multipleCatchTest,
  conditionalTest,
  singleConjunctionTest,
  singleDisjunctionTest,
  multipleConjunctionTest,
  multipleDisjunctionTest,
  e2eTest
];

public void complexityUnitsRunner(path) {
  println("<CLASS_NAME>:");

  M3 m3 = loadM3(path);
  mapF(testables, void (void(M3) fn) { fn(m3); });
  println();
}
