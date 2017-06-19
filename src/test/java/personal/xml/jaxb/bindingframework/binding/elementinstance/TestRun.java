package personal.xml.jaxb.bindingframework.binding.elementinstance;

import org.springframework.core.io.ClassPathResource;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.IOException;

public class TestRun {
    public static void main(String[] args) throws JAXBException, IOException {
        JAXBContext context = JAXBContext.newInstance("personal.xml.jaxb.bindingframework.binding.elementinstance");

        Unmarshaller unmarshaller = context.createUnmarshaller();

        Object object = unmarshaller.unmarshal(new ClassPathResource("personal/xml/jaxb/bindingframework/binding/elementinstance/comment.xml").getInputStream());
//        Object object = unmarshaller.unmarshal(new ClassPathResource("personal/xml/jaxb/bindingframework/binding/elementinstance/po.xml").getInputStream());

        System.out.println(object);
    }
}
