    public with sharing class PokemonPokeAPIBatch implements Database.Batchable<SObject>, Database.AllowsCallouts {
    public List<Player__c> listPlayers;
    public Map<Id, Player__c> oldPlayer;

    public class Oi{
        public Sprite sprites;
    } 
    
    public class Sprite {
        public Other other;
    }

    public class Other{
        public Showdown showdown;
    }

    public class Showdown{
        public String front_default;
    }
    
    public List<Player__c> start(Database.BatchableContext bc) {
        return this.listPlayers;
    }
    
    public PokemonPokeAPIBatch(List<Player__c> listaDePlayers){
        this.listPlayers = listaDePlayers;
    }

    public void execute(Database.BatchableContext bc, List<SObject> scope) {
        Player__c player = (Player__c) scope[0];
        //Buscar os pokemon do cara
        //randomizar um novo prokemon
        //chamar a api para pegar o pokemon
        //salvar o pokemon relacionado ao cara
    
        Integer maximo = 1350;
        Integer minimo = 1;

        Integer random;

        List<Integer> listPokeExists = new List<Integer>();
        List<Reward__c> query = [SELECT Number__c FROM Reward__c WHERE Player__c=:player.Id];

        for(Reward__c que : query){
            listPokeExists.add(Integer.valueOf(que.Number__c));
        } 

        do {
            random = Math.floor(Math.random() * (maximo - minimo + 1)).intValue() + minimo;
        } while(listPokeExists.contains(random));		
        
		Http newHttp = new Http();
        HttpRequest newRequest = new HttpRequest();
        newRequest.setEndpoint('https://pokeapi.co/api/v2/pokemon?limit=1&offset=' + random);
        newRequest.setMethod('GET');

       

		HttpResponse response = newHttp.send(newRequest);
        PokemonPokiAPI data = (PokemonPokiAPI) JSON.deserialize(response.getBody(), PokemonPokiAPI.class);
        System.debug(data.results[0].name);  

        HttpRequest newRequest2 = new HttpRequest();
        newRequest2.setEndpoint(data.results[0].url);
        newRequest2.setMethod('GET');

        HttpResponse response2 = newHttp.send(newRequest2);
        Oi data2 = (Oi) JSON.deserialize(response2.getBody(), Oi.class);
            

        insert new Reward__c(
            Player__c = player.Id, 
            Number__c = random,
            Name = data.results[0].name,
            Image__c =  data2.sprites.other.showdown.front_default
        );
    }
    

    public void finish(Database.BatchableContext bc) {}
}