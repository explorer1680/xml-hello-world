package personal.xml.jaxp.dom.insert;

import org.springframework.core.io.ClassPathResource;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.IOException;
import java.io.StringWriter;

public class ElementInsertTestRun {
    public static void main(String[] args) throws ParserConfigurationException, IOException, SAXException, TransformerException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse(new ClassPathResource("personal/xml/jaxp/dom/insert/insert.xml").getInputStream());



        NodeList nodes = document.getElementsByTagName("b");

        Text a = document.createTextNode("value");
        Element p = document.createElement("newNode");
        p.appendChild(a);

//        nodes.item(0).appendChild(p);
        
        nodes.item(0).insertBefore(p, nodes.item(0).getFirstChild());







        StringWriter stringWriter = new StringWriter();
        StreamResult streamResult = new StreamResult(stringWriter);

        DOMSource domSource = new DOMSource(document);

        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer = tf.newTransformer();
        transformer.transform(domSource, streamResult);

        System.out.println(stringWriter);
    }
}
