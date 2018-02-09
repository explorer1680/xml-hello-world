package personal.xml.jaxp.trax.chain.handler;

import org.springframework.core.io.ClassPathResource;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;

public class ChainTestRun {
    public static void main(String[] args) throws IOException, TransformerConfigurationException, SAXException {

        StreamSource xsl1 = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/chain/handler/votes.xsl").getInputStream());
        StreamSource xsl2 = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/chain/handler/votesOnly.xsl").getInputStream());

        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        SAXTransformerFactory factory = (SAXTransformerFactory)transformerFactory;

        TransformerHandler handler1 = factory.newTransformerHandler(xsl1);
        TransformerHandler handler2 = factory.newTransformerHandler(xsl2);

        handler1.setResult(new SAXResult(handler2));
        handler2.setResult(new StreamResult(System.out));

        XMLReader reader = XMLReaderFactory.createXMLReader();

        reader.setContentHandler(handler1);

        reader.parse(new InputSource(new ClassPathResource("personal/xml/jaxp/trax/chain/handler/vote.xml").getInputStream()));
    }
}
