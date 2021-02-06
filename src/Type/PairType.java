package Type;

public class PairType implements Type {

    private Type fstType;
    private Type sndType;
    
    public PairType(Type fstType, Type sndType) {
        this.fstType = fstType;
        this.sndType = sndType;
    }

    public Type getFstType() {
        return fstType;
    }

    public Type getSndType() {
        return sndType;
    }

    public void setFstType(Type fstType) {
        this.fstType = fstType;
    }

    public void setSndType(Type sndType) {
        this.sndType = sndType;
    }

    @Override
    public String toString() {
        return "Pair<" + fstType.toString() + ", " + sndType.toString() + ">";
    }

    @Override
    public boolean equalToType(Type other) {
        if (!(this.getClass().equals(other.getClass()))) {
            return false;
        }

        PairType otherPair = (PairType) other;
        return this.fstType.equalToType(otherPair.getFstType())
                && this.sndType.equalToType(otherPair.getSndType());
    }
    
}
