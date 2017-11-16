package personal.xml.jaxp.trax.withsax.saxsource.basic;

import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;

public class Test {

    public void read(String xmlFileName, String xsdSchemaName) throws Exception {
        String validationFeature = "http://xml.org/sax/features/validation";
        String schemaFeature = "http://apache.org/xml/features/validation/schema";
        XMLReader reader = XMLReaderFactory.createXMLReader("org.apache.xerces.parsers.SAXParser");
        reader.setProperty("http://apache.org/xml/properties/schema/external-noNamespaceSchemaLocation", xsdSchemaName);
        reader.setFeature(validationFeature, true);
        reader.setFeature(schemaFeature, true);
//        reader.setContentHandler(this);
//        reader.setErrorHandler(this);
        reader.parse(xmlFileName);
    }

//    public static void main(String[] args) throws Exception {
//        System.out.println("Start of Products...");
//        ProductsSchemaValidation readerObj = new ProductsSchemaValidation();
//        readerObj.read(args[0], args[1]);
//    }
//
//    public void read(String xmlFileName, String xsdSchemaName) throws Exception {
//        String validationFeature = "http://xml.org/sax/features/validation";
//        String schemaFeature = "http://apache.org/xml/features/validation/schema";
//        XMLReader reader = XMLReaderFactory.createXMLReader("org.apache.xerces.parsers.SAXParser");
//        reader.setProperty("http://apache.org/xml/properties/schema/external-noNamespaceSchemaLocation", xsdSchemaName);
//        reader.setFeature(validationFeature, true);
//        reader.setFeature(schemaFeature, true);
//        reader.setContentHandler(this);
//        reader.setErrorHandler(this);
//        reader.parse(xmlFileName);
//    }
//
//    public void startDocument() throws SAXException {
//        System.out.println("Start of the document");
//    }
//
//    public void endDocument() throws SAXException {
//        System.out.println("End of the document");
//    }
//
//    public void startElement(String uri, String name, String qName, Attributes atts) {
//        if ("".equals(uri)) System.out.println("Start element: " + qName);
//        else System.out.println("Start element: {" + uri + "}" + name);
//    }
//
//    public void endElement(String uri, String name, String qName) {
//        if ("".equals(uri)) System.out.println("End element: " + qName);
//        else System.out.println("End element:   {" + uri + "}" + name);
//    }
//
//    public void warning(SAXParseException e) throws SAXException {
//        System.out.println("Warning: ");
//        displayErrorInfo(e);
//    }
//
//    public void error(SAXParseException e) throws SAXException {
//        System.out.println("Error: ");
//        displayErrorInfo(e);
//    }
//
//    public void fatalError(SAXParseException e) throws SAXException {
//        System.out.println("Fatal error: ");
//        displayErrorInfo(e);
//    }
//
//    private void displayErrorInfo(SAXParseException e) {
//        System.out.println("    Public ID: " + e.getPublicId());
//        System.out.println("    System ID: " + e.getSystemId());
//        System.out.println("   Line number: " + e.getLineNumber());
//        System.out.println("   Column number: " + e.getColumnNumber());
//        System.out.println("   Message: " + e.getMessage());
//    }
}
