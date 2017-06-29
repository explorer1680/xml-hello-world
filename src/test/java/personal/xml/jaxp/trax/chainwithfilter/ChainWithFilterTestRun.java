package personal.xml.jaxp.trax.chainwithfilter;

import javafx.scene.chart.XYChart;
import org.springframework.core.io.ClassPathResource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLFilter;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;

public class ChainWithFilterTestRun {
    public static void main(String[] args) throws IOException, TransformerConfigurationException, SAXException {
        StreamSource xsl1 = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/chainwithfilter/votes.xsl").getInputStream());
        StreamSource xsl2 = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/chainwithfilter/votesOnly.xsl").getInputStream());

        TransformerFactory transformerFactory = TransformerFactory.newInstance();
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

        filter2.parse(base + "personal/xml/jaxp/trax/chainwithfilter/vote.xml");
    }
}
