package personal.xml.jaxb.bindingframework.unmarshalling.domsource;

import org.springframework.core.io.ClassPathResource;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.dom.DOMSource;
import java.io.IOException;

public class TransformSourceTestRun {

    public static void main(String[] args) throws ParserConfigurationException, IOException, SAXException, JAXBException {
        ClassPathResource xmlInstance = new ClassPathResource("personal/xml/jaxb/bindingframework/unmarshalling/domsource/employee.xml");

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document doc = builder.parse(xmlInstance.getInputStream());
        DOMSource domSource = new DOMSource(doc);

        JAXBContext context = JAXBContext.newInstance(Employee.class);

        Unmarshaller unmarshaller = context.createUnmarshaller();

        Employee employee = (Employee)unmarshaller.unmarshal(domSource);

        System.out.println(employee);

    }




}
