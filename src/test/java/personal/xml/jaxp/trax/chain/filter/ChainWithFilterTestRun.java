package personal.xml.jaxp.trax.chain.filter;

import org.springframework.core.io.ClassPathResource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLFilter;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

import javax.xml.XMLConstants;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;

public class ChainWithFilterTestRun {
    public static void main(String[] args) throws IOException, TransformerConfigurationException, SAXException {
        StreamSource xsl1 = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/chain/filter/votes.xsl").getInputStream());
        StreamSource xsl2 = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/chain/filter/votesOnly.xsl").getInputStream());

        TransformerFactory transformerFactory = TransformerFactory.newInstance();
//        TransformerFactory transformerFactory = TransformerFactory.newInstance("com.sun.org.apache.xalan.internal.xsltc.trax.TransformerFactoryImpl", null);

        
        transformerFactory.setAttribute(XMLConstants.ACCESS_EXTERNAL_DTD, "");
        transformerFactory.setAttribute(XMLConstants.ACCESS_EXTERNAL_STYLESHEET, "");
        
        SAXTransformerFactory factory = (SAXTransformerFactory)transformerFactory;

        XMLFilter filter1 = factory.newXMLFilter(xsl1);
        XMLFilter filter2 = factory.newXMLFilter(xsl2);

        XMLReader reader = XMLReaderFactory.createXMLReader();
        filter1.setParent(reader);
        filter2.setParent(filter1);

        TransformerHandler handler = factory.newTransformerHandler();
        handler.setResult(new StreamResult(System.out));

        filter2.setContentHandler(handler);

        String base = "src/test/java/";

        filter2.parse(base + "personal/xml/jaxp/trax/chain/filter/vote.xml");
    }
}
