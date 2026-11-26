public with sharing class MissionStatusService { 
    public static void earnXP(List<MissionPlayer__c> missionPlayer, Map<Id, MissionPlayer__c> oldMission) {
                        
        Map<Id, Decimal> playersIds = new Map<Id, Decimal>();

        for(MissionPlayer__c mis : missionPlayer){
            MissionPlayer__c oldMis = oldMission.get(mis.Id);

            if(mis.Status__c == 'Completed' && mis.Status__c != oldMis.Status__c){
                if(!playersIds.containsKey(mis.Player__c)) {
                    playersIds.put(mis.Player__c, mis.MissionXP__c);
                } else {
                    playersIds.put(mis.Player__c, playersIds.get(mis.Player__c) + mis.MissionXP__c);
                }
            }
        }

        List<Player__c> players = [SELECT Id, XP__c FROM Player__c WHERE Id IN : playersIds.keySet()];  
        
        for(Player__c player : players) {
            Decimal misXP = playersIds.get(player.Id);
            player.XP__c += misXP;
        }

        update players;
    }
}