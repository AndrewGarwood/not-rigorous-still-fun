public class TargetCoordinate {

    // this number identifies when the target was processed; by the order in which it was received by the input stream
    private int targetNumber;

    private int xCoord;
    private int yCoord;

    /**
     * Zero Argument Constructor
     */
    public TargetCoordinate() {
        this(0, 0);
    }

    /**
     *
     * @param xCoord: x coordinate of a target
     * @param yCoord: y coordinate of a target
     */
    public TargetCoordinate(int xCoord, int yCoord) {
        this(xCoord, yCoord, 0);
    }

    /**
     *
     * @param xCoord: x coordinate of a target
     * @param yCoord: y coordinate of a target
     * @param targetNumber: number identifying target
     */
    public TargetCoordinate(int xCoord, int yCoord, int targetNumber) {
        this.xCoord = xCoord;
        this.yCoord = yCoord;
        this.targetNumber = targetNumber;
    }

    public int getxCoord() {
        return this.xCoord;
    }

    public void setxCoord(int xCoord) {
        this.xCoord = xCoord;
    }

    public int getyCoord() {
        return yCoord;
    }

    public void setyCoord(int yCoord) {
        this.yCoord = yCoord;
    }

    public int getTargetNumber() {
        return targetNumber;
    }

    public void setTargetNumber(int targetNumber) {
        this.targetNumber = targetNumber;
    }

    /**
     *
     * @return : String representation of a TargetCoordinate
     */
    public String toString() {
        return "Target " + (this.targetNumber + 1) + " at (X = " + xCoord + ", Y = " + yCoord + ")";
    }
}
