public with sharing class ServiceXP{ //*NAO PRECISA MUDAR I THINK
    private static final Map<String, Decimal> XP_Por_Dificuldade = new Map<String, Decimal>{
        'Easy'       =>   250,
        'Medium'     =>   1000,
        'Hard'       =>   1500,
        'Super Hard' =>   2000
    };
    
    public static void definirXPBaseadoNaDificuldadeEscolhida(List<Mission__c> missions){
        for (Mission__c mission : missions){
            if (XP_Por_Dificuldade.containsKey(mission.Difficulty__c)){
            mission.XP__c = XP_Por_Dificuldade.get(mission.Difficulty__c);
            }
        }
    }
}