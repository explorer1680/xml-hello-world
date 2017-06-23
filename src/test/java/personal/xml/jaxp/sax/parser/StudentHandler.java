package personal.xml.jaxp.sax.parser;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class StudentHandler extends DefaultHandler {

    private static final String STUDENT = "student";
    private static final String ROLL_NO = "rollno";
    private static final String FIRSTNAME = "firstname";
    private static final String LASTNAME = "lastname";
    private static final String NICKNAME = "nickname";
    private static final String MARKS = "marks";

    boolean bFirstName = false;
    boolean bLastName = false;
    boolean bNickName = false;
    boolean bMarks = false;

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
//        System.out.println("------------------------------------------in startElement");
        if (qName.equalsIgnoreCase(STUDENT)) {
            String rollNo = attributes.getValue(ROLL_NO);
            System.out.println("Roll No : " + rollNo);
        }else if (qName.equalsIgnoreCase(FIRSTNAME)){
            bFirstName = true;
        }else if (qName.equalsIgnoreCase(LASTNAME)){
            bLastName = true;
        }else if (qName.equalsIgnoreCase(NICKNAME)){
            bNickName = true;
        }else if(qName.equalsIgnoreCase(MARKS)){
            bMarks = true;
        }
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
//        System.out.println("+++++++++++++++++++++++++++++++++++++++in endElement");
        if(qName.equalsIgnoreCase(STUDENT)){
            System.out.println("End Element : " + qName);
        }
    }

    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
//        System.out.println("=======================================in characters");
        if (bFirstName){
            System.out.println("First Name: " + new String(ch, start,length));
            bFirstName = false;
        }else if (bLastName){
            System.out.println("Last Name: " + new String(ch, start,length));
            bLastName = false;
        }else if (bNickName){
            System.out.println("Nick Name: " + new String(ch, start,length));
            bNickName = false;
        }else if(bMarks){
            System.out.println("Marks: " + new String(ch, start,length));
            bMarks = false;
        }
    }
}
