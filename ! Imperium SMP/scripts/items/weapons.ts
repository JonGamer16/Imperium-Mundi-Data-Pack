// Melee weapons. Field meanings are on the Handheld type in ../build_items.ts.
// After editing: bun scripts/build_items.ts (from the SMP pack folder).
import type { Components, Handheld } from "../build_items.ts";

// Like Levent's Light Rod / Rastus's rapier: pair with minCharge: 1. Every hit needs a full charge,
// but bypasses the hurt cooldown (imperium:light is in #minecraft:bypasses_cooldown, Core).
const BYPASS_COOLDOWN: Components = { damage_type: "imperium:light" };
const TWO_HANDED = { "imperium:two_handed_curse": 1 };

export default {
    diamond_dagger: {
        name: "Diamond Dagger", base: "diamond_sword", model: "imperium:diamond_dagger",
        damage: 5, speed: 2, reach: -0.3,
        kb: { horizontal: 30, vertical: 0 },
        enchantments: { "imperium:offhand_attack": 1, "imperium:crits": 2 },
        recipe: { pattern: ["d", "s"], key: { s: "stick", d: "diamond" } },
    },
    diamond_glaive: {
        name: "Diamond Glaive", base: "diamond_sword", model: "imperium:diamond_glaive",
        damage: 8, speed: 1, reach: 1, sweep: 1,
        kb: { horizontal: 50, vertical: 0 },
        recipe: { pattern: ["d ", "dd", "s "], key: { s: "stick", d: "diamond" } },
    },
    diamond_rapier: {
        name: "Diamond Rapier", base: "diamond_sword", model: "imperium:diamond_rapier",
        damage: 4, speed: 3, knockback: -0.5,
        minCharge: 1,
        enchantable: 10,
        components: BYPASS_COOLDOWN,
        recipe: { pattern: ["  d", "dd ", "sd "], key: { s: "stick", d: "diamond" } },
    },
    diamond_greatsword: {
        name: "Diamond Greatsword", base: "diamond_sword", model: "imperium:diamond_greatsword",
        damage: 7, speed: 1.4,
        enchantable: 10,
        enchantments: TWO_HANDED,
        recipe: { pattern: [" d ", "ddd", "dsd"], key: { s: "stick", d: "diamond" } },
    },
    diamond_javelin: {
        name: "Diamond Javelin", base: "trident", model: "imperium:diamond_javelin",
        damage: 9, speed: 1.1,
        enchantable: 10,
        // Stackable items can't have durability, so removing it is what makes it unbreakable.
        components: { "!max_damage": {}, "!damage": {}, max_stack_size: 4 },
        recipe: { pattern: ["  d", " s ", "s  "], key: { s: "stick", d: "diamond" } },
    },
    diamond_cutlass: {
        name: "Diamond Cutlass", base: "diamond_sword", model: "imperium:diamond_cutlass",
        damage: 6, speed: 1.6,
        enchantable: 10,
        // Right-click to block player/mob melee and arrows in a narrow 30° arc (15° each side):
        // halves the damage, knockback still applies.
        components: {
            blocks_attacks: {
                damage_reductions: [
                    { type: "#is_player_attack", base: 0, factor: 0.5, horizontal_blocking_angle: 15 },
                    { type: ["mob_attack", "mob_attack_no_aggro", "arrow"], base: 0, factor: 0.5, horizontal_blocking_angle: 15 },
                ],
                block_sound: "minecraft:block.anvil.land",
                disabled_sound: "minecraft:item.shield.break",
            },
        },
        recipe: { pattern: [" d", " d", "ds"], key: { s: "stick", d: "diamond" } },
    },
    diamond_battleaxe: {
        name: "Diamond Battleaxe", base: "diamond_axe", model: "imperium:diamond_battleaxe",
        damage: 11, speed: 0.8, knockback: 0.5,
        enchantable: 10,
        enchantments: TWO_HANDED,
        recipe: { pattern: ["dsd", "dsd", " s "], key: { s: "stick", d: "diamond" } },
    },
    diamond_war_pick: {
        name: "Diamond War Pick", base: "diamond_pickaxe", model: "imperium:diamond_war_pick",
        damage: 8, speed: 1.2,
        enchantable: 10,
        enchantments: TWO_HANDED,
        recipe: { pattern: ["dsd", " s ", " s "], key: { s: "stick", d: "diamond" } },
    },
    diamond_scythe: {
        name: "Diamond Scythe", base: "diamond_hoe", model: "imperium:diamond_scythe",
        damage: 9, speed: 1,
        enchantable: 10,
        enchantments: TWO_HANDED,
        recipe: { pattern: ["ddd", "  s", "  s"], key: { s: "stick", d: "diamond" } },
    },
    diamond_monk_spade: {
        name: "Diamond Monk Spade", base: "diamond_shovel", model: "imperium:diamond_monk_spade",
        damage: 9, speed: 1,
        enchantable: 10,
        kb: { horizontal: 100, vertical: 150 },
        recipe: { pattern: [" d ", "dsd", " s "], key: { s: "stick", d: "diamond" } },
    },
    diamond_drill: {
        name: "Diamond Drill", base: "diamond_pickaxe",
        damage: 2, speed: 8, reach: -1,
        kb: { horizontal: 30, vertical: 0 },
        minCharge: 1,
        enchantable: 10,
        components: BYPASS_COOLDOWN,
        recipe: { pattern: [" d ", "drd", " s "], key: { s: "stick", d: "diamond", r: "redstone" } },
    },
} satisfies Record<string, Handheld>;
