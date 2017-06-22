package personal.xml.jaxp.trax.saxsource;

import org.springframework.core.io.ClassPathResource;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

import javax.xml.transform.*;
import javax.xml.transform.sax.SAXSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;

public class SaxSourceTestRun {
    public static void main(String[] args) throws SAXException, IOException, TransformerException {
        String parserClass = "org.apache.crimson.parser.XMLReaderImpl";
        XMLReader reader = XMLReaderFactory.createXMLReader(parserClass);
        SAXSource source = new SAXSource(reader, new InputSource(new ClassPathResource("personal/xml/jaxp/trax/saxsource/vote.xml").getInputStream()));

        StreamSource xsl = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/saxsource/votes.xsl").getInputStream());

        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer transformer = factory.newTransformer(xsl);

        transformer.transform(source,new StreamResult(System.out));

    }
}
