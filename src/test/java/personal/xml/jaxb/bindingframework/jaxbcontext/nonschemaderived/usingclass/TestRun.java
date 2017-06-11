package personal.xml.jaxb.bindingframework.jaxbcontext.nonschemaderived.usingclass;

import java.io.StringWriter;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

public class TestRun {
	public static void main(String[] args) throws JAXBException{
		JAXBContext context = JAXBContext.newInstance(Flight.class);
//		JAXBContext context = JAXBContext.newInstance("personal.xml.jaxb.bindingframework.jaxbcontext.nonschemaderived.usingclass");
		
		Marshaller marshaller = context.createMarshaller();
		
		marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		
		StringWriter sw = new StringWriter();
		
		AirPlane airbus330 = new AirPlane("A330");
		Flight ac032 = new Flight("AC032", airbus330);
		
		marshaller.marshal(ac032, sw);
		
		System.out.println(sw);
	}

}
