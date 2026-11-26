trigger MissionPlayer on MissionPlayer__c (before update, after update) {
    if(Trigger.isUpdate && Trigger.isAfter){
        MissionStatusService.earnXP(Trigger.new, Trigger.oldMap);
    }
}