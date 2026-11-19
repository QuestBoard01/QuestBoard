public with sharing class ServiceXP {
    public static void definirXPBaseadoNaDificuldadeEscolhida(List<MissionPlayer__c> missions) {
        for(MissionPlayer__c mission : missions) {
            switch on mission.Difficulty__c {
                when 'Easy' {
                    mission.XP__c = 250;
                }
                when 'Medium' {
                    mission.XP__c = 1000;
                }
                when 'Hard' {
                    mission.XP__c = 1500;
                }
                when 'Super Hard'{
                    mission.XP__c = 2000;
                }
            }
        }     
    }
}