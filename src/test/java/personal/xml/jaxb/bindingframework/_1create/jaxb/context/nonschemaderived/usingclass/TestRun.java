package personal.xml.jaxb.bindingframework._1create.jaxb.context.nonschemaderived.usingclass;

import java.io.StringWriter;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

public class TestRun {
	public static void main(String[] args) throws JAXBException{
		JAXBContext context = JAXBContext.newInstance(Flight.class);
//		JAXBContext context = JAXBContext.newInstance("personal.xml.jaxb.bindingframework._1create.jaxb.context.nonschemaderived.usingclass");
		
		Marshaller marshaller = context.createMarshaller();
		
		marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		
		StringWriter sw = new StringWriter();
		
		AirPlane airbus330 = new AirPlane("A330");
		Flight ac032 = new Flight("AC032", airbus330);
//		Flight ac032 = new Flight();
//		ac032.setAircraftType(airbus330);
//		ac032.setOnTime(false);
		
		marshaller.marshal(ac032, sw);
		
		System.out.println(sw);
	}

}
