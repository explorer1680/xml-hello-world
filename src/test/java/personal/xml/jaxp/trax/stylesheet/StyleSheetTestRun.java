package personal.xml.jaxp.trax.stylesheet;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.IOException;

public class StyleSheetTestRun {

    public static void main(String[] args) throws TransformerException, IOException {

        StreamSource source = new StreamSource(new ClassPathResource("personal/xml/jaxp/trax/basic/vote.xml").getFile());

        TransformerFactory factory = TransformerFactory.newInstance();

        Source style = factory.getAssociatedStylesheet(source,
                null, null, null);
        Transformer transformer = factory.newTransformer(style);
        transformer.transform(source, new StreamResult(System.out));
    }
}
