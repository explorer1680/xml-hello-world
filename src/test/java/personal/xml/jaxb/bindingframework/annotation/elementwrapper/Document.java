package personal.xml.jaxb.bindingframework.annotation.elementwrapper;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name ="doc2")
public class Document {
    private String name;



    public Document(String name) {
        this.name = name;
    }

    public Document(){}
}
