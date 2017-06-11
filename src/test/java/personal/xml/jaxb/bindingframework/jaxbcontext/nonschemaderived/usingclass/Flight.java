package personal.xml.jaxb.bindingframework.jaxbcontext.nonschemaderived.usingclass;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Flight {

	private String flightNumber;
	private AirPlane aircraftType;

	public Flight() {
		super();
	}

	public Flight(String flightNumber, AirPlane aircraftType) {
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

	public AirPlane getAircraftType() {
		return aircraftType;
	}

	public void setAircraftType(AirPlane aircraftType) {
		this.aircraftType = aircraftType;
	}
}
