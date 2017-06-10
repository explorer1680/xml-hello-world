package personal.xml.jaxb.bindingframework.jaxbcontext.objectfactory;

import java.io.StringWriter;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

public class ObjectFactoryTestRun {
	
	public static void main(String[] args) throws JAXBException{
		
		JAXBContext context = JAXBContext.newInstance("personal.xml.jaxb.bindingframework.jaxbcontext.objectfactory");
		
		Marshaller marshaller = context.createMarshaller();
		marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		
		Flight ac031 = new Flight("AC032", "Boeing 777");
		
		StringWriter sw = new StringWriter();
		
		marshaller.marshal(ac031, sw);
		
		System.out.println(sw.toString());
	}

}
