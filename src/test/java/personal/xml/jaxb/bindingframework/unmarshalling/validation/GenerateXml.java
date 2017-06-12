package personal.xml.jaxb.bindingframework.unmarshalling.validation;

import org.springframework.core.io.FileSystemResource;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import java.io.FileOutputStream;
import java.io.IOException;

public class GenerateXml {
    public static void main(String[] args) throws JAXBException, IOException {
        JAXBContext context = JAXBContext.newInstance(Employee.class);
        Marshaller marshaller = context.createMarshaller();

        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

        Address address = new Address("address line 1", "address line 2", "Toronto", "ON", "Canada","M2H 1Y7");
        Employee employee = new Employee(1, "Tomcat", address, 10000d);

        FileSystemResource resource = new FileSystemResource("employee.xml");

        FileOutputStream outputStream = new FileOutputStream(resource.getFile());

        marshaller.marshal(employee, outputStream);
    }
}
