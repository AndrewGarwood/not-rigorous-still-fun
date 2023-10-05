interface Packet {
    // want to keep track of packet types and contents
    /*
        As of right now this interface does not seem entirely necessary but I'm sure there are ways to expand upon it
        if there were more functions to add to the packets. Maybe inheritance would be better, I will review
     */

    /**
     *
     * @return : This method returns the type of the packet in the form of a string
     */
    public String getPacketType();
}