public with sharing class ServicePlayerMission {
    public static void atribuirMissaoParaFazendo(List<Mission__c> missions, Map<Id, Mission__c> mapOldMissions) {
        for(Mission__c mis : missions){
            Mission__c oldMis = mapOldMissions.get(mis.Id);
            if(mis.Player__c != null && oldMis.Player__c == null){
                mis.Status__c = 'In progress';
            }
        }
    }

    public static void playerEscolherMissao(List<Mission__c> missions){
        for(Mission__c mis : missions){
            Sytem.debug(mis);
        }
    }
}