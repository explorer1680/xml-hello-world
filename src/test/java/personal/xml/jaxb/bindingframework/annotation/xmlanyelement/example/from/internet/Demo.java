package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.example.from.internet;

import org.springframework.core.io.ClassPathResource;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class Demo {

    public static void main(String[] args) throws Exception {
        JAXBContext jc = JAXBContext.newInstance(Customer.class);

        Unmarshaller unmarshaller = jc.createUnmarshaller();
        Customer customer = (Customer) unmarshaller.unmarshal(new ClassPathResource("personal/xml/jaxb/bindingframework/annotation/xmlanyelement/example/from/internet/input.xml").getInputStream());

        System.out.println("Name:  " + customer.getName());
        System.out.println("Bio:   " + customer.getBio());

        Marshaller marshaller = jc.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        marshaller.marshal(customer, System.out);
    }
}