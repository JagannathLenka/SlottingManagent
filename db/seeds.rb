# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=begin
Bay.delete_all
Aisle.delete_all


Aisle.create(aisle_id: "aisle1",customer_aisle_id: "",zone_id: "zone1",properties1: "drivepath",properties2: "",properties3: "")
Bay.create(bay_id: "bay1",customer_bay_id: "",aisle_id: "aisle1",properties1: "bay",properties2: "item7",properties3: "")
Bay.create(bay_id: "bay2",customer_bay_id: "",aisle_id: "aisle1",properties1: "bay_Empty",properties2: "",properties3: "")
Bay.create(bay_id: "bay3",customer_bay_id: "",aisle_id: "aisle1",properties1: "bay_Empty",properties2: "",properties3: "")
Bay.create(bay_id: "bay4",customer_bay_id: "",aisle_id: "aisle1",properties1: "bay",properties2: "item3",properties3: "")

Aisle.create(aisle_id: "aisle2",customer_aisle_id: "",zone_id: "zone1",properties1: "divider",properties2: "",properties3: "")
Bay.create(bay_id: "bay5",customer_bay_id: "",aisle_id: "aisle2",properties1: "bay",properties2: "item8",properties3: "")
Bay.create(bay_id: "bay6",customer_bay_id: "",aisle_id: "aisle2",properties1: "bay_Empty",properties2: "",properties3: "")
Bay.create(bay_id: "bay7",customer_bay_id: "",aisle_id: "aisle2",properties1: "bay",properties2: "item7",properties3: "")
Bay.create(bay_id: "bay8",customer_bay_id: "",aisle_id: "aisle2",properties1: "bay",properties2: "item3",properties3: "")

Aisle.create(aisle_id: "aisle3",customer_aisle_id: "",zone_id: "zone1",properties1: "drivepath",properties2: "",properties3: "")
Bay.create(bay_id: "bay9",customer_bay_id: "",aisle_id: "aisle3",properties1: "bay",properties2: "item8",properties3: "")
Bay.create(bay_id: "bay10",customer_bay_id: "",aisle_id: "aisle3",properties1: "bay_Empty",properties2: "",properties3: "")
Bay.create(bay_id: "bay11",customer_bay_id: "",aisle_id: "aisle3",properties1: "bay",properties2: "item2",properties3: "")
Bay.create(bay_id: "bay12",customer_bay_id: "",aisle_id: "aisle3",properties1: "bay",properties2: "item3",properties3: "")

Aisle.create(aisle_id: "aisle4",customer_aisle_id: "",zone_id: "zone1",properties1: "divider",properties2: "",properties3: "")
Bay.create(bay_id: "bay13",customer_bay_id: "",aisle_id: "aisle4",properties1: "bay",properties2: "item8",properties3: "")
Bay.create(bay_id: "bay14",customer_bay_id: "",aisle_id: "aisle4",properties1: "bay_Empty",properties2: "",properties3: "")
Bay.create(bay_id: "bay15",customer_bay_id: "",aisle_id: "aisle4",properties1: "bay_Empty",properties2: "",properties3: "")
Bay.create(bay_id: "bay16",customer_bay_id: "",aisle_id: "aisle4",properties1: "bay",properties2: "item3",properties3: "")

Aisle.create(aisle_id: "aisle5",customer_aisle_id: "",zone_id: "zone1",properties1: "drivepath",properties2: "",properties3: "")
Bay.create(bay_id: "bay17",customer_bay_id: "",aisle_id: "aisle5",properties1: "bay",properties2: "item2",properties3: "")
Bay.create(bay_id: "bay18",customer_bay_id: "",aisle_id: "aisle5",properties1: "bay_Empty",properties2: "",properties3: "")
Bay.create(bay_id: "bay19",customer_bay_id: "",aisle_id: "aisle5",properties1: "bay_Empty",properties2: "",properties3: "")
Bay.create(bay_id: "bay20",customer_bay_id: "",aisle_id: "aisle5",properties1: "bay",properties2: "item3",properties3: "")

Aisle.create(aisle_id: "aisle6",customer_aisle_id: "",zone_id: "zone1",properties1: "divider",properties2: "",properties3: "")
Bay.create(bay_id: "bay21",customer_bay_id: "",aisle_id: "aisle6",properties1: "bay",properties2: "item8",properties3: "")
Bay.create(bay_id: "bay22",customer_bay_id: "",aisle_id: "aisle6",properties1: "bay_Empty",properties2: "",properties3: "")
Bay.create(bay_id: "bay23",customer_bay_id: "",aisle_id: "aisle6",properties1: "bay",properties2: "item9",properties3: "")
Bay.create(bay_id: "bay24",customer_bay_id: "",aisle_id: "aisle6",properties1: "bay",properties2: "item3",properties3: "")

Aisle.create(aisle_id: "aisle7",customer_aisle_id: "",zone_id: "zone1",properties1: "drivepath",properties2: "",properties3: "")
Bay.create(bay_id: "bay25",customer_bay_id: "",aisle_id: "aisle7",properties1: "bay",properties2: "item2",properties3: "")
Bay.create(bay_id: "bay26",customer_bay_id: "",aisle_id: "aisle7",properties1: "bay_Empty",properties2: "",properties3: "")
Bay.create(bay_id: "bay27",customer_bay_id: "",aisle_id: "aisle7",properties1: "bay_Empty",properties2: "",properties3: "")
Bay.create(bay_id: "bay28",customer_bay_id: "",aisle_id: "aisle7",properties1: "bay",properties2: "item3",properties3: "")

Aisle.create(aisle_id: "aisle8",customer_aisle_id: "",zone_id: "zone1",properties1: "divider",properties2: "",properties3: "")
Bay.create(bay_id: "bay29",customer_bay_id: "",aisle_id: "aisle8",properties1: "bay",properties2: "item8",properties3: "")
Bay.create(bay_id: "bay30",customer_bay_id: "",aisle_id: "aisle8",properties1: "bay_Empty",properties2: "",properties3: "")
Bay.create(bay_id: "bay31",customer_bay_id: "",aisle_id: "aisle8",properties1: "bay",properties2: "item2",properties3: "")
Bay.create(bay_id: "bay32",customer_bay_id: "",aisle_id: "aisle8",properties1: "bay",properties2: "item3",properties3: "")

=end
Position.delete_all

Position.create(pos_id: "pos1",bay_id: "bay1",level_id: "level1",properties1:"pos",properties2:"Item5",properties3: "")
Position.create(pos_id: "pos2",bay_id: "bay1",level_id: "level1",properties1:"pos",properties2:"item2",properties3: "")
Position.create(pos_id: "pos3",bay_id: "bay1",level_id: "level1",properties1:"pos_Empty",properties2:"",properties3: "")
Position.create(pos_id: "pos4",bay_id: "bay1",level_id: "level1",properties1:"pos",properties2:"item9",properties3: "")
Position.create(pos_id: "pos5",bay_id: "bay1",level_id: "level1",properties1:"pos",properties2:"item4",properties3: "")
Position.create(pos_id: "pos6",bay_id: "bay1",level_id: "level1",properties1:"pos_Empty",properties2:"",properties3: "")
Position.create(pos_id: "pos7",bay_id: "bay1",level_id: "level1",properties1:"pos",properties2:"item3",properties3: "")
Position.create(pos_id: "pos8",bay_id: "bay1",level_id: "level1",properties1:"pos",properties2:"item1",properties3: "")



Position.create(pos_id: "pos9",bay_id: "bay1",level_id: "level2",properties1:"pos",properties2:"item2",properties3: "")
Position.create(pos_id: "pos10",bay_id: "bay1",level_id: "level2",properties1:"pos",properties2:"item3",properties3: "")
Position.create(pos_id: "pos11",bay_id: "bay1",level_id: "level2",properties1:"pos_Empty",properties2:"",properties3: "")
Position.create(pos_id: "pos12",bay_id: "bay1",level_id: "level2",properties1:"pos",properties2:"item7",properties3: "")
Position.create(pos_id: "pos13",bay_id: "bay1",level_id: "level2",properties1:"pos",properties2:"item6",properties3: "")
Position.create(pos_id: "pos14",bay_id: "bay1",level_id: "level2",properties1:"pos_Empty",properties2:"",properties3: "")
Position.create(pos_id: "pos15",bay_id: "bay1",level_id: "level2",properties1:"pos",properties2:"Item4",properties3: "")
Position.create(pos_id: "pos16",bay_id: "bay1",level_id: "level2",properties1:"pos_Empty",properties2:"",properties3: "")

Position.create(pos_id: "pos17",bay_id: "bay1",level_id: "level3",properties1:"pos",properties2:"Item5",properties3: "")
Position.create(pos_id: "pos18",bay_id: "bay1",level_id: "level3",properties1:"pos",properties2:"item2",properties3: "")
Position.create(pos_id: "pos19",bay_id: "bay1",level_id: "level3",properties1:"pos_Empty",properties2:"",properties3: "")
Position.create(pos_id: "pos20",bay_id: "bay1",level_id: "level3",properties1:"pos",properties2:"item9",properties3: "")
Position.create(pos_id: "pos21",bay_id: "bay1",level_id: "level3",properties1:"pos",properties2:"item4",properties3: "")
Position.create(pos_id: "pos22",bay_id: "bay1",level_id: "level3",properties1:"pos_Empty",properties2:"",properties3: "")
Position.create(pos_id: "pos23",bay_id: "bay1",level_id: "level3",properties1:"pos",properties2:"item3",properties3: "")
Position.create(pos_id: "pos24",bay_id: "bay1",level_id: "level3",properties1:"pos",properties2:"item1",properties3: "")

Position.create(pos_id: "pos25",bay_id: "bay1",level_id: "level4",properties1:"pos",properties2:"item2",properties3: "")
Position.create(pos_id: "pos26",bay_id: "bay1",level_id: "level4",properties1:"pos",properties2:"item3",properties3: "")
Position.create(pos_id: "pos27",bay_id: "bay1",level_id: "level4",properties1:"pos_Empty",properties2:"",properties3: "")
Position.create(pos_id: "pos28",bay_id: "bay1",level_id: "level4",properties1:"pos",properties2:"item7",properties3: "")
Position.create(pos_id: "pos29",bay_id: "bay1",level_id: "level4",properties1:"pos",properties2:"item6",properties3: "")
Position.create(pos_id: "pos30",bay_id: "bay1",level_id: "level4",properties1:"pos_Empty",properties2:"",properties3: "")
Position.create(pos_id: "pos31",bay_id: "bay1",level_id: "level4",properties1:"pos",properties2:"Item4",properties3: "")
Position.create(pos_id: "pos32",bay_id: "bay1",level_id: "level4",properties1:"pos_Empty",properties2:"",properties3: "")

Position.create(pos_id: "pos33",bay_id: "bay1",level_id: "level5",properties1:"pos",properties2:"Item5",properties3: "")
Position.create(pos_id: "pos34",bay_id: "bay1",level_id: "level5",properties1:"pos",properties2:"item2",properties3: "")
Position.create(pos_id: "pos35",bay_id: "bay1",level_id: "level5",properties1:"pos_Empty",properties2:"",properties3: "")
Position.create(pos_id: "pos36",bay_id: "bay1",level_id: "level5",properties1:"pos",properties2:"item9",properties3: "")
Position.create(pos_id: "pos37",bay_id: "bay1",level_id: "level5",properties1:"pos",properties2:"item4",properties3: "")
Position.create(pos_id: "pos38",bay_id: "bay1",level_id: "level5",properties1:"pos_Empty",properties2:"",properties3: "")
Position.create(pos_id: "pos39",bay_id: "bay1",level_id: "level5",properties1:"pos",properties2:"item3",properties3: "")
Position.create(pos_id: "pos40",bay_id: "bay1",level_id: "level5",properties1:"pos",properties2:"item1",properties3: "")


Position.create(pos_id:  "pos41" ,bay_id:  "bay1" ,level_id:  "level6" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos42" ,bay_id:  "bay1" ,level_id:  "level6" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos43" ,bay_id:  "bay1" ,level_id:  "level6" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos44" ,bay_id:  "bay1" ,level_id:  "level6" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos45" ,bay_id:  "bay1" ,level_id:  "level6" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos46" ,bay_id:  "bay1" ,level_id:  "level6" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos47" ,bay_id:  "bay1" ,level_id:  "level6" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos48" ,bay_id:  "bay1" ,level_id:  "level6" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )

Position.create(pos_id:  "pos49" ,bay_id:  "bay1" ,level_id:  "level7" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos50" ,bay_id:  "bay1" ,level_id:  "level7" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos51" ,bay_id:  "bay1" ,level_id:  "level7" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos52" ,bay_id:  "bay1" ,level_id:  "level7" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos53" ,bay_id:  "bay1" ,level_id:  "level7" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos54" ,bay_id:  "bay1" ,level_id:  "level7" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos55" ,bay_id:  "bay1" ,level_id:  "level7" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos56" ,bay_id:  "bay1" ,level_id:  "level7" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )


Position.create(pos_id:  "pos57" ,bay_id:  "bay4" ,level_id:  "level1" ,properties1:  "pos_Empty" ,properties2:  "" ,properties3:  "" )
Position.create(pos_id:  "pos58" ,bay_id:  "bay4" ,level_id:  "level1" ,properties1:  "pos_Empty" ,properties2:  "" ,properties3:  "" )
Position.create(pos_id:  "pos59" ,bay_id:  "bay4" ,level_id:  "level1" ,properties1:  "pos_Empty" ,properties2: "" ,properties3:  "" )
Position.create(pos_id:  "pos60" ,bay_id:  "bay4" ,level_id:  "level1" ,properties1:  "pos_Empty" ,properties2:  "" ,properties3:  "" )
Position.create(pos_id:  "pos61" ,bay_id:  "bay4" ,level_id:  "level1" ,properties1:  "pos_Empty" ,properties2:  "" ,properties3:  "" )
Position.create(pos_id:  "pos62" ,bay_id:  "bay4" ,level_id:  "level1" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos63" ,bay_id:  "bay4" ,level_id:  "level1" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos64" ,bay_id:  "bay4" ,level_id:  "level1" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )

Position.create(pos_id:  "pos65" ,bay_id:  "bay4" ,level_id:  "level2" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos66" ,bay_id:  "bay4" ,level_id:  "level2" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos67" ,bay_id:  "bay4" ,level_id:  "level2" ,properties1:  "pos_Empty" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos68" ,bay_id:  "bay4" ,level_id:  "level2" ,properties1:  "pos_Empty" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos69" ,bay_id:  "bay4" ,level_id:  "level2" ,properties1:  "pos_Empty" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos70" ,bay_id:  "bay4" ,level_id:  "level2" ,properties1:  "pos_Empty" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos71" ,bay_id:  "bay4" ,level_id:  "level2" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos72" ,bay_id:  "bay4" ,level_id:  "level2" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )

Position.create(pos_id:  "pos73" ,bay_id:  "bay4" ,level_id:  "level3" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos74" ,bay_id:  "bay4" ,level_id:  "level3" ,properties1:  "pos_Empty" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos75" ,bay_id:  "bay4" ,level_id:  "level3" ,properties1:  "pos_Empty" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos76" ,bay_id:  "bay4" ,level_id:  "level3" ,properties1:  "pos_Empty" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos77" ,bay_id:  "bay4" ,level_id:  "level3" ,properties1:  "pos_Empty" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos78" ,bay_id:  "bay4" ,level_id:  "level3" ,properties1:  "pos_Empty" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos79" ,bay_id:  "bay4" ,level_id:  "level3" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos80" ,bay_id:  "bay4" ,level_id:  "level3" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )

Position.create(pos_id:  "pos57" ,bay_id:  "bay4" ,level_id:  "level4" ,properties1:  "pos_Empty" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos58" ,bay_id:  "bay4" ,level_id:  "level4" ,properties1:  "pos_Empty" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos59" ,bay_id:  "bay4" ,level_id:  "level4" ,properties1:  "pos_Empty" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos60" ,bay_id:  "bay4" ,level_id:  "level4" ,properties1:  "pos_Empty" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos61" ,bay_id:  "bay4" ,level_id:  "level4" ,properties1:  "pos_Empty" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos62" ,bay_id:  "bay4" ,level_id:  "level4" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos63" ,bay_id:  "bay4" ,level_id:  "level4" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )
Position.create(pos_id:  "pos64" ,bay_id:  "bay4" ,level_id:  "level4" ,properties1:  "pos" ,properties2:  "item2" ,properties3:  "" )






