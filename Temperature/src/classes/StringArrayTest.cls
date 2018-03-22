public class StringArrayTest {

    public static List<String> generateStringArray (Integer tot)
    {
        String token = 'Test';
        List<String> lret = new List<String>();
        for(Integer i=0;i<tot;i++)
        {
            lret.add(String.format('{0} {1}',new String[] {token,String.valueOf(i)}));
        }
        
        return lret;
    }
}