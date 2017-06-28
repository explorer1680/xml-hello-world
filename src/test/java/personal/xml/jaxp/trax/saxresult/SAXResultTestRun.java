package personal.xml.jaxp.trax.saxresult;

import org.springframework.core.io.ClassPathResource;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;

public class SAXResultTestRun {
    public static void main(String[] args) throws IOException, TransformerException {
        StreamSource xmlFile = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/saxresult/vote.xml").getInputStream());
        StreamSource xslFile = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/saxresult/votes.xsl").getInputStream());

        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer transformer = factory.newTransformer(xslFile);

        SAXResult result = new SAXResult(new DataProcessor());

        transformer.transform(xmlFile, result);
    }
}
