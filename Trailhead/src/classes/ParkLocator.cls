public class ParkLocator {
    public static List<String> country(String name)
    {
    	ParkService.ParksImplPort parkServiceImpl = new ParkService.ParksImplPort();
    	return parkServiceImpl.byCountry(name);
    } 
}