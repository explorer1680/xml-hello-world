package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.domhandler;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;

@XmlRegistry
public class ObjectFactory {
    
    @XmlElementDecl(name = "b")
    public JAXBElement<B> createB(B b){
        return new JAXBElement<B>(new QName("b"), B.class, b);
    }
}
