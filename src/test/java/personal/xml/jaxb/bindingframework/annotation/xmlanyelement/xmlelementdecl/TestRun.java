package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.xmlelementdecl;

import org.springframework.core.io.ClassPathResource;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import java.io.IOException;

public class TestRun {
    public static void main(String[] args) throws JAXBException, IOException {
        JAXBContext context = JAXBContext.newInstance(Root.class, Foo.class);//, ObjectFactory.class);

        Unmarshaller unmarshaller = context.createUnmarshaller();
        Root root = (Root)unmarshaller.unmarshal(new ClassPathResource("personal/xml/jaxb/bindingframework/annotation/xmlanyelement/xmlelementdecl/example.xml").getInputStream());

        for(Object obj: root.getAny()){
            System.out.println(obj.getClass());
        }

        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        marshaller.marshal(root,System.out);
    }
}
