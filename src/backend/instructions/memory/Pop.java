package backend.instructions.memory;

import backend.instructions.Instruction;
import java.util.List;
import utils.backend.Register;

public class Pop extends Instruction {

  private List<Register> reglist;

  public Pop(List<Register> reglist) {
    this.reglist = reglist;
  }

  @Override
  public String assemble() {
    return "POP {" + reglist + "}";
  }
}
