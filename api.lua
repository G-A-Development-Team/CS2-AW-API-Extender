-- API Extender - Dev - Made By: Carter Poe & Agentsix1
-- This is not ready for full release and has not been fully tested
-- Use with caution!

function GetPlayerControllers()
    return entities.FindByClass("CCSPlayerController")
end

function GetPlayerResources()
    return entities.GetPlayerResources()
end

function GetGameRules()
    return entities.FindByClass( "C_CSGameRules" )
    --return entities.GetGameRules()
end

function LocalPlayer()
    return entities.GetLocalPlayer()
end

function Players()
    return entities.FindByClass( "C_CSPlayerPawn" )
end

function CurTime()
    return globals.CurTime()
end

function player( ply )

    local self = {}
    
    function self:Health() -- Integer
        if not ply then return nil end
        if not ply:IsAlive() then return 0 end
        return ply:GetHealth()
    end

    function self:Armor() -- Integer
        if not ply then return nil end
        if not ply:IsAlive() then return 0 end
        return ply:GetFieldInt("m_ArmorValue")
    end

    function self:TeamNumber() -- Integer
        return ply:GetTeamNumber()
    end

    function self:TeamColor() -- r, g, b, a 255 Integer
        local teamnum = ply:GetTeamNumber()
        if teamnum == 2 then return 230, 70, 70, 255 end
        if teamnum == 3 then return 70, 160, 240, 255 end
        if teamnum == 1 then return 200, 200, 200, 255 end
        return 180, 180, 180, 255
    end

    function self:TeamName() -- String
        local teamnum = ply:GetTeamNumber()
        if teamnum == 2 then return "Terrorists" end
        if teamnum == 3 then return "Counter-Terrorists" end
        if teamnum == 1 then return "Spectator" end
        return "Unassigned"
    end

    function self:Alive() -- Boolean
        if not ply then return nil end
        return ply:IsAlive()
    end

    function self:EyeAngle() -- Vector
        if not ply then return nil end
        return ply:GetFieldVector("m_angEyeAngles")
    end

    function self:EyeAngleSpeed() -- Vector
        if not ply then return nil end
        return ply:GetFieldVector("m_angEyeAnglesVelocity")
    end

    function self:GunGameImmunity() -- Boolean
        if not ply then return nil end
        return ply:GetFieldBool("m_bGunGameImmunity")
    end

    function self:InBombZone() -- Boolean
        if not ply then return nil end
        return ply:GetFieldBool("m_bInBombZone")
    end
    
    function self:BuyZone() -- Boolean
        if not ply then return nil end
        return ply:GetFieldBool("m_bInBuyZone")
    end
    
    function self:HostageZone() -- Boolean
        if not ply then return nil end
        return ply:GetFieldBool("m_bInHostageRescueZone")
    end
    
    function self:Landing() -- Boolean
        if not ply then return nil end
        return ply:GetFieldBool("m_bInLanding")
    end
    
    function self:NoDefuseArea() -- Boolean
        if not ply then return nil end
        return ply:GetFieldBool("m_bInNoDefuseArea")
    end
    
    function self:BuyMenuOpen() -- Boolean
        if not ply then return nil end
        return ply:GetFieldBool("m_bIsBuyMenuOpen")
    end
    
    function self:Defusing() -- Boolean
        if not ply then return nil end
        return ply:GetFieldBool("m_bIsDefusing")
    end
    
    function self:GrabbingHostage() -- Boolean
        if not ply then return nil end
        return ply:GetFieldBool("m_bIsGrabbingHostage")
    end
    
    function self:Scoped() -- Boolean
        if not ply then return nil end
        return ply:GetFieldBool("m_bIsScoped")
    end
    
    function self:Walking() -- Boolean
        if not ply then return nil end
        return ply:GetFieldBool("m_bIsWalking")
    end
    
    function self:LeftHanded() -- Boolean
        if not ply then return nil end
        return ply:GetFieldBool("m_bLeftHanded")
    end
    
    function self:RetakesHasDefuseKit() -- Boolean
        if not ply then return nil end
        return ply:GetFieldBool("m_bRetakesHasDefuseKit")
    end
    
    function self:Index() -- Integer
        if not ply then return nil end
        return ply:GetIndex()
    end

    function self:Player() -- Integer
        if not ply then return nil end
        return ply
    end
    
    function self:BombZone() -- Integer 0 - 3
        if not ply then return nil end
        return ply:GetFieldInt("m_nWhichBombZone")
    end

    function self:Name() -- String
        if not ply then return nil end
        return ply:GetName()
    end

    function self:ModelName() -- String
        if not ply then return nil end
        return ply:GetModelName()
    end
    
    function self:MaxHealth() -- Int
        if not ply then return nil end
        return ply:GetMaxHealth()
    end

    function self:IsPlayer() -- Boolean
        if not ply then return nil end
        return ply:IsPlayer()
    end

    function self:Maxs() -- Vector
        if not ply then return nil end
        return ply:GetMaxs()
    end

    function self:Mins() -- Vector
        if not ply then return nil end
        return ply:GetMins()
    end

    function self:Class() -- String
        if not ply then return nil end
        return ply:GetClass()
    end

    function self:AbsOrigin() -- Vector
        if not ply then return nil end
        return ply:GetAbsOrigin()
    end

    local STEAMID64_BASE = 76561197960265728

    function self:SteamID32() -- Int
        if not ply then return nil end
        local cont = self:Controller()
        return cont:GetFieldInt( "m_steamID" )
    end

    function self:SteamID64() -- String
        if not ply then return nil end
        local steam32_num = self:SteamID32()
        local steam64 = STEAMID64_BASE + steam32_num
        return tostring(steam64)
    end

    function self:SteamID3()
        if not ply then return nil end
        local steam32_num = self:SteamID32()
        return "[U:1:" .. steam32_num .. "]"
    end

    function self:SteamID() -- String
        if not ply then return nil end
        local steam32_num = self:SteamID32()
        local y = steam32_num % 2
        local z = math.floor(steam32_num / 2)
        return "STEAM_0:" .. y .. ":" .. z
    end

    function self:UserID()
        return cheat.GetUserID()
    end

    function self:Username()
        return cheat.GetUserName()
    end

    function self:IsBot() -- String
        if not ply then return nil end
        return not ply:IsPlayer()
    end

    function self:Controller()
        local players = GetPlayerControllers()
        players = entities.FindByClass("CCSPlayerController")
        if #players == 1 then
            return players[1]
        else
            for id, play in pairs( players ) do
                local pawn = play:GetFieldEntity( "m_hPlayerPawn" )
                if ply:GetIndex() == pawn:GetIndex() then
                    return play
                end
            end
        end
        
        return nil
    end

    function self:Defuser() -- Boolean
        if not ply then return nil end
        if self:TeamNumber() ~= 3 then return false end
        local cont = self:Controller()
        return cont:GetFieldBool( "m_bPawnHasDefuser" )
    end

    function self:Helmet() -- Boolean
        if not ply then return nil end
        local cont = self:Controller()
        return cont:GetFieldBool( "m_bPawnHasHelmet" )
    end

    function self:MVPs() -- Integer
        if not ply then return nil end
        local cont = self:Controller()
        return cont:GetFieldInt( "m_iMVPs" )
    end

    function self:MusicKitID() -- Integer
        if not ply then return nil end
        local cont = self:Controller()
        return cont:GetFieldInt( "m_iMusicKitID" )
    end

    function self:SetMusicKitID( kitid ) -- None
        if not ply then return nil end
        local cont = self:Controller()
        cont:SetFieldInt( "m_iMusicKitID" )
    end

    function self:MusicKitMVPs() -- Integer
        if not ply then return nil end
        local cont = self:Controller()
        return cont:GetFieldInt( "m_iMusicKitMVPs" )
    end

    function self:Ping() -- Integer
        if not ply then return nil end
        local cont = self:Controller()
        return cont:GetFieldInt( "m_iPing" )
    end

    function self:Score() -- Integer
        if not ply then return nil end
        local cont = self:Controller()
        return cont:GetFieldInt( "m_iScore" )
    end

    function self:Kills() -- Integer
        if not ply then return nil end
        local cont = self:Controller()
        return cont:GetFieldInt( "m_nKillCount" )
    end

    function self:DominatingIndex() -- Integer
        if not ply then return nil end
        local cont = self:Controller()
        return cont:GetFieldInt( "m_nPlayerDominated" )
    end

    function self:Dominating() -- Player Pawn
        if not ply then return nil end
        for _, dm in pairs( Players() ) do
            if dm:GetIndex() == self:DominatingIndex() then
                return dm
            end
        end
        return nil
    end

    function self:DominatedByIndex() -- Integer
        if not ply then return nil end
        local cont = self:Controller()
        return cont:GetFieldInt( "m_nPlayerDominatingMe" )
    end

    function self:DominatedBy() -- Player Pawn
        if not ply then return nil end
        for _, dm in pairs( Players() ) do
            if dm:GetIndex() == self:DominatedByIndex() then
                return dm
            end
        end
        return nil
    end

    return self
end


function Game()
    local self = {}
    --[[
    function self:BombPlanted()
        local rules = GetGameRules()
        return rules:GetFieldBool( "m_bBombPlanted" )
    end

    function self:BombDropped()
        local rules = GetGameRules()
        return rules:GetFieldBool( "m_bBombDropped" )
    end

    function self:MatchStartTime() -- Float
        local rules = GetGameRules()
        return rules:GetFieldFloat( "m_fMatchStartTime" )
    end

    function self:RoundStartTime() -- Float
        local rules = GetGameRules()
        return rules:GetFieldFloat( "m_fRoundStartTime" )
    end

    function self:RoundTime() -- Float
        local rules = GetGameRules()
        return rules:GetFieldFloat( "m_iRoundTime" )
    end

    function self:Hostages() -- Float
        local rules = GetGameRules()
        return rules:GetFieldFloat( "m_iHostagesRemaining" )
    end
    ]]

    function self:GetFirstBomb()
        entities.FindByClass("C_C4")
        local bombs = entities.FindByClass("C_C4")
        if bombs == nil then return nil end
        for i = 1, #bombs do
            if not bombs[i]:GetFieldBool("m_bBombPlanted") then
                return bombs[i]
            end
        end
        return nil 
    end

    function self:GetFirstPlantedBomb() -- C4 Entity/nil
        local bombs = entities.FindByClass("C_PlantedC4")
        if bombs == nil then return nil end
        for i = 1, #bombs do
            if bombs[i]:GetFieldBool("m_bBombTicking") then
                return bombs[i]
            end
        end
        return nil    
    end

    function self:SiteName( index ) -- String
        if index == 0 then
            return "None"
        elseif index == 1 then
            return "A"
        elseif index == 2 then
            return "B"
        elseif index == 3 then
            return "A/B"
        end
        return nil
    end

    self.bomb_radius_default = 2284

    self.bomb_radius_maplist = {
        ["maps/de_ancient.vpk"]  = 2284,
        ["maps/de_anubis.vpk"]   = 1600,
        ["maps/de_assembly.vpk"] = 500 * 3.5,
        ["maps/de_inferno.vpk"]  = 2100,
        ["maps/de_mills.vpk"]    = 500 * 3.5,
        ["maps/de_mirage.vpk"]   = 2284,
        ["maps/de_nuke.vpk"]     = 2284,
        ["maps/de_overpass.vpk"] = 2284,
        ["maps/de_thera.vpk"]    = 500 * 3.5,
        ["maps/de_vertigo.vpk"]  = 1750,
        ["maps/de_golden.vpk"]  = 1750,
        ["maps/de_rooftop.vpk"]  = 1750,
        ["maps/de_palacio.vpk"]  = 1991,
        ["maps/de_train.vpk"]  = 1750,
        ["maps/de_dust2.vpk"]  = 2456
    }
    return self
end

function C4( c4 )
    local self = {}

    function self:Blow() -- Float
        if not c4 then return nil end
        return c4:GetFieldFloat( "m_flC4Blow" )
    end

    function self:DefuseCountDown() -- Float
        if not c4 then return nil end
        return c4:GetFieldFloat( "m_flDefuseCountDown" )
    end

    function self:BeingDefused() -- Boolean
        if not c4 then return nil end
        return c4:GetFieldBool( "m_bBeingDefused" )
    end

    function self:DefuseLength() -- Float
        if not c4 then return nil end
        return c4:GetFieldFloat( "m_flDefuseLength" )
    end

    function self:TimerLength() -- Float
        if not c4 then return nil end
        return c4:GetFieldFloat( "m_flTimerLength" )
    end

    function self:BombSite() -- Integer
        if not c4 then return nil end
        return c4:GetFieldInt( "m_nBombSite" )
    end

    function self:BombSiteName() -- String
        if not c4 then return nil end
        return Game():SiteName( self:BombSite()+1 )
    end

    function self:Exploded() -- Boolean
        if not c4 then return nil end
        return c4:GetFieldBool( "m_bHasExploded" )
    end

    function self:Defused() -- Boolean
        if not c4 then return nil end
        return c4:GetFieldBool( "m_bBombDefused" )
    end

    function self:Defuser() -- Player Enitity
        if not c4 then return nil end
        return c4:GetFieldEntity( "m_hBombDefuser" )
    end

    function self:Planting() -- Player Enitity
        if not c4 then return nil end
        return c4:GetFieldBool( "m_bStartedArming" )
    end

    function self:PlantingAlt() -- Player Enitity
        if not c4 then return nil end
        return c4:GetFieldBool( "m_bIsPlantingViaUse" )
    end

    function self:PlantingTime() -- Player Enitity
        if not c4 then return nil end
        return c4:GetFieldFloat( "m_fArmedTime" )
    end

    function self:Self()
        return c4
    end
    return self
end

print( "API Extender - Dev - Made By: Carter Poe & Agentsix1 (11.5.2025)" )
