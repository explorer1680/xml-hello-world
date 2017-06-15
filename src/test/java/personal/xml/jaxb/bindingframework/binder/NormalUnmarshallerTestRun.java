package personal.xml.jaxb.bindingframework.binder;

import org.springframework.core.io.ClassPathResource;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import java.io.IOException;
import java.io.StringWriter;

public class NormalUnmarshallerTestRun {

    public static void main(String[] args) throws JAXBException, IOException {
        JAXBContext context = JAXBContext.newInstance(Customer.class);

        Unmarshaller unmarshaller = context.createUnmarshaller();

        Customer customer = (Customer) unmarshaller.unmarshal(new ClassPathResource("personal/xml/jaxb/bindingframework/binder/original.xml").getInputStream());

        customer.getAddress().setStreet("2 New Street");

        PhoneNumber workPhone = new PhoneNumber("work", "555-WORK");

        customer.getPhoneNumbers().add(workPhone);

        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

        StringWriter stringWriter = new StringWriter();

        marshaller.marshal(customer, stringWriter);

        System.out.println(stringWriter);
    }
}
