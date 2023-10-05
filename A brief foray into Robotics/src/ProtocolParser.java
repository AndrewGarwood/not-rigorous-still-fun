import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;


public class ProtocolParser {

    // indicate if the current packet is Wheel Velocity
    private boolean processingWheels;

    // indicate if the current packet is Vision Target
    private boolean processingVision;

    // Stores number of targets for a vision packet
    private int numTargets;

    // an array containing coordinates for (coordinateArray.length / 2) targets
    private int[] coordinateArray;

    /* integer representing the amount of words that still need to be processed in a Vision Packet
       Represented by 2 * (number of targets)
       decremented each time a word of the packet is processed
     */
    private int wordsRemaining;


    /* We want a way to store the packets that have been parsed.
       I chose a Queue so that we can get the packets in the order that we received.
       So each element of the queue is a packet with its respective information.

       _ (queue)
       + (Latest Packet Received) -> [2, 2, 1, 1, 3, 5] // vision, 2 targets + coordinates
       +
       +
       + (1st Packet Received) -> [1, 20, 0] // wheels, left and right speeds
       -

       The diagram unnecessary but I believe it gets my thinking across
    */
    private Queue<Packet> packetsReceived;

    // store contents of packet. Initially I was using this for both packet types, but as of now it's only used for the
    // wheel velocity packet. I think I could replace this with just a regular array to make it more consistent.
    // and perhaps there are performance differences I can consider.
    private List<Integer> currentPacket;


    public ProtocolParser() {
        // Instantiate default values for fields
        this.currentPacket = new ArrayList<Integer>();
        this.processingWheels = false;
        this.processingVision  = false;
        this.wordsRemaining = 0;

        this.packetsReceived = new LinkedList<Packet>();
    }

    /**
     *   This method takes in s word and determines what to do with it:
     *   i.e. Determine if we are already parsing a message:
     *               If yes:
     *                 Continue parsing that message
     *               else: (no, it's a new message)
     *                 start processing the new message
     *                 Determine the type of message, process accordingly
     *   @param newWord:  integer value from input stream fed into system
     */
    public void processNewWord(int newWord) {

        if (processingWheels) { // if we are currently processing a wheel packet
            processWheels(newWord);

        } else if (processingVision){ // if we are currently processing a vision packet
            processVision(newWord);

        } else { // not processing anything, it's a new message

            // clear previous message contents
            currentPacket.clear();

            // add word; in this case the packet's type indicator
            currentPacket.add(newWord);

            // determine type of packet
            if (newWord == 1) { // 1 represents Wheel packet
                processingWheels = true;
                processingVision = false;
            } else if (newWord == 2) { // 2 represents vision target packet
                processingWheels = false;
                processingVision = true;
            }
        }
    }

    /**
     * In this method, we continue building a Wheel Velocity packet from the input stream. Once it's complete,
     * we add it to the list of packets received
     * @param newWord: integer value from input stream fed into system. In this method, newWord represents either the
     *                 left speed or the right speed
     */
    private void processWheels(int newWord) {

        if (currentPacket.size() == 2) {
            // the wheel message size is 3 so we have the elements: [type, left speed, right speed]

            currentPacket.add(newWord); // adding the last element (right speed)
            processingWheels = false; // we have finished processing this packet, next word will be for new packet

            // add new packet to list/queue of packets received so far
            packetsReceived.add(new WheelVelocityPacket(currentPacket.get(1), currentPacket.get(2)));
        } else {
            // we still have to process the remaining contents
            currentPacket.add(newWord); // I'm pretty sure this is the left speed
        }
    }

    /**
     * In this method, we continue building a Vision Target packet from the input stream. Once it's complete,
     * we add it to the list of packets received. The length of this packet depends on the number of targets it has
     * such that: length = 2 + (number of targets * 2) where the initial '2' accounts for the type and number of targets
     *
     * @param newWord: integer value from input stream fed into system. In this method, newWord represents one of the
     *                 following things: the number of targets, a target's X Coordinate, or a target's y Coordinate
     */
    private void processVision(int newWord) {

        if (currentPacket.size() == 1) {
            /*
                If the current packet's size is one, that means we have only processed the type. This means that
                the next integer(word) we process will be the number of targets. I figure that I could use the number
                targets to determine how many more words I need to process before the end of the packet.
             */

            // In this instance, newWord represents the number of targets
            numTargets = newWord;

            // add the number of targets to the packet (second item of packet)
            currentPacket.add(newWord);

            // calculate the number of words remaining (coordinate values remaining)
            wordsRemaining = 2 * newWord;

            // Store the coordinates of each target in this array
            coordinateArray = new int[2 * numTargets];

        } else if (wordsRemaining > 0) { // we still have to process more coordinates

            // add the new coordinate to the array.
            coordinateArray[coordinateArray.length - wordsRemaining] = newWord;

            // decrement amount of words remaining to process
            wordsRemaining--;

            if (wordsRemaining == 0) {
                // we have received the last word (in this case, the y coordinate for the last target)

                // add the finished packet using the VisionTargetPacket class constructor
                packetsReceived.add(new VisionTargetPacket(numTargets, coordinateArray));
                processingVision = false;
            }
        }

    }

    /**
     *
     * @return : this getter returns the queue of packets that have been received.
     */
    public Queue<Packet> getPacketsReceived() {
        return packetsReceived;
    }
}