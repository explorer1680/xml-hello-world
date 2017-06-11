package personal.xml.jaxb.bindingframework.jaxbcontext.nonschemaderived.usingclass;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement
//@XmlType
@XmlAccessorType(XmlAccessType.FIELD)
public class AirPlane {

	private String planeModel;

	public AirPlane() {
		super();
	}

	public AirPlane(String planeModel) {
		super();
		this.planeModel = planeModel;
	}

	public String getPlaneModel() {
		return planeModel;
	}

	public void setPlaneModel(String planeModel) {
		this.planeModel = planeModel;
	}

}
