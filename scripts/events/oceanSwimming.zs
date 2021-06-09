#priority 100

import crafttweaker.damage.IDamageSource;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Position3f;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;
import crafttweaker.data.IData;

function getHeadBlockPos(player as IPlayer) as IBlockPos
{
    return player.position.getOffset(IFacing.up(), 1);
}

function isInOceanBiome(player as IPlayer) as bool
{
    return player.world.getBiome(player.position).name.contains("Ocean") || player.world.getBiome(player.position).name.contains("Coral Reef") || player.world.getBiome(player.position).name.contains("Kelp Forest");
}

function playerWearingScubaGear(player as IPlayer, head as IEntityEquipmentSlot, chest as IEntityEquipmentSlot) as bool
{
    if(player.hasItemInSlot(head) && player.hasItemInSlot(chest))
    {
        var playerHeadItem as crafttweaker.item.IItemStack = player.getItemInSlot(head);
        var playerChestItem as crafttweaker.item.IItemStack = player.getItemInSlot(chest);

        //Check if they are wearing a gas mask
        if(playerHeadItem.matches(<mekanism:gasmask>))
        {
            //Since they have a gasmask, check if they're wearing a gas tank
            if(playerChestItem.definition.id == "mekanism:scubatank")
            {
                //Check if the gas tank has air
                if(!isNull(playerChestItem.tag.memberGet("mekData")))
                {
                    var mekData as IData = playerChestItem.tag.memberGet("mekData");

                    if(!isNull(mekData.stored))
                    {
                        var storedData as IData = mekData.stored;

                        if(!isNull(storedData.amount))
                        {
                            var gasAmount as IData = storedData.amount;
                            var gasStored as int = gasAmount.asInt();

                            if(gasStored > 0 as int)
                            {
                                return true;
                            }
                        }
                    }
                }
            }
        }
    }

    return false;
}

events.onPlayerTick(function(event as crafttweaker.event.PlayerTickEvent)
{

    if( event.side != "SERVER" ||
        event.phase != "END")
    {
        return;
    }

    var player = event.player;
    if(!player.creative && isInOceanBiome(player) && player.y < 44.0)
    {
        var headBlock = player.world.getBlock(getHeadBlockPos(player));

        if (headBlock.definition.id == "minecraft:water")
        {
            //Deal damage to the player regularly
            if(player.world.getWorldTime() as long % 20 == 0)
            {
                if(player.getAir() == 0)
                {
                    player.attackEntityFrom(IDamageSource.DROWN(), 5.0);
                }
            }
        }
        else
        {
            //Player is in a block or (more likely) breathing air
            var playerHeadSlot = IEntityEquipmentSlot.head();
            var playerChestSlot = IEntityEquipmentSlot.chest();

            var protectedFromToxicAir as bool = false;

            //Check if they're wearing a chestplate or helmet
            if(player.hasGameStage("stage_ii_oceanbreathing") || playerWearingScubaGear(player, playerHeadSlot, playerChestSlot))
            {
                protectedFromToxicAir = true;
            }

            //Give the player wither if they're not protected and don't have it already
            if(!protectedFromToxicAir && !player.isPotionActive(<potion:minecraft:wither>))
            {
                server.commandManager.executeCommand(server, "/title " + player.name + " actionbar [\"\",{\"text\": \"The air is toxic here! You cannot breathe this!\", \"color\":\"dark_purple\"}]");
                player.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(20, 3, false, false));
            }
        }
    }
});
