package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.xmlrootelement;

import org.springframework.core.io.ClassPathResource;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import java.io.IOException;

public class TestRun {
    public static void main(String[] args) throws JAXBException, IOException {
        JAXBContext context = JAXBContext.newInstance(Message.class, Customer.class, Product.class);

        Unmarshaller unmarshaller = context.createUnmarshaller();
        Message message = (Message) unmarshaller.unmarshal(new ClassPathResource("personal/xml/jaxb/bindingframework/annotation/xmlanyelement/xmlrootelement/customer.xml").getInputStream());

        System.out.println(message.getBody() instanceof Customer);

        System.out.println(message.getBody().getClass());

        System.out.println(message);

        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        marshaller.marshal(message, System.out);

    }
}
