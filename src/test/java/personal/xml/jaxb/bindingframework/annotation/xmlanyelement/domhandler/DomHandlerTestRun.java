package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.domhandler;

import org.springframework.core.io.ClassPathResource;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import java.io.IOException;

public class DomHandlerTestRun {
    public static void main(String[] args) throws JAXBException, IOException {
        JAXBContext context = JAXBContext.newInstance(Root.class, A.class, E.class);

        Unmarshaller unmarshaller = context.createUnmarshaller();
        Root root = (Root)unmarshaller.unmarshal(new ClassPathResource("personal/xml/jaxb/bindingframework/annotation/xmlanyelement/domhandler/domhandler.xml").getInputStream());

        for(Object obj: root.getAny()){
            System.out.println(obj.getClass());
        }

        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT,true);
        marshaller.marshal(root, System.out);
    }
}
