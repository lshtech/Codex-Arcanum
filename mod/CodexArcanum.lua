--- STEAMODDED HEADER
--- MOD_NAME: Codex Arcanum
--- MOD_ID: CodexArcanum
--- MOD_AUTHOR: [itayfeder]
--- MOD_DESCRIPTION: Adds a new set of cards: Alchemy!
--- BADGE_COLOUR: C09D75
--- PRIORITY: -2
----------------------------------------------
------------MOD CODE -------------------------

G.C.SECONDARY_SET.Alchemy = HEX("C09D75")
G.P_CENTER_POOLS.Alchemical = {}
G.localization.descriptions.Alchemical = {}
G.localization.misc.dictionary["k_alchemical"] = "Alchemical"
G.localization.misc.dictionary["p_plus_alchemical"] = "+1 Alchemical"
G.localization.misc.dictionary["p_alchemy_plus_card"] = "+2 Cards"
G.localization.misc.dictionary["p_alchemy_plus_money"] = "+5 Dollars"
G.localization.misc.dictionary["p_alchemy_reduce_blind"] = "Reduce Blind"

CodexArcanum = {}
CodexArcanum.mod_id = 'CodexArcanum'
CodexArcanum.INIT = {}

SMODS.Atlas({ key = "alchemicals", atlas_table = "ASSET_ATLAS", path = "alchemical_atlas.png", px = 71, py = 95})

SMODS.UndiscoveredSprite {
    key = 'Alchemical',
    atlas = 'alchemicals',
    pos = {x = 0, y = 2}
}

SMODS.ConsumableType {
  key = 'Alchemical',
  primary_colour = G.C.SECONDARY_SET.Alchemy,
  secondary_colour = G.C.SECONDARY_SET.Alchemy,
  loc_txt = {
      name = 'Alchemical Cards',
      collection = 'Alchemical Cards',
      undiscovered = {
        name = "Not Discovered",
        text = {
          "Purchase or use",
                  "this card in an",
                  "unseeded run to",
                  "learn what it does"
        },
  },
  },
  collection_rows = { 6, 6 },
  shop_rate = 2,
  rarities = {
      {key = 'Common', rate = 75},
      {key = 'Uncommon', rate = 20},
      {key = 'Rare', rate = 4},
      {key = 'Legendary', rate = 1},
  },
  default = "c_ca_extra"
}

--local create_UIBox_your_collectionref = create_UIBox_your_collection
--function create_UIBox_your_collection()
--    local retval = create_UIBox_your_collectionref()
--    table.insert(retval.nodes[1].nodes[1].nodes[1].nodes[1].nodes[4].nodes[2].nodes, UIBox_button({
--        button = 'your_collection_alchemicals', label = { "Alchemical Cards" }, count = G.DISCOVER_TALLIES.alchemicals, minw = 4, id = 'your_collection_alchemicals', colour = G.C.SECONDARY_SET.Alchemy
--    }))
--    return retval
--end

function SMODS.INIT.CodexArcanum()

	CodexArcanum.mod = SMODS.findModByID(CodexArcanum.mod_id)

  SMODS.load_file(CodexArcanum.mod.path.."api/TagAPI.lua")()
  SMODS.load_file(CodexArcanum.mod.path.."api/BoosterPackRegister.lua")()
  SMODS.load_file(CodexArcanum.mod.path.."api/AlchemicalAPI.lua")()

  SMODS.load_file(CodexArcanum.mod.path.."utils/CA_AlchemyUI.lua")()
  SMODS.load_file(CodexArcanum.mod.path.."utils/CA_CardUtil.lua")()
  
  SMODS.load_file(CodexArcanum.mod.path.."CA_Overrides.lua")()

  SMODS.load_file(CodexArcanum.mod.path.."data/CA_Jokers.lua")()
  SMODS.load_file(CodexArcanum.mod.path.."data/CA_Alchemicals.lua")()
  SMODS.load_file(CodexArcanum.mod.path.."data/CA_BoosterPacks.lua")()
  SMODS.load_file(CodexArcanum.mod.path.."data/CA_Others.lua")()


  for _, v in pairs(CodexArcanum.INIT) do
		if v and type(v) == 'function' then v() end
	end


  loc_colour("mult", nil)
  G.ARGS.LOC_COLOURS["alchemical"] = G.C.SECONDARY_SET.Alchemy

  SMODS.LOAD_LOC()
  SMODS.SAVE_UNLOCKS()
  ALCHEMICAL_SAVE_UNLOCKS()
  --save_tags()

end

----------------------------------------------
------------MOD CODE END----------------------
