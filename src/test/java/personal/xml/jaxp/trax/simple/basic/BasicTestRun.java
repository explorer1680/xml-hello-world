package personal.xml.jaxp.trax.simple.basic;

import org.springframework.core.io.ClassPathResource;

import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;

public class BasicTestRun {
    public static void main(String[] args) throws TransformerException, IOException {


        StreamSource source = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/simple/basic/vote.xml").getInputStream());

        TransformerFactory factory = TransformerFactory.newInstance();

        StreamSource xsl = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/simple/basic/votes.xsl").getInputStream());

        Transformer transformer = factory.newTransformer(xsl);

        transformer.transform(source, new StreamResult(System.out));
    }
}
