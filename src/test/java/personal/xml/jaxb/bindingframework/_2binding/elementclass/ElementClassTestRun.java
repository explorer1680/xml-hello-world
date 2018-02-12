package personal.xml.jaxb.bindingframework._2binding.elementclass;

import org.springframework.core.io.ClassPathResource;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import java.io.IOException;

public class ElementClassTestRun {
    public static void main(String[] args) throws JAXBException, IOException {
        JAXBContext context = JAXBContext.newInstance("personal.xml.jaxb.bindingframework._2binding.elementclass");
        Unmarshaller unmarshaller = context.createUnmarshaller();

        Complex complex = (Complex)unmarshaller.unmarshal(new ClassPathResource("personal/xml/jaxb/bindingframework/_2binding/elementclass/elementclass.xml").getInputStream());

        System.out.println(complex);

        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT,true);

        AComplexType aComplexType = new AComplexType();
        aComplexType.setASimpleElement(456878);


        complex = new ObjectFactory().createComplex(aComplexType);

        marshaller.marshal(complex, System.out);



    }
}
