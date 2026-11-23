trigger MissionPlayer on MissionPlayer__c (before update, after update) {
    if(Trigger.isUpdate && Trigger.isAfter){
        ServiceMissionStatus.missaoDeclaradaFeitaStatusVaiProPlayer(Trigger.new, Trigger.oldMap);
    }
}