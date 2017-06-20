package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.xmlelementdecl;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;

@XmlRegistry
public class ObjectFactory {

    @XmlElementDecl(name="bar")
    public JAXBElement<Bar> createBar(Bar bar){
        return new JAXBElement<Bar>(new QName("bar"), Bar.class, bar);
    }
}
