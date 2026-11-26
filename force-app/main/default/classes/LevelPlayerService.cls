public with sharing class LevelPlayerService { 
    public static void playerReward(List<Player__c> players, Map<Id, Player__c> oldPlayerMap){
        List<Player__c> playersUppingLevel = new List<Player__c>();
        
        for(Player__c player : players){
            Player__c oldPlayer = oldPlayerMap.get(player.Id);
            Integer oldLevel = oldPlayer.Level__c.intValue();
            Integer actualLevel = player.Level__c.intValue();
            
            Integer difference = actualLevel - oldLevel;
            
            if(difference >= 1){
                for (Integer i = 0; i != difference; i++){
                    if(oldPlayer ==  null || player.Level__c > oldPlayer.Level__c){
                        playersUppingLevel.add(player);
                    }
                }
            }
            
        }
        if (playersUppingLevel.isEmpty()){
            return;
        }
        PokemonPokeAPIBatch pokeBatch = new PokemonPokeAPIBatch(playersUppingLevel);
        Database.executeBatch(pokeBatch, 1);
    }
}