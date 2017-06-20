package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.xmlelementdecl;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAnyElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Root {
    @XmlAnyElement(lax = true)
    private List<Object> any;

    public List<Object> getAny() {
        return any;
    }

}
