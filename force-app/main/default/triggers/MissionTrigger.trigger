trigger MissionTrigger on Mission__c (before insert, before update, after update) {
    if(Trigger.isInsert){
        ServiceXP.definirXPBaseadoNaDificuldadeEscolhida(Trigger.new);}
    

    if(Trigger.isUpdate && Trigger.isBefore){
        ServicePlayerMission.atribuirMissaoParaFazendo(Trigger.new, Trigger.oldMap);
    }

    if(Trigger.isUpdate && Trigger.isAfter){
        ServiceMissionStatus.missaoDeclaradaFeitaStatusVaiProPlayer(Trigger.new, Trigger.oldMap);
    }
}