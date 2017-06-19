package personal.xml.jaxb.schema.compiler.basic;

import org.springframework.core.io.ClassPathResource;
import org.springframework.util.ObjectUtils;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.IOException;

public class TestRun {
    public static void main(String[] args) throws JAXBException, IOException {
        JAXBContext context = JAXBContext.newInstance("personal.xml.jaxb.schema.compiler.basic");

        Unmarshaller unmarshaller = context.createUnmarshaller();

        Object object = unmarshaller.unmarshal(new ClassPathResource("personal/xml/jaxb/schema/compiler/basic/comment.xml").getInputStream());

        System.out.println(object);
    }
}
