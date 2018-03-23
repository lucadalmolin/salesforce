public class AnimalLocator {
        
	public static String getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(String.format('https://th-apex-http-callout.herokuapp.com/animals/{0}', new String[] { String.valueOf(id) }));
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String ret = '';
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
        	// Deserializes the JSON string into collections of primitive data types.
            AnimalContainer animalContainer = (AnimalContainer) JSON.deserialize(response.getBody(), Type.forName('AnimalContainer'));
			ret = animalContainer.animal.name;
        }
        return ret;
    }
    
}