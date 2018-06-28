package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.domhandler;

import com.sun.xml.internal.bind.marshaller.DataWriter;
import com.sun.xml.internal.bind.marshaller.DumbEscapeHandler;
import org.springframework.core.io.ClassPathResource;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import java.io.IOException;
import java.io.PrintWriter;

public class DomHandlerTestRun {
    public static void main(String[] args) throws JAXBException, IOException {
        JAXBContext context = JAXBContext.newInstance(Root.class, A.class, E.class);

        Unmarshaller unmarshaller = context.createUnmarshaller();
        Root root = (Root)unmarshaller.unmarshal(new ClassPathResource("personal/xml/jaxb/bindingframework/annotation/xmlanyelement/domhandler/domhandler.xml").getInputStream());

        for(Object obj: root.getAny()){
            System.out.println(obj.getClass());
        }
        System.out.println("__________________________");
        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT,true);
        marshaller.marshal(root, System.out);

        System.out.println("__________________________");
        DataWriter dataWriter = new DataWriter(new PrintWriter(System.out), "UTF-8", new MyEscapeHandler());
        marshaller.marshal(root, dataWriter);
    }
}
