/**
 * @kind path-problem
 * @id temp
 * @severity high
 */

import cpp
import semmle.code.cpp.dataflow.new.DataFlow
import semmle.code.cpp.dataflow.new.TaintTracking

module FlowConfig implements DataFlow::ConfigSig {

  predicate isSource(DataFlow::Node source) {
    source.asExpr() instanceof Literal
  }

  predicate isSink(DataFlow::Node sink) {
    any(AddExpr addExpr).getAnOperand() = sink.asExpr()
  }

}

module Flow = TaintTracking::Global<FlowConfig>;

import Flow::PathGraph

from Flow::PathNode source, Flow::PathNode sink
where Flow::flowPath(source, sink)
select sink, source, sink, "Flow"
