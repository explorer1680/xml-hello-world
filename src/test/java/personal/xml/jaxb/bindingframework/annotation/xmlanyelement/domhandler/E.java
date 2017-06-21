package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.domhandler;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class E {
    private  String elementE;

    public E(){
        super();
    }

    public E(String elementE) {
        this.elementE = elementE;
    }
}
