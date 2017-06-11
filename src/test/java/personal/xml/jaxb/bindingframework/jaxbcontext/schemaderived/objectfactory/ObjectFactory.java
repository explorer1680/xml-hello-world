package personal.xml.jaxb.bindingframework.jaxbcontext.schemaderived.objectfactory;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;

@XmlRegistry
public class ObjectFactory {

    private final static QName _Flight_QNAME = new QName("", "flight");
    
    public ObjectFactory() {
    }
    
    public Flight createFlight() {
        return new Flight();
    }

    
    @XmlElementDecl(namespace = "", name = "flight")
    public JAXBElement<Flight> createFlight(Flight value) {
        return new JAXBElement<Flight>(_Flight_QNAME, Flight.class, null, value);
    }
}
