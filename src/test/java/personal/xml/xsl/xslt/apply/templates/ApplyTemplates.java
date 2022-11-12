package personal.xml.xsl.xslt.apply.templates;

import org.springframework.core.io.ClassPathResource;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;

public class ApplyTemplates {
    public static void main(String[] args) throws TransformerException, IOException {

//        StreamSource source = new StreamSource(new ClassPathResource("personal/xml/xsl/xslt/apply/templates/mismo_test_file.xml").getInputStream());
        StreamSource source = new StreamSource(new ClassPathResource("personal/xml/xsl/xslt/apply/templates/cd.xml").getInputStream());
        
        TransformerFactory factory = TransformerFactory.newInstance();

        StreamSource xsl = new StreamSource(new ClassPathResource("personal/xml/xsl/xslt/apply/templates/cd.xsl").getInputStream());
//        StreamSource xsl = new StreamSource(new ClassPathResource("personal/xml/xsl/xslt/apply/templates/mismogse2redixml.xsl").getInputStream());

        Transformer transformer = factory.newTransformer(xsl);

        transformer.transform(source, new StreamResult(System.out));
    }
}
