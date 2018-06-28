package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.domhandler;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAnyElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Root {

//    @XmlAnyElement(lax = true, value = StreamResultHandler.class)
    @XmlAnyElement(lax = true, value = DOMResultHandler.class)
//    @XmlAnyElement(lax = true, value = StringHandler.class)
//@XmlAnyElement(StringHandler.class)
    private List<Object> any;

    public List<Object> getAny() {
        return any;
    }
}
