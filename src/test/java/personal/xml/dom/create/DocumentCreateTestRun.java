package personal.xml.dom.create;

import org.w3c.dom.Comment;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Text;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.StringWriter;
import java.util.stream.Stream;

public class DocumentCreateTestRun {

    public static void main(String[] args) throws ParserConfigurationException, TransformerException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document1 = builder.newDocument();
        Document doc = builder.newDocument();



        Element root = document1.createElement("root");
        document1.appendChild(root);

        Comment comment = document1.createComment("this is a comment");
        document1.insertBefore(comment, root);

        Element abc = document1.createElement("abc");
        root.appendChild(abc);

        abc.setAttribute("ff", "123");

        Text text = document1.createTextNode("this is a test.");
        abc.insertBefore(text, abc.getLastChild());


        DOMSource source = new DOMSource(document1);

        StringWriter stringWriter = new StringWriter();
        StreamResult streamResult = new StreamResult(stringWriter);


        Transformer transformer = TransformerFactory.newInstance().newTransformer();
        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
        transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
        transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
        transformer.transform(source, streamResult);

        System.out.println(stringWriter);
    }

}
