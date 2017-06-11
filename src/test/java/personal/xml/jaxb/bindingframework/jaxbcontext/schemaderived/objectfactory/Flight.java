package personal.xml.jaxb.bindingframework.jaxbcontext.schemaderived.objectfactory;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Flight {

	private String flightNumber;
	private String aircraftType;

	public Flight() {
		super();
	}

	public Flight(String flightNumber, String aircraftType) {
		super();
		this.flightNumber = flightNumber;
		this.aircraftType = aircraftType;
	}

	public String getFlightNumber() {
		return flightNumber;
	}

	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}

	public String getAircraftType() {
		return aircraftType;
	}

	public void setAircraftType(String aircraftType) {
		this.aircraftType = aircraftType;
	}
}
