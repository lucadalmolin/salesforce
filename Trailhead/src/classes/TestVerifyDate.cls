@isTest
private class TestVerifyDate {
	
	@isTest static void testD2LessWithInD1()
    {
    	Date d1 = Date.newInstance(2018, 3, 20);
    	Date d2 = Date.newInstance(2018, 3, 19);
    	Date endMonth = Date.newInstance(2018,3,31);
    	
    	Date res = VerifyDate.CheckDates(d1, d2);

    	System.assertEquals(endMonth, res);
    }
    
    @isTest static void testD2MoreWithInD1()
    {
    	Date d1 = Date.newInstance(2018, 3, 20);
    	Date d2 = Date.newInstance(2018, 5, 19);
    	Date endMonth = Date.newInstance(2018,3,31);
    	
    	Date res = VerifyDate.CheckDates(d1, d2);

    	System.assertEquals(endMonth, res);
    }
	
    @isTest static void testD2WithInD1()
    {
    	Date d1 = Date.newInstance(2018, 3, 20);
    	Date d2 = Date.newInstance(2018, 3, 25);
    	
    	Date res = VerifyDate.CheckDates(d1, d2);

    	System.assertEquals(d2, res);
    }
}