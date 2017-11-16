package personal.xml.jaxp.sax.reader;

import org.springframework.core.io.ClassPathResource;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.IOException;

public class ReaderTestRun {
    public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException {
        SAXParserFactory factory = SAXParserFactory.newInstance();
        SAXParser parser = factory.newSAXParser();
//        XMLReader reader = parser.getXMLReader();
        XMLReader reader = XMLReaderFactory.createXMLReader();

        System.out.println(reader.getClass());

        EmployeeHandler employeeHandler = new EmployeeHandler();
        reader.setContentHandler(employeeHandler);
        reader.parse(new InputSource(new ClassPathResource("personal/xml/jaxp/sax/reader/employee.xml").getInputStream()));

        Company company = employeeHandler.retrieveCompany();

        System.out.println(company);
    }
}
