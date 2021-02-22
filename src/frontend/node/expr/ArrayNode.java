package frontend.node.expr;

import frontend.type.ArrayType;
import frontend.type.Type;

import utils.NodeVisitor;
import java.util.List;

public class ArrayNode extends ExprNode {

  /**
   * Represent an array. Notice that the `content` will store nodes with correct type, not
   * ArrayElemNode
   * Example: [1, 2, 3, 4, 5]
   */

  private int length;
  private List<ExprNode> content;

  public ArrayNode(Type contentType, List<ExprNode> content, int length) {
    this.content = content;
    this.length = length;
    this.type = new ArrayType(contentType);
  }

  public int getLength() {
    return length;
  }

  public ExprNode getElem(int index) {
    return this.content.get(index);
  }

  public void setElem(int index, ExprNode value) {
    this.content.set(index, value);
  }

  public void setAllElem(List<ExprNode> content) {
    this.content = content;
    this.length = content.size();
  }

  public List<ExprNode> getContent() {
    return content;
  }

  @Override
  public <T> T accept(NodeVisitor<T> visitor) {
    return visitor.visitArrayNode(this);
  }

}
