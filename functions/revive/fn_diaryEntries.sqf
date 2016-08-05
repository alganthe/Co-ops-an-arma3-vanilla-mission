/*
* Author: alganthe
* Adds derp_revive diary entries
*
* Arguments:
* none
*
* Return Value:
* nothing
*/
player createDiarySubject ["derp_revive", "derp revive"];
player createDiaryRecord ["derp_revive", ["Credits", "
<br/> <font face= 'PuristaLight' color= '#D3D3D3' size= 14> Author:</font>  <font size= 14>Alganthe</font>
<br/> <font face= 'PuristaLight' color= '#D3D3D3' size= 14> PFH code:</font>    <font size= 14>CBA's team, authors for each functions in the headers.</font>

"]];

private _everyoneCanRevive = "everyone";
if (getMissionConfigValue ["derp_revive_everyoneCanRevive", 0] isEqualTo 0) then {
    _everyoneCanRevive = "medics only";
};

private _reviveItem = "Medikit";
if (getMissionConfigValue ["derp_revive_reviveItem", 0] isEqualTo 0) then {
    _reviveItem = "FAK";
};

private _removeFakOnUse = "true";
if (getMissionConfigValue ["derp_revive_removeFAKOnUse", 0] isEqualTo 0) then {
    _removeFakOnUse = "false";
};

player createDiaryRecord ["derp_revive", ["Parameters", format [
"
<br/> <font face= 'PuristaLight' color= '#D3D3D3' size= 14> Bleed out timer:</font>   <font size= 14>%1</font>
<br/> <font face= 'PuristaLight' color= '#D3D3D3' size= 14> Who can revive:</font>    <font size= 14>%2</font>
<br/> <font face= 'PuristaLight' color= '#D3D3D3' size= 14> Revive item:</font>    <font size= 14>%3</font>
<br/> <font face= 'PuristaLight' color= '#D3D3D3' size= 14> Remove FAK on use:</font>     <font size= 14>%4</font>
",
(getMissionConfigValue ["derp_revive_bleedOutTimer", 300]),
_everyoneCanRevive,
_reviveItem,
_removeFakOnUse
]]];

player createDiaryRecord ["derp_revive", ["Having an issue?", "
<br/> <font face= 'PuristaLight' color= '#D3D3D3' size= 14> Issue tracker:</font> <font size= 14>https://github.com/alganthe/Co-ops/issues</font>
"]];

player createDiaryRecord ["derp_revive", ["FAQ", "
<br/> <font face= 'PuristaLight' color= '#D3D3D3' size= 14>Q:</font>Why do I sometimes die straight away instead of entering the downed state?<font size= 14></font>
<br/> <font face= 'PuristaLight' color= '#D3D3D3' size= 14>A:</font>Entering the downed state or not is based on the amount of damage you took, if you get shot in the head you'll die straight away, same for a tank shell to the torso, or even 5.56 to the pelvis.<font size= 14></font>
<br/>
<br/> <font face= 'PuristaLight' color= '#D3D3D3' size= 14>Q:</font>I'm pressing the revive button but it doesn't revive the downed person, what should I do?<font size= 14></font>
<br/> <font face= 'PuristaLight' color= '#D3D3D3' size= 14>A:</font>You need to hold the button.<font size= 14></font>
"]];
