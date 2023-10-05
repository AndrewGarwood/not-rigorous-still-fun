import java.util.List;
import java.util.Queue;

public class ProtocolParserDriver {

    // using this class to test implementation
    public static void main(String[] args) {

        ProtocolParser parser = new ProtocolParser();

        // test wheel message
        int[] wheelMessage = {1, 20, 20};
        for (int word: wheelMessage) {
            parser.processNewWord(word);
        }

        // test visionMessage
        int[] visionMessage = {2, 2, 1, 1, 3, 3};
        for (int word: visionMessage) {
            parser.processNewWord(word);
        }

        // test with wheel followed by vision packets
        int[] combinedMessage = {1, 50, 10, 2, 3, 1, 1, 2, 2, 3, 3};
        for (int word: combinedMessage) {
            parser.processNewWord(word);
        }

        // test with vision followed by wheel packet
        int[] combinedMessage2 = {2, 1, 1, 1, 1, 30, 5};
        for (int word: combinedMessage2) {
            parser.processNewWord(word);
        }

        // print all packets received
        Queue<Packet> packetsReceived = parser.getPacketsReceived();
        int packetNumber = 1;
        for (Packet packet: packetsReceived) {
            System.out.println(packetNumber + ":  " + packet + "\n");
            packetNumber++;
        }
    }
}
