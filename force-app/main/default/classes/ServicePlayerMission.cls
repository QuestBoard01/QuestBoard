public with sharing class ServicePlayerMission {
    public static void atribuirMissaoParaFazendo(List<MissionPlayer__c> missions, Map<Id, MissionPlayer__c> mapOldMissions) {
        for(MissionPlayer__c mis : missions){
            MissionPlayer__c oldMis = mapOldMissions.get(mis.Id);
            if(mis.Player__c != null && oldMis.Player__c == null){
                mis.Status__c = 'In progress';
            }
        }
    }

    public static void playerEscolherMissao(List<MissionPlayer__c> missions){
        for(MissionPlayer__c mis : missions){
            System.debug(mis);
        }
    }
}