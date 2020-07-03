package personal.xml.jaxp.entity.stax;

import java.io.IOException;

import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stax.StAXSource;
import javax.xml.transform.stream.StreamResult;

import org.springframework.core.io.ClassPathResource;

public class StaxEventReader {
    public static void main(String[] args) throws TransformerException, IOException, XMLStreamException {

        XMLInputFactory xmlInputFactory = XMLInputFactory.newInstance();
        xmlInputFactory.setProperty(XMLInputFactory.SUPPORT_DTD, false);
//        XMLEventReader xmlEventReader = xmlInputFactory.createXMLEventReader(new ClassPathResource("personal/xml/jaxp/entity/dom/xxe_inject.xml").getInputStream());
        XMLEventReader xmlEventReader = xmlInputFactory.createXMLEventReader(new ClassPathResource("personal/xml/jaxp/entity/dom/entity1.xml").getInputStream());

        StAXSource source = new StAXSource(xmlEventReader);

        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer transformer = factory.newTransformer();

        transformer.transform(source, new StreamResult(System.out));
    }
}
