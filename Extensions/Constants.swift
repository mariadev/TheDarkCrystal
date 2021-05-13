//
//  Constants.swift
//  TheDarkCrystal
//
//  Created by Maria on 16/11/2020.
//

import Foundation

let STORY_DID_CHANGE_NOTIFICATION_NAME = "storyDidChangeNotificationName"
let STORY_KEY = "StoryHey"
let LAST_STORY_KEY = "Last Story key"

let RACE_DID_CHANGE_NOTIFICATION_NAME = "raceDidChangeNotificationName"
let RACE_KEY = "RaceHey"
let LAST_RACE_KEY = "Last Race key"

let TYPE_OF_STORY = (serie: "serie", film: "film", both: "both")
let NAMES_STORY = (film: "The Dark Crystal", serie: "The Dark Crystal: Age of Resistance")

let PLOT_MOVIE =  "On a fictional planet, the damaged Dark Crystal marks the onset of the age of chaos. If the crystal is not healed during the great conjunction of the three suns, the evil Skekses will rule forever."
let PLOT_SERIES = "When three Gelfling discover the horrifying secret behind the Skeksis' power, they set out on an epic journey to ignite the fires of rebellion and try to save their world."

let OF_RACE = (gelfings: "Gelfings", podlings: "Podlings", skeksis: "Skeksis", aughra: "Aughra", mystics: "Mystics" )

let DESCRIPTION_GELFLING = "Gelfling were a sentient species native to Skarith. They were the closest race to Thra, and were by far the planet's most widespread race. They were a peaceful people who lived in harmony with the natural world and had a rich culture which valued song, dance and storytelling. They mostly lived in tribal or clan-based societies which were dominated by females, who differed from their male counterparts by having wings. Gelfling had the ability to share memories with each other through Dreamfasting."
let DESCRIPTION_PODLINGS = "The Podlings, also known as Pod People, were a sentient race native to Skarith. In their own language, they referred to themselves as apopiapoiopidiappididiapipob, which translated as master gardeners who live in bulging plants. They were a rural and hedonistic race, who lived only to sing, dance and tend to their plants."
let DESCRIPTION_SKEKSIS = "The Skeksis, also known as Lords of the Crystal or Regents of Thra, were a reptilian, bird-like race that established an Empire which ruled over Thra throughout the Age of Division. They originated during Thra's second Great Conjunction, when the Fallen urSkeks attempted to purify themselves through the heat of the three suns shining on the Crystal. Instead of being cleansed of their darker natures, each urSkek was split into two beings; Skeksis and urRu, with the Skeksis being the embodiment of the violent, materialistic side of the urSkeks."
let DESCRIPTION_AUGHRA = " Aughra or Mother Aughra was the embodiment of Thra, acting as the world's eyes and voice. Created by the Crystal of Truth shortly after Thra's formation in the Age of Innocence to bring peace between plants and animals, Aughra guided the Gelfling in their early development, but later shifted her attention to the stars after being seduced by the otherworldly knowledge of the urSkeks during the Age of Harmony. During the Age of Division, she abandoned Thra in order to explore the Uni-Verse, returning later to guide the Gelfling resistance against the Skeksis."
let DESCRIPTION_MYSTICS = "The urRu, more commonly known as Mystics, were a race that inhabited the Valley of the Standing Stones. They originated during Thra's second Great Conjunction, when the Fallen urSkeks attempted to purify themselves through the heat of the three suns shining on the Crystal. Instead of being cleansed of their darker natures, each urSkek was split into two beings; Skeksis and urRu. The urRu were the embodiments of the peaceful, contemplative side of the urSkeks' nature."

let RIAN_DATA = (name: "Rian", race: OF_RACE.gelfings, image: "rian.jpg", description: "Rian was a Gelfling Castle Guard of the Stonewood Clan who later led the Gelfling resistance.", appearOn: TYPE_OF_STORY.serie, aphorism: "Everything the Skeksis ever told us was a lie. But it's hard to recognize the light when you've spent your whole life in the dark.")
let AUGHRA_DATA = (name: "Aughra", race: OF_RACE.aughra, image: "aughra.jpg", description: "Aughra or Mother Aughra was the embodiment of Thra, acting as the world's eyes and voice. Created by the Crystal of Truth shortly after Thra's formation in the Age of Innocence to bring peace between plants and animals, Aughra guided the Gelfling in their early development, but later shifted her attention to the stars after being seduced by the otherworldly knowledge of the urSkeks during the Age of Harmony. During the Age of Division, she abandoned Thra in order to explore the Uni-Verse, returning later to guide the Gelfling resistance against the Skeksis.", appearOn: TYPE_OF_STORY.both, aphorism: "I am Mother Aughra! I am Thra!")
let SKEKSO_DATA = (name: "skekSo", race: OF_RACE.skeksis, image: "skekSo.jpg", description: "SkekSo was the first and penultimate Skeksis Emperor, and counterpart to urSu the Master. Ruling the Skeksis Empire for over a thousand trine, he was the principal architect of the Alliance of the Crystal, the formal segregation of the Gelfling Clans and their ultimate destruction during the Garthim War.", appearOn: TYPE_OF_STORY.both, aphorism: "There is absolutely nothing in this world that does not bend to my will.")
let HOP_DATA = (name: "Hup", race: OF_RACE.podlings, image: "hup.jpg", description: "Hup was a male Podling who lived during the late Age of Division. Originally a cook in Sami Thicket, Hup dreamed of becoming a paladin after encountering the fraudulent minstrel Barfinnious, with whom he saved a Spriton village from a pack of darkened Fizzgigs.", appearOn: TYPE_OF_STORY.serie, aphorism: "Bury me with my spoon!")
let URGOH_DATA = (name: "urGoh", race: OF_RACE.mystics, image: "urgoh.jpg", description: "UrGoh the Wanderer was the Mystic counterpart to skekGra the Conqueror/Heretic. Together with skekGra, he was a co-creator of Lore and the Dual Glaive, and co-author of The True History of Thra.", appearOn: TYPE_OF_STORY.serie, aphorism: "Every moment one are two is too terrible for one to bear.")
let DEET_DATA = (name: "Deet", race: OF_RACE.gelfings, image: "deet.jpg", description: "Deet (born Deethra) was a Gelfling of the Grottan Clan who lived during the late Age of Division. Deet experienced a vision by touching Vliste-Staba, the Sanctuary Tree located in the Mountains of Grot, and joined the Gelfling resistance.", appearOn: TYPE_OF_STORY.serie, aphorism: "")
