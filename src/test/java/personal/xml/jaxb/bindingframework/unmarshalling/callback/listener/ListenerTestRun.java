package personal.xml.jaxb.bindingframework.unmarshalling.callback.listener;

import java.io.IOException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;

import org.springframework.core.io.ClassPathResource;
import org.xml.sax.SAXException;

public class ListenerTestRun {

    public static void main(String[] args) throws ParserConfigurationException, IOException, SAXException, JAXBException, XMLStreamException {
        ClassPathResource xmlInstance = new ClassPathResource("personal/xml/jaxb/bindingframework/unmarshalling/callback/listener/employee.xml");

        JAXBContext context = JAXBContext.newInstance(Employee.class);

        XMLInputFactory inputFactory = XMLInputFactory.newFactory();
        XMLStreamReader streamReader = inputFactory.createXMLStreamReader(xmlInstance.getInputStream());

        Unmarshaller unmarshaller = context.createUnmarshaller();
        unmarshaller.setListener(new LocationListener());

        Employee employee = (Employee)unmarshaller.unmarshal(streamReader);

        System.out.println(employee);
    }
}
