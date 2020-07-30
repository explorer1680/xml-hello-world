package personal.xml.saxon;

import java.io.IOException;

import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.springframework.core.io.ClassPathResource;

import net.sf.saxon.lib.FeatureKeys;

public class SaxonSetting {
	
	public static void main(String[] args) throws IOException, TransformerException {
//	    TransformerFactoryImpl factory = new TransformerFactoryImpl();
	    TransformerFactory factory = TransformerFactory.newInstance();
	    
//	    factory.setAttribute("http://saxon.sf.net/feature/parserFeature?uri=http://apache.org/xml/features/disallow-doctype-decl", true);

	    //the following are allow_external_functions, not external_entities
//	    factory.setAttribute(FeatureKeys.ALLOW_EXTERNAL_FUNCTIONS, Boolean.FALSE);
//	    factory.getConfiguration().setConfigurationProperty(FeatureKeys.ALLOW_EXTERNAL_FUNCTIONS, Boolean.FALSE);
//	    factory.setFeature(FeatureKeys.ALLOW_EXTERNAL_FUNCTIONS, Boolean.FALSE);
	    
	    
	    
//      StreamSource source = new StreamSource(new ClassPathResource("personal/xml/jaxp/entity/dom/internal_parameter_entity.xml").getInputStream());
      StreamSource source = new StreamSource(new ClassPathResource("personal/xml/jaxp/entity/dom/entity1.xml").getInputStream());


//      Source xsl = new StreamSource(new ClassPathResource("personal/xml/xsl/xpath/copyof/svg.xsl").getInputStream());
      Source xsl = new StreamSource(new ClassPathResource("personal/xml/saxon/complex.xsl").getInputStream());

      Transformer transformer = factory.newTransformer(xsl);
      
      transformer.setParameter(FeatureKeys.ALLOW_EXTERNAL_FUNCTIONS, Boolean.FALSE);

      transformer.transform(source, new StreamResult(System.out));
  }

}
