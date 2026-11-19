public with sharing class TestLevelPlayer {
    public static void playerReward(List<Player__c> players, Map<Id, Player__c> oldPlayerMap){
        List<Player__c> levelUp = new List<Player__c>();
        for(Player__c player : players){
            Player__c oldPlayer = oldPlayerMap.get(player.Id);
            if(oldPlayer ==  null || player.Level__c > oldPlayer.Level__c){
                levelUp.add(player);
            }
        }
        if (levelUp.isEmpty()){
            return;
        }
        PokemonPokeAPIBatch pokeBatch = new PokemonPokeAPIBatch(levelUp);
        Database.executeBatch(pokeBatch, 1);
    }
}