package personal.xml.jaxp.trax.transformerhandler;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

import javax.xml.transform.Source;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;

public class TransformerHandlerTestRun {
    public static void main(String[] args) throws IOException, TransformerConfigurationException, SAXException {
        TransformerFactory factory = TransformerFactory.newInstance();

        StreamSource xslFile = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/transformerhandler/votes.xsl").getInputStream());

//        StreamSource source = new StreamSource(new FileSystemResource("C:/Temp/vote.xml").getInputStream());
//        System.out.println(source);
//        Source xslFile = factory.getAssociatedStylesheet(source, null, null, null);

        SAXTransformerFactory saxFactory = (SAXTransformerFactory) factory;

        TransformerHandler handler = saxFactory.newTransformerHandler(xslFile);
        handler.setResult(new StreamResult(System.out));

        XMLReader reader = XMLReaderFactory.createXMLReader();
        reader.setContentHandler(handler);

        reader.parse(new InputSource(new ClassPathResource("personal/xml/jaxp/trax/transformerhandler/vote.xml").getInputStream()));
    }
}
