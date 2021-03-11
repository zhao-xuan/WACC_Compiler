package backend.intel.instructions.arithmetic;

import backend.arm.instructions.addressing.Operand2;
import utils.backend.register.Register;

public class Or extends IntelArithmeticLogic {

  protected Or(Register rd,
      Register rn, Operand2 operand2) {
    super(rd, rn, operand2);
  }

  @Override
  public String assemble() {
    return null;
  }
}
