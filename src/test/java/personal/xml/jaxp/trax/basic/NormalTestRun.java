package personal.xml.jaxp.trax.basic;

import org.springframework.core.io.ClassPathResource;

import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;

public class NormalTestRun {
    public static void main(String[] args) throws TransformerException, IOException {


        StreamSource source = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/basic/vote.xml").getInputStream());

        TransformerFactory factory = TransformerFactory.newInstance();

        StreamSource xsl = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/basic/votes.xsl").getInputStream());

        Transformer transformer = factory.newTransformer(xsl);

        transformer.transform(source, new StreamResult(System.out));
    }
}
