package personal.xml.jaxb.bindingframework.annotation.elementwrapper;

import javax.xml.bind.annotation.*;
import java.util.List;

@XmlRootElement(name="config")
@XmlAccessorType(XmlAccessType.FIELD)
public class Configuration {

    @XmlElementWrapper(name="documents")
    @XmlElement(name ="doc")
    private List<Document> documents;

    public List<Document> getDocuments() {
        return documents;
    }

    public void setDocuments(List<Document> documents) {
        this.documents = documents;
    }
}
