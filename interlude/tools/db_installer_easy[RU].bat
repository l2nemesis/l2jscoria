@echo off

REM ####################################################
REM ## ������ ���� � ����� bin ��襣� mysql �ࢥ�   #
REM ####################################################
set mysqlBinPath=C:\Program Files\MySQL\MySQL Server 5.1\bin

set DateT=%date%

REM ####################################################
REM ���䨣��樨 ������祭�� � loginserver ����        #
REM ####################################################
set lsuser=root
set lspass=db_password
set lsdb=l2jdb
set lshost=localhost

REM ####################################################
REM ���䨣��樨 ������祭�� � gameserver ����         #
REM ####################################################
set gsuser=root
set gspass=db_password
set gsdb=l2jdb
set gshost=localhost
REM ####################################################
REM         AHTUNG! ALARM! ALERT! ��������!            #
REM �� �������� ������ ����� ���� �� ������ ���������  #
REM ������ ���������� � ������� ��� �����������������  #
REM !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! #
REM ####################################################

set mysqldumpPath="%mysqlBinPath%\mysqldump"
set mysqlPath="%mysqlBinPath%\mysql"


:Step1
cls
echo. ____________________________________________________________
echo.
echo.   �ணࠬ�� �� ������� ��ࢨ��� ������ www.scoria.ru
echo. ____________________________________________________________
echo. �� ����᪠ �ணࠬ�� 㪠��� ���� � mysql, �����, ��஫�, ��� ���� ������
echo. �᫨ ����� �� ���� 㪠���� - ��⠭��騪 ������� ᢮� ࠡ���.
echo. ____________________________________________________________
echo.   1 - ������ ��ࢨ筮�� ����� ��� loginserver
echo.   2 - ������ ��ࢨ筮�� ����� ��� gameserver
echo.   3 - ������஢��� custom ⠡���� � ���� gameserver
echo.   4 - ��� �� �ணࠬ��
echo. ____________________________________________________________

set Step1prompt=x
set /p Step1prompt=������ ����室���� ����⢨�:
if /i %Step1prompt%==1 goto LoginInstall
if /i %Step1prompt%==2 goto Step2
if /i %Step1prompt%==3 goto addinstall
if /i %Step1prompt%==4 goto fullend
goto Step1


:LoginInstall
@cls
echo.
echo ������塞 ���� ������ %lsdb% ⠡��栬� loginserver.
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < login_install.sql
echo ��⠭�������� ⠡���� accounts.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/accounts.sql
echo ��⠭�������� ⠡���� gameservers.sql
%mysqlPath% -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% < ../sql/gameservers.sql
echo ������ ������ ⠡��� �����襭.
pause
goto :Step2

:Step2
@cls
echo. ___________________________________________________________
echo.
echo.	������ ��ࢨ��� ������ ⠡��� gameserver
echo. ___________________________________________________________
echo.
echo.   1 - ������஢��� �����, 㤠��� �������騥 ⠡����
echo.   2 - ���
echo. ___________________________________________________________

set Step2prompt=x
set /p Step2prompt=������ ����室���� ����⢨�:
if /i %Step2prompt%==1 goto fullinstall
if /i %Step2prompt%==2 goto fullend
goto Step2

:fullinstall
@cls
echo ���⪠ ��� ������ gameserver.
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < full_install.sql
goto CreateTables

:CreateTables
@cls
echo.
echo �������㥬 ���� ���� gameserver � ���� %gsdb%
echo ������ ���� ������ ��� ��砫� �����
pause
echo ��⠭�������� ⠡���� access_levels.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/access_levels.sql 
echo ��⠭�������� ⠡���� armor.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/armor.sql 
echo ��⠭�������� ⠡���� auction.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/auction.sql 
echo ��⠭�������� ⠡���� auction_bid.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/auction_bid.sql 
echo ��⠭�������� ⠡���� auction_watch.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/auction_watch.sql 
echo ��⠭�������� ⠡���� augmentations.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/augmentations.sql 
echo ��⠭�������� ⠡���� doors.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/doors.sql 
echo ��⠭�������� ⠡���� delay_item.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/delay_item.sql
echo ��⠭�������� ⠡���� auto_announcements.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/auto_announcements.sql 
echo ��⠭�������� ⠡���� auto_chat.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/auto_chat.sql 
echo ��⠭�������� ⠡���� auto_chat_text.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/auto_chat_text.sql 
echo ��⠭�������� ⠡���� buff_profile.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/buff_profile.sql 
echo ��⠭�������� ⠡���� castle.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/castle.sql 
echo ��⠭�������� ⠡���� castle_door.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/castle_door.sql 
echo ��⠭�������� ⠡���� castle_doorupgrade.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/castle_doorupgrade.sql 
echo ��⠭�������� ⠡���� castle_siege_guards.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/castle_siege_guards.sql 
echo ��⠭�������� ⠡���� char_templates.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/char_templates.sql 
echo ��⠭�������� ⠡���� character_friends.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_friends.sql 
echo ��⠭�������� ⠡���� character_hennas.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_hennas.sql 
echo ��⠭�������� ⠡���� character_macroses.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_macroses.sql 
echo ��⠭�������� ⠡���� character_quests.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_quests.sql 
echo ��⠭�������� ⠡���� character_raid_points.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_raid_points.sql 
echo ��⠭�������� ⠡���� character_recipebook.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_recipebook.sql 
echo ��⠭�������� ⠡���� char_creation_items.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/char_creation_items.sql 
echo ��⠭�������� ⠡���� character_recommends.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_recommends.sql 
echo ��⠭�������� ⠡���� character_shortcuts.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_shortcuts.sql 
echo ��⠭�������� ⠡���� character_settings.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_settings.sql 
echo ��⠭�������� ⠡���� character_skills.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_skills.sql 
echo ��⠭�������� ⠡���� character_votes.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_votes.sql 
echo ��⠭�������� ⠡���� character_skills_save.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_skills_save.sql 
echo ��⠭�������� ⠡���� character_subclasses.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_subclasses.sql 
echo ��⠭�������� ⠡���� character_offline_trade_items.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_offline_trade_items.sql 
echo ��⠭�������� ⠡���� character_offline_trade.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_offline_trade.sql 
echo ��⠭�������� ⠡���� characters.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/characters.sql 
echo ��⠭�������� ⠡���� clan_data.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/clan_data.sql 
echo ��⠭�������� ⠡���� clan_privs.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/clan_privs.sql 
echo ��⠭�������� ⠡���� clan_skills.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/clan_skills.sql 
echo ��⠭�������� ⠡���� clan_subpledges.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/clan_subpledges.sql 
echo ��⠭�������� ⠡���� clan_wars.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/clan_wars.sql 
echo ��⠭�������� ⠡���� clan_notices.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/clan_notices.sql 
echo ��⠭�������� ⠡���� clanhall.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/clanhall.sql 
echo ��⠭�������� ⠡���� clanhall_functions.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/clanhall_functions.sql 
echo ��⠭�������� ⠡���� class_list.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/class_list.sql 
echo ��⠭�������� ⠡���� cursed_weapons.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/cursed_weapons.sql 
echo ��⠭�������� ⠡���� dimensional_rift.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/dimensional_rift.sql 
echo ��⠭�������� ⠡���� droplist.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/droplist.sql 
echo ��⠭�������� ⠡���� enchant_skill_trees.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/enchant_skill_trees.sql 
echo ��⠭�������� ⠡���� etcitem.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/etcitem.sql 
echo ��⠭�������� ⠡���� etcitem.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/etcitem.sql 
echo ��⠭�������� ⠡���� fish.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/fish.sql 
echo ��⠭�������� ⠡���� fishing_skill_trees.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/fishing_skill_trees.sql 
echo ��⠭�������� ⠡���� forums.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/forums.sql 
echo ��⠭�������� ⠡���� games.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/games.sql 
echo ��⠭�������� ⠡���� global_tasks.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/global_tasks.sql 
echo ��⠭�������� ⠡���� grandboss_data.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/grandboss_data.sql 
echo ��⠭�������� ⠡���� grandboss_list.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/grandboss_list.sql 
echo ��⠭�������� ⠡���� helper_buff_list.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/helper_buff_list.sql 
echo ��⠭�������� ⠡���� henna_trees.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/henna_trees.sql 
echo ��⠭�������� ⠡���� heroes.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/heroes.sql 
echo ��⠭�������� ⠡���� items.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/items.sql 
echo ��⠭�������� ⠡���� itemsonground.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/itemsonground.sql 
echo ��⠭�������� ⠡���� locations.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/locations.sql 
echo ��⠭�������� ⠡���� lvlupgain.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/lvlupgain.sql 
echo ��⠭�������� ⠡���� merchant_areas_list.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/merchant_areas_list.sql 
echo ��⠭�������� ⠡���� merchant_buylists.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/merchant_buylists.sql 
echo ��⠭�������� ⠡���� merchant_lease.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/merchant_lease.sql 
echo ��⠭�������� ⠡���� merchant_shopids.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/merchant_shopids.sql 
echo ��⠭�������� ⠡���� merchants.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/merchants.sql 
echo ��⠭�������� ⠡���� minions.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/minions.sql 
echo ��⠭�������� ⠡���� mods_wedding.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/mods_wedding.sql 
echo ��⠭�������� ⠡���� npc.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/npc.sql 
echo ��⠭�������� ⠡���� npc_to_pc_polymorph.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/npc_to_pc_polymorph.sql 
echo ��⠭�������� ⠡���� npcskills.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/npcskills.sql 
echo ��⠭�������� ⠡���� olympiad_nobles.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/olympiad_nobles.sql 
echo ��⠭�������� ⠡���� pets.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/pets.sql 
echo ��⠭�������� ⠡���� pets_stats.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/pets_stats.sql 
echo ��⠭�������� ⠡���� pledge_skill_trees.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/pledge_skill_trees.sql 
echo ��⠭�������� ⠡���� posts.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/posts.sql 
echo ��⠭�������� ⠡���� raidboss_spawnlist.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/raidboss_spawnlist.sql 
echo ��⠭�������� ⠡���� random_spawn.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/random_spawn.sql 
echo ��⠭�������� ⠡���� random_spawn_loc.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/random_spawn_loc.sql 
echo ��⠭�������� ⠡���� seven_signs.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/seven_signs.sql 
echo ��⠭�������� ⠡���� seven_signs_festival.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/seven_signs_festival.sql 
echo ��⠭�������� ⠡���� seven_signs_status.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/seven_signs_status.sql 
echo ��⠭�������� ⠡���� siege_clans.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/siege_clans.sql 
echo ��⠭�������� ⠡���� skill_learn.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/skill_learn.sql 
echo ��⠭�������� ⠡���� skill_spellbooks.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/skill_spellbooks.sql 
echo ��⠭�������� ⠡���� skill_trees.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/skill_trees.sql 
echo ��⠭�������� ⠡���� spawnlist.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/spawnlist.sql 
echo ��⠭�������� ⠡���� teleport.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/teleport.sql 
echo ��⠭�������� ⠡���� topic.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/topic.sql 
echo ��⠭�������� ⠡���� weapon.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/weapon.sql 
echo ��⠭�������� ⠡���� zone_vertices.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/zone_vertices.sql 
echo ��⠭�������� ⠡���� quest_global_data.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/quest_global_data.sql 
echo ��⠭�������� ⠡���� castle_manor_procure.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/castle_manor_procure.sql 
echo ��⠭�������� ⠡���� castle_manor_production.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/castle_manor_production.sql 
echo ��⠭�������� ⠡���� custom_weapon.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/custom_weapon.sql 
echo ��⠭�������� ⠡���� custom_npc.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/custom_npc.sql 
echo ��⠭�������� ⠡���� custom_teleport.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/custom_teleport.sql 
echo ��⠭�������� ⠡���� custom_armor.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/custom_armor.sql 
echo ��⠭�������� ⠡���� custom_armorsets.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/custom_armorsets.sql 
echo ��⠭�������� ⠡���� custom_contestable_clanhalls.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/custom_contestable_clanhalls.sql 
echo ��⠭�������� ⠡���� custom_merchant_shopids.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/custom_merchant_shopids.sql 
echo ��⠭�������� ⠡���� custom_droplist.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/custom_droplist.sql 
echo ��⠭�������� ⠡���� custom_merchant_buylists.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/custom_merchant_buylists.sql 
echo ��⠭�������� ⠡���� custom_etcitem.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/custom_etcitem.sql 
echo ��⠭�������� ⠡���� rebirth_manager.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/rebirth_manager.sql 
echo ��⠭�������� ⠡���� remove_unneeded_spawns.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/remove_unneeded_spawns.sql 
echo ��⠭�������� ⠡���� admin_command_access_rights.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/admin_command_access_rights.sql 
echo ��⠭�������� ⠡���� pkkills.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/pkkills.sql 
echo ��⠭�������� ⠡���� characters_custom_data.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/characters_custom_data.sql 
echo ��⠭�������� ⠡���� tvt.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/tvt.sql 
echo ��⠭�������� ⠡���� tvt_teams.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/tvt_teams.sql 
echo ��⠭�������� ⠡���� character_recipebook.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/character_recipebook.sql 
echo ��⠭�������� ⠡���� fort_door.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/fort_door.sql 
echo ��⠭�������� ⠡���� fort_doorupgrade.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/fort_doorupgrade.sql 
echo ��⠭�������� ⠡���� fort_siege_guards.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/fort_siege_guards.sql 
echo ��⠭�������� ⠡���� fort.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/fort.sql 
echo ��⠭�������� ⠡���� fortsiege_clans.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/fortsiege_clans.sql 
echo ��⠭�������� ⠡���� four_sepulchers_spawnlist.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/four_sepulchers_spawnlist.sql 
echo ��⠭�������� ⠡���� custom_spawnlist_clear.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/custom_spawnlist_clear.sql 
echo ��⠭�������� ⠡���� vanhalter_spawnlist.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/vanhalter_spawnlist.sql 
echo ��⠭�������� ⠡���� clanhall_siege.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/clanhall_siege.sql 
echo ��⠭�������� ⠡���� powerpak.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/powerpak.sql 
echo ��⠭�������� ⠡���� paystream.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/paystream.sql 
echo ��⠭�������� ⠡���� l2votes.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/l2votes.sql 
echo ��⠭�������� ⠡���� smsonline.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/smsonline.sql 
echo ��⠭�������� ⠡���� bw_teams.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/bw_teams.sql 
echo ��⠭�������� ⠡���� ctf_teams.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/ctf_teams.sql 
echo ��⠭�������� ⠡���� custom_npc.sql � ���� %gsdb%
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/custom_npc.sql
echo ��⠭���� �����襭� ������ ���� �������
pause
goto :Step1

:addinstall
@cls
echo.
echo ��⠭�������� ���⠭����� �窨 �ᯮ������� npc - custom_spawnlist
%mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < ../sql/custom_spawnlist.sql
echo �������㥬 ⠡���� custom_spawnlist.sql � ���� %gsdb%
pause
:end
echo.
echo ������ �����襭
echo.
pause
goto :Step1

:end
echo.
echo ��ᢨ�����
echo.
pause

:fullend
