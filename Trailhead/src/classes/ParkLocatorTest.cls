@isTest
public class ParkLocatorTest {
    @isTest static void testCallout() {              
	    // This causes a fake response to be generated
	    Test.setMock(WebServiceMock.class, new ParkServiceMock());
	    List<String> res = ParkLocator.country('Germany');
	    System.assert(res.size() == 5);
    }
}