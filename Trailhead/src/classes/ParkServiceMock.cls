@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        ParkService.byCountryResponse response_x = 
            new ParkService.byCountryResponse();
            
            List<String> ret = new List<String>();
            ret.add('Park one');
            ret.add('Park two');
            ret.add('Park three');
            ret.add('Park four');
            ret.add('Park five');
            
        response_x.return_x = ret;
        // end
        response.put('response_x', response_x); 
   }
}