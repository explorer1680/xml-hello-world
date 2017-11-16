package personal.xml.jaxp.trax.withsax.saxresult;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class DataProcessor extends DefaultHandler {
    public DataProcessor() {
        super();
    }

    StringBuffer thisText = new StringBuffer();
    int sTally = 0;
    int dTally = 0;

    public static void println(String arg) {
        System.out.println(arg);
    }

    public void outputResults() {
        println("Sparkle: " + sTally + "  Dregraal: " + dTally);
    }

    public void endDocument() {
        outputResults();
    }

    public void startElement(String namespaceUri, String localName,
                             String qualifiedName, Attributes attributes) {
        thisText.delete(0, thisText.length());
    }

    public void endElement(String namespaceUri, String localName,
                           String qualifiedName) throws SAXException {
        if (localName.equals("candidate")) {
            if (thisText.toString().equals("Sparkle")) {
                sTally = sTally + 1;
            } else if (thisText.toString().equals("Dregraal")) {
                dTally = dTally + 1;
            }
        }
        thisText.delete(0, thisText.length());
    }

    public void characters(char[] ch, int start, int length) {
        thisText.append(ch, start, length);
    }

}
