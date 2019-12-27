
//Function for adding tooltips to items
function AddTooltip(item as crafttweaker.item.IItemStack, lines as crafttweaker.formatting.IFormattedText[]) {
    item.addTooltip(format.green("|| R.E.E.D. I.T. Advice ||"));
    for line in lines {
        item.addTooltip(format.white(line));
    }
}
