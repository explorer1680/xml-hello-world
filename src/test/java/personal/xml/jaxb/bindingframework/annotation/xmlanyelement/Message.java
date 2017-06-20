package personal.xml.jaxb.bindingframework.annotation.xmlanyelement;

import javax.xml.bind.annotation.*;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Message {

    @XmlAttribute
    private String to;
    @XmlAttribute
    private String from;
    @XmlAnyElement(lax = true)
    private Object body;

    public Object getBody() {
        return body;
    }
}
