package personal.xml.jaxb.bindingframework.unmarshalling.validation;

import org.springframework.core.io.ClassPathResource;
import org.xml.sax.SAXException;

import javax.xml.XMLConstants;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import java.io.IOException;

public class ValidationTestRun {
    public static void main(String[] args) throws JAXBException, IOException, SAXException {
        JAXBContext context = JAXBContext.newInstance(Employee.class);

        SchemaFactory sf = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
        Schema schema = sf.newSchema(new ClassPathResource("personal/xml/jaxb/bindingframework/unmarshalling/validation/employee.xsd").getFile());



        Unmarshaller unmarshaller = context.createUnmarshaller();

        unmarshaller.setSchema(schema);
        unmarshaller.setEventHandler(new EmployeeValidationEventHandler());

        Employee employee = (Employee) unmarshaller.unmarshal(new ClassPathResource("personal/xml/jaxb/bindingframework/unmarshalling/validation/employee.xml").getInputStream());

        System.out.println(employee);
    }
}
