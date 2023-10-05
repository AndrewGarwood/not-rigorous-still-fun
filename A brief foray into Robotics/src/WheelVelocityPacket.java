public class WheelVelocityPacket implements Packet {

    private int leftVelocity;

    private int rightVelocity;

    /**
     * Zero Argument Constructor
     */
    public WheelVelocityPacket() {
        this.leftVelocity = 0;
        this.rightVelocity = 0;
    }

    /**
     *
     * @param leftVelocity: integer argument representing wheel's left speed in mm / s
     * @param rightVelocity: integer argument representing wheel's right speed in mm / s
     */
    public WheelVelocityPacket(int leftVelocity, int rightVelocity) {
        this.leftVelocity = leftVelocity;
        this.rightVelocity = rightVelocity;
    }

    /**
     *
     * @return : String representation of packet's type
     */
    @Override
    public String getPacketType() {
        return "Wheel Velocity Packet";
    }

    /**
     *
     * @return : integer value of left velocity
     */
    public int getLeftVelocity() {
        return this.leftVelocity;
    }

    /**
     *
     * @param newLeftVelocity: value of new left velocity
     */
    public void setLeftVelocity(int newLeftVelocity) {
        this.leftVelocity = newLeftVelocity;
    }

    /**
     *
     * @return : integer value of right velocity
     */
    public int getRightVelocity() {
        return this.rightVelocity;
    }

    /**
     *
     * @param newLeftVelocity: value of new right velocity
     */
    public void setRightVelocity(int newRightVelocity) {
        this.rightVelocity = newRightVelocity;
    }


    /**
     *
     * @return : String representation of a Wheel Velocity Packet
     */
    public String toString() {
        return this.getPacketType() + ": \n" + "\tLeft Velocity: " + this.leftVelocity + "\n" +
                "\tRight Velocity: " + this.rightVelocity;
    }
}
