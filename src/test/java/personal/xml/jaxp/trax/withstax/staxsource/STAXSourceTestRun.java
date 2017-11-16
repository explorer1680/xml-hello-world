package personal.xml.jaxp.trax.withstax.staxsource;

import org.springframework.core.io.ClassPathResource;
import org.xml.sax.InputSource;

import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXSource;
import javax.xml.transform.stax.StAXSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;

public class STAXSourceTestRun {
    public static void main(String[] args) throws TransformerException, IOException, XMLStreamException {

        StreamSource source = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/withstax/staxsource/vote.xml").getInputStream());

        TransformerFactory factory = TransformerFactory.newInstance();

        XMLInputFactory xmlInputFactory = XMLInputFactory.newInstance();
        XMLEventReader xmlEventReader = xmlInputFactory.createXMLEventReader(new ClassPathResource("personal/xml/jaxp/trax/withstax/staxsource/votes.xsl").getInputStream());

        StAXSource xsl = new StAXSource(xmlEventReader);

        Transformer transformer = factory.newTransformer(xsl);

        transformer.transform(source, new StreamResult(System.out));
    }
}