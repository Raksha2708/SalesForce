public with sharing class Assignment {
    @AuraEnabled
    public Static List<getPiklistValues> getObjectName(){
        List<getPiklistValues> wrapperList = new List<getPiklistValues>();
        List<Schema.SObjectType> globaldescribe = Schema.getGlobalDescribe().Values();  
        
        for(SObjectType sot:globaldescribe){
           getPiklistValues aa=new getPiklistValues();
           aa.label = sot.getDescribe().getLabel();
           aa.value = sot.getDescribe().getName();
            wrapperList.add(aa);
            
       }
       return wrapperList;
    }
   
    // method for selecting fiels of particular object
   @AuraEnabled
           public static List<getPiklistValues> getAllFields( String obj){
           List<getPiklistValues> requiredFields = new List<getPiklistValues>();
           Map <String,Schema.SObjectType> gd = Schema.getGlobalDescribe();
           Schema.SObjectType sobjType = gd.get(obj);
           Schema.DescribeSObjectResult r = sobjType.getDescribe();
           Map<String, Schema.SObjectField> MapofField = r.fields.getMap();
           for(Schema.SObjectField field: MapofField.values()){
               getPiklistValues tt = new getPiklistValues();
               tt.label = field.getDescribe().getLabel();
               tt.value =  field.getDescribe().getName();
               
               requiredFields.add(tt);

       }
       return requiredFields;
        }
            
      @AuraEnabled
      public static List<sobject>Generatequery(string records){
           return Database.query(records);
      }

   
   
   public class getPiklistValues {
       @auraEnabled
       public String label;
       @auraEnabled
       public String value;
       
       }
    
}
 

