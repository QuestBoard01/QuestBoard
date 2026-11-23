trigger MissionTrigger on Mission__c (before insert) {
    if(Trigger.isInsert){
        ServiceXP.definirXPBaseadoNaDificuldadeEscolhida(Trigger.new);
    }
}




