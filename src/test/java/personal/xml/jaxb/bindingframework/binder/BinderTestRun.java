package personal.xml.jaxb.bindingframework.binder;

import java.io.IOException;

import javax.xml.bind.Binder;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.springframework.core.io.ClassPathResource;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

public class BinderTestRun {
    public static void main(String[] args) throws ParserConfigurationException, IOException, SAXException, JAXBException, TransformerException {
        DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = builderFactory.newDocumentBuilder();
        Document document = builder.parse(new ClassPathResource("personal/xml/jaxb/bindingframework/binder/original.xml").getInputStream());

        JAXBContext context = JAXBContext.newInstance(Customer.class);

        Binder<Node> binder = context.createBinder();
        Customer customer = (Customer) binder.unmarshal(document);

        customer.getAddress().setStreet("2 New Street");

        PhoneNumber workPhone = new PhoneNumber("work", "555-WORK");

        customer.getPhoneNumbers().add(workPhone);

        binder.updateXML(customer);

        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer = tf.newTransformer();
        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
        transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");

        transformer.transform(new DOMSource(document),new StreamResult(System.out));

    }
}
