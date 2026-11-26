public with sharing class XPService{ 
    private static final Map<String, Decimal> difficultyXP = new Map<String, Decimal>{
        'Easy'       =>   250,
        'Medium'     =>   1000,
        'Hard'       =>   1500,
        'Super Hard' =>   2000
    };
    
    public static void defineMissionXP(List<Mission__c> missions){
        for (Mission__c mission : missions){
            if (difficultyXP.containsKey(mission.Difficulty__c)){
            mission.XP__c = difficultyXP.get(mission.Difficulty__c);
            }
        }
    }
}