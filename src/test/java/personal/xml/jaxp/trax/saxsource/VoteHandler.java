package personal.xml.jaxp.trax.saxsource;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class VoteHandler extends DefaultHandler{

	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		System.out.println("in startElement");
	}

	@Override
	public void endElement(String uri, String localName, String qName) throws SAXException {
		System.out.println("in endElement");
	}

	@Override
	public void characters(char[] ch, int start, int length) throws SAXException {
		System.out.println("in characters");
	}

}
