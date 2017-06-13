package personal.xml.jaxp.dom.remove;

import org.springframework.core.io.ClassPathResource;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
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
import javax.xml.xpath.*;
import java.io.IOException;
import java.io.StringWriter;

public class ElementRemoveTestRun {
    public static void main(String[] args) throws ParserConfigurationException, IOException, SAXException, TransformerException, XPathExpressionException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document doc = builder.parse(new ClassPathResource("personal/xml/jaxp/dom/remove/remove.xml").getInputStream());



        XPathFactory pathFactory = XPathFactory.newInstance();
        XPath path = pathFactory.newXPath();
        XPathExpression expression = path.compile("//d2");

        Object evaluateResult = expression.evaluate(doc, XPathConstants.NODE);


        StringWriter writer = new StringWriter();
        StreamResult result = new StreamResult(writer);

        Node node = (Node) evaluateResult;

        node.getParentNode().removeChild(node);

        DOMSource source = new DOMSource(doc);

        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer = tf.newTransformer();

        transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
        transformer.transform(source, result);

        System.out.println(writer);
    }
}
