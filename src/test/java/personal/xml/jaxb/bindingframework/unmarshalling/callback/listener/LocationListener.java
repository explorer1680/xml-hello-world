package personal.xml.jaxb.bindingframework.unmarshalling.callback.listener;


import javax.xml.bind.Unmarshaller;

public class LocationListener extends Unmarshaller.Listener{

    @Override
    public void beforeUnmarshal(Object target, Object parent) {
        System.out.println("---target---" + target);
        System.out.println("---parent---" + parent);

    }

    @Override
    public void afterUnmarshal(Object target, Object parent) {
        System.out.println("+++target+++" + target);
        System.out.println("+++parent+++" + parent);
    }
}
