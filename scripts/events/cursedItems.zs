#priority 100

import crafttweaker.damage.IDamageSource;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Position3f;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import crafttweaker.data.IData;

var cursedItems =
[
	<zensummoning:altar>.definition.id,
    <minecraft:bedrock>.definition.id,
] as string[];

events.onPlayerItemPickup(function(event as crafttweaker.event.PlayerItemPickupEvent)
{
    var player = event.player;

    //If the player picks up either of these items then they should be given a debuff that kills them
	for cursedItem in cursedItems
	{
		if(cursedItem == event.stackCopy.definition.id)
		{
			if(!player.isPotionActive(<potion:extrautils2:xu2.doom>))
	        {
	            player.addPotionEffect(<potion:extrautils2:xu2.doom>.makePotionEffect(100, 1, false, false));
	        }
		}
	}
});
