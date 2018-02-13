package personal.xml.jaxb.bindingframework.annotation.xmlanyelement.domhandler;

import org.w3c.dom.Document;

import javax.xml.bind.ValidationEventHandler;
import javax.xml.bind.annotation.DomHandler;
import javax.xml.transform.Source;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamResult;

public class DOMResultHandler implements DomHandler<E, DOMResult> {
    @Override
    public DOMResult createUnmarshaller(ValidationEventHandler errorHandler) {
        return new DOMResult();
    }

    @Override
    public E getElement(DOMResult rt) {
        System.out.println(((Document)rt.getNode()).getDocumentElement().getTextContent());//Please note, there is empty line under "DE"
        return new E();
    }

    @Override
    public Source marshal(E n, ValidationEventHandler errorHandler) {
        return null;
    }
}
