// Armor sets. Each entry makes <key>_helmet, _chestplate, _leggings and _boots.
// Field meanings are on the ArmorSet type in ../build_items.ts. Example:
//
//     bronze: {
//         name: "Bronze", base: "iron",          // Bronze Helmet, built on iron_helmet, ...
//         armor: [2, 5, 4, 1], toughness: 0,      // helmet, chestplate, leggings, boots
//         enchantments: { protection: 1 },        // on every piece
//         material: "copper_ingot",               // vanilla armor recipe shapes
//         pieces: { helmet: { lore: ["Keeps the sun off"] } },
//     },
import type { ArmorSet } from "../build_items.ts";

export default {
    viking: {
        name: "Viking", base: "leather",
        armor: [2, 6, 5, 2], toughness: 8,
        enchantments: { "imperium:legacy/temper": 1 },
        material: "leather"
    },
    pyromancer: {
        name: "Pyromancer", base: "golden",
        armor: [2, 6, 5, 2], toughness: 4,
        enchantments: { fire_protection: 2, protection: 2 },
        material: "gold_ingot"
    },
    amazon: {
        name: "Amazon", base: "leather",
        armor: [2, 5, 4, 1], toughness: 0,
        enchantments: { swift_sneak: 3, protection: 2, feather_falling: 4 },
        material: "leather"
    },
    vamp_spider: {
        name: "Vamp-Spider", base: "leather",
        armor: [2, 5, 4, 1], toughness: 0,
        material: "leather"
    },
    golem: {
        name: "Golem", base: "iron",
        armor: [2, 5, 4, 1], toughness: 0,
        material: "iron_ingot"
    },
    ranger: {
        name: "Ranger", base: "leather",
        armor: [2, 5, 4, 1], toughness: 0,
        material: "leather"
    },
    conduit: {
        name: "Conduit", base: "leather",
        armor: [2, 5, 4, 1], toughness: 0,
        material: "leather"
    },
    dryad: {
        name: "Dryad", base: "leather",
        armor: [2, 5, 4, 1], toughness: 0,
        material: "leather"
    }
} satisfies Record<string, ArmorSet>;
