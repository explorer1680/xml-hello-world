package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.xmlelementdecl;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Foo {
    private String fooProp;
}
