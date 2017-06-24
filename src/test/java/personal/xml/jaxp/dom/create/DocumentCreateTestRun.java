package personal.xml.jaxp.dom.create;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Comment;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Text;

public class DocumentCreateTestRun {

    public static void main(String[] args) throws ParserConfigurationException, TransformerException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.newDocument();

        Element root = document.createElement("root");
        document.appendChild(root);

        Comment comment1 = document.createComment("this is a comment");
        document.insertBefore(comment1, root);

        Element abc = document.createElement("abc");
        root.appendChild(abc);

        abc.setAttribute("ff", "123");

        Text text = document.createTextNode("this is a test.");
//        abc.appendChild(text);
        
        System.out.println(abc.getLastChild());
        abc.insertBefore(text, abc.getLastChild());
        
        Comment comment2 = document.createComment("this is a comment2");
        root.appendChild(comment2);

        DOMSource source = new DOMSource(document);

//        StringWriter stringWriter = new StringWriter();
//        StreamResult streamResult = new StreamResult(stringWriter);

        Transformer transformer = TransformerFactory.newInstance().newTransformer();
        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
        transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
        transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
        transformer.transform(source, new StreamResult(System.out));

//        System.out.println(stringWriter);
    }
}
