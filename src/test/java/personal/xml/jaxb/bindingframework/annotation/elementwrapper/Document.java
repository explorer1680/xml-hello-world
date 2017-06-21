package personal.xml.jaxb.bindingframework.annotation.elementwrapper;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;

@XmlAccessorType(XmlAccessType.FIELD)
public class Document {
    private String name;



    public Document(String name) {
        this.name = name;
    }
}
