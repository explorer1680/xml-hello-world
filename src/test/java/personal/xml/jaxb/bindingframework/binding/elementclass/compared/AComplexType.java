//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.8-b130911.1802 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2017.06.19 at 04:26:39 PM EDT 
//


package personal.xml.jaxb.bindingframework.binding.elementclass.compared;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for AComplexType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="AComplexType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="ASimpleElement" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "AComplexType", propOrder = {
    "aSimpleElement"
})
public class AComplexType {

    @XmlElement(name = "ASimpleElement")
    protected int aSimpleElement;

    /**
     * Gets the value of the aSimpleElement property.
     * 
     */
    public int getASimpleElement() {
        return aSimpleElement;
    }

    /**
     * Sets the value of the aSimpleElement property.
     * 
     */
    public void setASimpleElement(int value) {
        this.aSimpleElement = value;
    }

}
