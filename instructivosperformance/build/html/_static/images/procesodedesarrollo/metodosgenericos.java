    /**
     * Metodo que crea la cabecera de los archivos csv.
     * @param fileName
     */
   public static  void createHeaderCsv(String fileName) throws IOException{
       PropertyFile pf=new PropertyFile();
       FileWriter fileWriter=new FileWriter(fileName,true);
       try {        
        fileWriter.append(""+pf.headerCsv());
        fileWriter.append(""+NEW_LINE_SEPARATOR);
       } catch (IOException e) {
       }  finally{
           try {
               fileWriter.close();
           } catch (IOException e) {
           }
       }      
   }
   
    /**
     * Metodo encargado de la construccion de la cabecera de los archivos csv
     * @return cabecera del archivo csv
     */
    public String headerCsv(){
         String header="";
        TreeMap<String,String> propertieMap=loadPropertieMap();
        Set set = propertieMap.entrySet();
        Iterator iter = set.iterator();        
        while (iter.hasNext()) {           
            Map.Entry me = (Map.Entry)iter.next();
            header+=me.getValue()+COMMA;
        }      
         if(header.endsWith(COMMA)){
                 header = header.substring(0,header.length() - 1);
         }
         header=header.replaceAll("\\s+","");
       return header;
    }
	
	/**
     * Metodo para escribir en archivo csv          
     * @param fileName
     */
   public static  void writeCSV(FileWriter fileWriter,TreeMap csvMapAll) throws IOException{
        // FileWriter fileWriter=new FileWriter(fileName,true);
         //TreeMap<String,String> propertieMap=pf.loadPropertieMap();
        Set set = csvMapAll.entrySet();
        int counter=0;
        Iterator iter = set.iterator();
             while (iter.hasNext()) {                 
             Map.Entry me = (Map.Entry)iter.next(); 
             counter++;
                if(propertyMap.containsKey(me.getKey().toString())){                                            
                          
                          if(!(counter < csvMapAll.size())){
                          fileWriter.append(""+me.getValue().toString());
                          fileWriter.append(""+NEW_LINE_SEPARATOR);
                            //  System.out.println("registro finalizado"+"counter: "+counter);
                              
                          }
                          else{
                                 fileWriter.append(""+me.getValue().toString());
                                 fileWriter.append(""+COMMA_DELIMITER);                                  
                        }
                }            
            }
            try {
           fileWriter.flush();
          } catch (Exception e) {
                System.out.println(e.getMessage());
          }
        
     }
	 
	
