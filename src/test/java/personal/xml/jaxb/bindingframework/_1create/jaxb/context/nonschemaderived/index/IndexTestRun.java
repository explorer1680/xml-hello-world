package personal.xml.jaxb.bindingframework._1create.jaxb.context.nonschemaderived.index;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

public class IndexTestRun {
	public static void main(String[] args) throws JAXBException{
		JAXBContext context = JAXBContext.newInstance("personal.xml.jaxb.bindingframework._1create.jaxb.context.nonschemaderived.index");
		
		Marshaller marshaller = context.createMarshaller();
		marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		
		Flight ac032 = new Flight ("AC032", "AirBus 340");
		
//		StringWriter sw = new StringWriter();
//
//		marshaller.marshal(ac032, sw);
//
//		System.out.println(sw.toString());

		marshaller.marshal(ac032, System.out);
	}
}
