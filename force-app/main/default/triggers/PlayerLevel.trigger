trigger PlayerLevel on Player__c (after update) {
    if(Trigger.isUpdate){
        TestLevelPlayer.playerReward(Trigger.new, Trigger.oldMap);
    }
}
