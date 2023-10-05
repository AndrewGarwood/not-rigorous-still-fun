import java.util.ArrayList;
import java.util.List;

public class VisionTargetPacket implements Packet {

    private int numTargets;

    private int[] coordinateArray;

    private List<TargetCoordinate> targetCoordinates;

    /**
     * Zero Argument Constructor
     */
    public VisionTargetPacket() {
        this(0);
    }

    /**
     *
     * @param numTargets: number of targets in vision packet
     */
    public VisionTargetPacket(int numTargets) {
        this(numTargets, new int[2 *numTargets]);
    }

    /**
     *
     * @param numTargets: number of targets in vision packet
     * @param coordinateArray: array containing targets' coordinates
     */
    public VisionTargetPacket(int numTargets, int[] coordinateArray) {
        this.numTargets = numTargets;
        this.coordinateArray = coordinateArray;
        this.targetCoordinates = this.organizeTargets(coordinateArray, new ArrayList<TargetCoordinate>());
    }

    /**
     *
     * @param coordinateArray: array containing targets' coordinates
     * @param targetCoordinates: List where TargetCoordinates will be stored
     * @return : A list of TargetCoordinates i.e. pairs of x,y coordinates with a number representing the order in which
     *           it was received
     */
    private List<TargetCoordinate> organizeTargets(int[] coordinateArray, List<TargetCoordinate> targetCoordinates) {
        for (int i = 0; i < coordinateArray.length; i += 2) {
            targetCoordinates.add(new TargetCoordinate(coordinateArray[i], coordinateArray[i + 1],
                    (i + 1) / 2));
        }
        return targetCoordinates;
    }

    /**
     *
     * @return : String representation of packet's type
     */
    @Override
    public String getPacketType() {
        return "Vision Target Packet";
    }

    /**
     *
     * @return : the number of targets
     */
    public int getNumTargets() {
        return numTargets;
    }

    /**
     *
     * @param numTargets: new number of targets to use
     */
    public void setNumTargets(int numTargets) {
        this.numTargets = numTargets;
    }

    /**
     *
     * @return : int array of coordinates (not in pairs i.e. not of the form TargetCoordinate.class)
     */
    public int[] getCoordinateArray() {
        return coordinateArray;
    }

    /**
     *
     * @param newArray : a new int array containing coordinates (not in pairs i.e. not containing TargetCoordinates)
     */
    public void setCoordinateArray(int[] newArray) {
        this.coordinateArray = newArray;
    }

    /**
     *
     * @return : List of coordinates
     */
    public List<TargetCoordinate> getTargetCoordinates() {
        return targetCoordinates;
    }

    /**
     *
     * @param newList : new list of TargetCoordinates
     */
    public void setTargetCoordinates(List<TargetCoordinate> newList) {
        this.targetCoordinates = newList;
    }

    /**
     *
     * @return : String representation of a Vision Target Packet
     */
    public String toString() {
        String result = this.getPacketType() + ": "  + numTargets + " target(s)" + "\n";
        for (TargetCoordinate coord: targetCoordinates) {
            result = result + "\t" + coord.toString() + "\n";
        }
        return result;
    }
}
