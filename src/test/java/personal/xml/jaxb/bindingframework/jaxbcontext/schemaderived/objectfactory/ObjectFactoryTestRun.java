package personal.xml.jaxb.bindingframework.jaxbcontext.schemaderived.objectfactory;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import java.io.StringWriter;

public class ObjectFactoryTestRun {
    public static void main(String[] args) throws JAXBException {
        JAXBContext context = JAXBContext.newInstance("personal.xml.jaxb.bindingframework.jaxbcontext.schemaderived.objectfactory");

        Marshaller marshaller = context.createMarshaller();
        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

        FlightType ac032 = new FlightType();
        ac032.setName("AC 032");
        ac032.setAirplanetype("AirBus 340");

        JAXBElement<FlightType> flight = new ObjectFactory().createFlight(ac032);

        StringWriter sw = new StringWriter();

        marshaller.marshal(flight, sw);

        System.out.println(sw.toString());

        String str = "This is just a comment";
        JAXBElement<String> comment = new ObjectFactory().createComment(str);
        marshaller.marshal(comment, System.out);
    }
}
