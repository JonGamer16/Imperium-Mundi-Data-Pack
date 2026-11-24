// Tools and everything else. Same fields as weapons (Handheld in ../build_items.ts); anything else
// goes in `components` as raw 26.3 JSON, e.g. a mining tool:
//
//     bronze_pickaxe: {
//         name: "Bronze Pickaxe", base: "iron_pickaxe",
//         damage: 3, speed: -2.8,
//         components: { tool: { rules: [ ... ], damage_per_block: 1 }, max_damage: 200 },
//         recipe: { pattern: ["bbb", " s ", " s "], key: { b: "copper_ingot", s: "stick" } },
//     },
import type { Handheld } from "../build_items.ts";

// ---- Shields ----
// Setting blocks_attacks replaces the shield's whole component, so vanilla's parts are restated here
// (sounds, durability loss, axes/etc. bypassing). Override only what a shield changes.
// horizontal_blocking_angle is measured from where you face to EACH side: 90 = vanilla's 180° arc,
// 45 = a 90° arc. block_delay_seconds is the raise delay (vanilla 0.25).
const SHIELD = {
    block_delay_seconds: 0.25,
    damage_reductions: [{ base: 0, factor: 1 }],
    item_damage: { threshold: 3, base: 1, factor: 1 },
    bypassed_by: "#minecraft:bypasses_shield",
    block_sound: "minecraft:item.shield.block",
    disabled_sound: "minecraft:item.shield.break",
};
// A fully blocked hit gives no knockback. Letting 0.1% of the damage through makes the block
// "partial", which (like the Saber's 50% block) lets knockback land. Untested at this tiny amount.
const KEEP_KNOCKBACK = 0.999;

export default {
    // Fencer's buckler without the kit parry: sprint while blocking, half damage from players, mobs
    // and projectiles in a narrow 60° arc, instant raise. Keeps vanilla durability.
    buckler_shield: {
        name: "Buckler Shield", base: "shield", model: "imperium:buckler_shield",
        lore: ["Sprint while blocking"],
        components: {
            use_effects: { can_sprint: true, speed_multiplier: 0.5 },
            blocks_attacks: {
                ...SHIELD,
                block_delay_seconds: 0,
                damage_reductions: [
                    { type: "#is_player_attack", base: 0, factor: 0.5, horizontal_blocking_angle: 30 },
                    { type: "mob_attack", base: 0, factor: 0.5, horizontal_blocking_angle: 30 },
                    { type: "#is_projectile", base: 0, factor: 0.5, horizontal_blocking_angle: 30 },
                ],
            },
        },
        recipe: { pattern: [" n ","nin"," n "], key: { i: "iron_ingot", n: "iron_nugget" } },
    },
    // Knocks melee attackers back on a block (Deflection, Core) in exchange for a 90° arc.
    kite_shield: {
        name: "Kite Shield", base: "shield",
        enchantments: { "imperium:deflection": 1 },
        components: {
            blocks_attacks: { ...SHIELD, damage_reductions: [{ base: 0, factor: 1, horizontal_blocking_angle: 45 }] },
        },
        recipe: { pattern: ["iii", " i ", " i "], key: { i: "iron_ingot" } },
    },
    heater_shield: {
        name: "Heater Shield", base: "shield",
        lore: ["Raises faster", "Doesn't stop knockback"],
        components: {
            blocks_attacks: {
                ...SHIELD,
                block_delay_seconds: 0.1,
                damage_reductions: [{ base: 0, factor: KEEP_KNOCKBACK, horizontal_blocking_angle: 45 }],
            },
        },
        recipe: { pattern: ["wiw", " w "], key: { w: "#planks", i: "iron_ingot" } },
    },
    // A blocking weapon. In either hand: +4 toughness, +0.5 attack damage. In the main hand it also
    // hits like a sword: 1 base + 4.5 + 0.5 = 6 damage at 1.6 attacks/s.
    lantern_shield: {
        name: "Lantern Shield", base: "shield", model: "imperium:lantern_shield",
        lore: ["Doesn't stop knockback"],
        damage: 5.5, speed: 1.6,
        attributes: [
            { type: "armor_toughness", amount: 4, operation: "add_value", slot: "hand", id: "imperium:lantern_shield_toughness" },
            { type: "attack_damage", amount: 0.5, operation: "add_value", slot: "hand", id: "imperium:lantern_shield_damage" },
        ],
        components: {
            blocks_attacks: { ...SHIELD, damage_reductions: [{ base: 0, factor: KEEP_KNOCKBACK, horizontal_blocking_angle: 45 }] },
        },
        recipe: { pattern: ["shi"], key: { h: "shield", i: "iron_ingot", s: "iron_sword" } },
    },
} satisfies Record<string, Handheld>;
