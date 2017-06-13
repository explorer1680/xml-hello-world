package personal.xml.jaxb.bindingframework.marshalling.validation;

import org.springframework.core.io.ClassPathResource;
import org.xml.sax.SAXException;

import javax.xml.XMLConstants;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import java.io.IOException;
import java.io.StringWriter;

public class ValidationTestRun {
    public static void main(String[] args) throws JAXBException, IOException, SAXException {
        JAXBContext context = JAXBContext.newInstance(Address.class);

        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

        SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
        Schema schema = factory.newSchema(new ClassPathResource("personal/xml/jaxb/bindingframework/marshalling/validation/address.xsd").getFile());

        marshaller.setSchema(schema);

        Address address = new Address("street", "city", "province", "M1R 2E3");

        StringWriter stringWriter = new StringWriter();

        marshaller.marshal(address, stringWriter);

        System.out.println(stringWriter);

    }
}
