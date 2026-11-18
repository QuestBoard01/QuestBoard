public with sharing class ServiceMissionStatus {
    public static void missaoDeclaradaFeitaStatusVaiProPlayer(List<Mission__c> mission, Map<Id, Mission__c> oldMission) {
        
        Map<Id, Decimal> playersIds = new Map<Id, Decimal>();

        for(Mission__c mis : mission){
            Mission__c oldMis = oldMission.get(mis.Id);

            if(mis.Status__c == 'Completed' && mis.Status__c != oldMis.Status__c){
                if(!playersIds.containsKey(mis.Player__c)) {
                    playersIds.put(mis.Player__c, mis.XP__c);
                } else {
                    playersIds.put(mis.Player__c, playersIds.get(mis.Player__c) + mis.XP__c);
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