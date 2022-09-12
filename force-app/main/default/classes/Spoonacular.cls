
public without sharing class Spoonacular {
    private static final String RECEIPE_API = 'https://api.spoonacular.com';
    private static final String API_KEY = 'e6a8c3edbeaa424ab8d7d0e455acdc32';

    @AuraEnabled
    public static String getRandomRecipe(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(RECEIPE_API+'/recipes/random?number=5&apiKey='+API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            return response.getBody();
        }
        return '';
    }

    @AuraEnabled
    public static String getRecipe(String recipeId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(RECEIPE_API+'/recipes/'+recipeId+'/information?apiKey='+API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            return response.getBody();
        }
        return '';
    }

    @AuraEnabled
    public static String getRecipeByIngredients(String ingredients){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(RECEIPE_API+'/recipes/findByIngredients?ingredients='+ingredients+'&number=10&apiKey='+API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            return response.getBody();
        }
        return '';
    }
}
