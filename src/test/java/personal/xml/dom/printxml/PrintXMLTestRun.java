package personal.xml.dom.printxml;

import org.springframework.core.io.ClassPathResource;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.IOException;
import java.io.StringWriter;

public class PrintXMLTestRun {

    public static void main(String[] args) throws ParserConfigurationException, IOException, SAXException, TransformerException {

        ClassPathResource resource = new ClassPathResource("personal/xml/dom/printxml/doc.xml");

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

//        factory.setIgnoringComments(true);

        DocumentBuilder builder = factory.newDocumentBuilder();
        Document doc = builder.parse(resource.getInputStream());

        StringWriter stringWriter = new StringWriter();
        StreamResult streamResult = new StreamResult(stringWriter);

        DOMSource source = new DOMSource(doc);
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer = tf.newTransformer();

        transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");

        transformer.transform(source, streamResult);

        System.out.println(stringWriter.toString());
    }
}
