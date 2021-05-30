#priority 100

import crafttweaker.damage.IDamageSource;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.player.IPlayer;
import crafttweaker.util.Position3f;
import crafttweaker.world.IBlockPos;
import crafttweaker.world.IFacing;

function getHeadBlockPos(player as IPlayer) as IBlockPos
{
    return player.position.getOffset(IFacing.up(), 1);
}

function isInOceanBiome(player as IPlayer) as bool
{
    return player.world.getBiome(player.position).name.contains("Ocean") || player.world.getBiome(player.position).name.contains("Coral Reef") || player.world.getBiome(player.position).name.contains("Kelp Forest");
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

        if (headBlock.definition.id == "minecraft:water" || player.air == 0)
        {
            //Deal damage to the player regularly
            if(player.world.getWorldTime() as long % 20 == 0)
            {
                player.attackEntityFrom(IDamageSource.DROWN(), 5.0);
            }
        }
        else
        {
            if(!player.isPotionActive(<potion:minecraft:wither>))
            {
                server.commandManager.executeCommand(server, "/title " + player.name + " actionbar [\"\",{\"text\": \"The air is toxic here! You cannot breathe this!\", \"color\":\"dark_purple\"}]");
                player.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(20, 3, false, false));
            }
        }
    }
});
