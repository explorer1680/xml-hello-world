package personal.xml.jaxp.trax.withsax.saxtransformer;

import org.springframework.core.io.ClassPathResource;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;

public class SaxTfansformerTestRun {

    public static void main(String[] args) throws SAXException, IOException, TransformerConfigurationException {

        StreamSource xsl = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/withsax/saxtransformer/votes.xsl").getInputStream());

        TransformerFactory factory = TransformerFactory.newInstance();
        SAXTransformerFactory saxTransFactory = (SAXTransformerFactory) factory;
        TransformerHandler trans = saxTransFactory.newTransformerHandler(xsl);
        trans.setResult(new StreamResult(System.out));

        XMLReader reader = XMLReaderFactory.createXMLReader();

        reader.setContentHandler(trans);

        reader.parse(new InputSource(new ClassPathResource("personal/xml/jaxp/trax/withsax/saxtransformer/vote.xml").getInputStream()));
    }
}


