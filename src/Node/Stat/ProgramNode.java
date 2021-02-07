package Node.Stat;

import Node.Node;

import java.util.List;

public class ProgramNode implements Node {

  private final List<FuncNode> functions;
  private final ScopeNode body;

  public ProgramNode(List<FuncNode> functions, ScopeNode body) {
    this.functions = functions;
    this.body = body;
  }

  public boolean allFunctionsLeaveAtEnd() {
    // for (FuncNode node : functions) {
    //   if (!node.getBody().hasEnd()) {
    //     return false;
    //   }
    // }
    // return true;
    return false;
  }

}
