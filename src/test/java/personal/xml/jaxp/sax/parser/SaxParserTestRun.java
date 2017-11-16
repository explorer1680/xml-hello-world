package personal.xml.jaxp.sax.parser;

import org.springframework.core.io.ClassPathResource;
import org.xml.sax.SAXException;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.IOException;

public class SaxParserTestRun {
    public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException {
        SAXParserFactory factory = SAXParserFactory.newInstance();
        SAXParser parser = factory.newSAXParser();
        StudentHandler handler = new StudentHandler();

        System.out.println(parser.getClass());
        System.out.println(parser.getXMLReader().getClass());
        parser.parse(new ClassPathResource("personal/xml/jaxp/sax/parser/student.xml").getInputStream(), handler);
    }
}
