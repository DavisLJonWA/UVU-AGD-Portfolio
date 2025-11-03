import maya.cmds as cmds

# Clear selection first
cmds.select(clear=True)

# Room
room = cmds.polyCube(w=4, h=4, d=4, sx=1, sy=1, sz=1, ax=(0, 1, 0), cuv=4, ch=1)[0]
cmds.rename(room, "Room")
cmds.move(0, 2, 0, r=True, os=True, wd=True)

# Roof
roof = cmds.polyCube(w=4, h=3, d=3, sx=2, sy=2, sz=2, ax=(0, 1, 0), cuv=4, ch=1)[0]
cmds.rename(roof, "Roof")
cmds.move(0, 4, 0, r=True, os=True, wd=True)

# Roof edge manipulations
cmds.select(clear=True)
cmds.select('Roof.e[40]')
cmds.select('Roof.e[2:3]', 'Roof.e[10:11]', 'Roof.e[40:41]', 'Roof.e[44:45]', add=True)
cmds.move(0, 1.319911, 0, r=True)

cmds.select(clear=True)
cmds.select('Roof.e[42]')
cmds.select('Roof.e[6:7]', 'Roof.e[14:15]', 'Roof.e[42:43]', 'Roof.e[46:47]', add=True)
cmds.move(0, 0, 1.325536, r=True)

cmds.select('Roof')
cmds.rotate(-45, 0, 0, r=True, os=True, fo=True)

# First roof extrusion
cmds.select(clear=True)
cmds.select('Roof.f[17]', 'Roof.f[18]', 'Roof.f[19]', 'Roof.f[21]', 'Roof.f[22]', 'Roof.f[23]')
extrude1 = cmds.polyExtrudeFacet(
    ch=1, kft=1, pvx=0, pvy=4, pvz=0, 
    divisions=1, twist=0, taper=1, off=0, 
    thickness=0, smoothingAngle=30
)

# Get the actual extrude node name and set attribute
extrude_nodes = cmds.ls(type='polyExtrudeFace')
if extrude_nodes:
    cmds.setAttr(f"{extrude_nodes[-1]}.localTranslate", 0, 0, 0.160337, type="double3")

# Second roof extrusion  
cmds.select(clear=True)
cmds.select('Roof.f[8]', 'Roof.f[9]', 'Roof.f[14]', 'Roof.f[15]', 'Roof.f[24]', 'Roof.f[28]', 'Roof.f[32]', 'Roof.f[37]')
extrude2 = cmds.polyExtrudeFacet(
    ch=1, kft=1, pvx=0, pvy=3.999999831, pvz=-2.220446049e-16, 
    divisions=1, twist=0, taper=1, off=0, 
    thickness=0, smoothingAngle=30
)

# Get the latest extrude node and set attribute
extrude_nodes = cmds.ls(type='polyExtrudeFace')
if extrude_nodes:
    cmds.setAttr(f"{extrude_nodes[-1]}.localTranslate", 0, 0, 0.184188, type="double3")

# Door
door = cmds.polyCube(w=1, h=2, d=1, sx=3, sy=3, sz=3, ax=(0, 1, 0), cuv=4, ch=1)[0]
cmds.rename(door, "Door")
cmds.move(1.553304, 1, 0, r=True)

# Circle Window
window = cmds.polyDisc(sides=3, subdivisionMode=4, subdivisions=3, radius=0.5)[0]
cmds.rename(window, "CircleWindow")

# Window edge extrusion
window_edges = [
    'CircleWindow.e[5]', 'CircleWindow.e[7]', 'CircleWindow.e[12]', 
    'CircleWindow.e[15]', 'CircleWindow.e[16]', 'CircleWindow.e[18]', 
    'CircleWindow.e[22]', 'CircleWindow.e[25]', 'CircleWindow.e[43]', 
    'CircleWindow.e[45]', 'CircleWindow.e[50]', 'CircleWindow.e[53]', 
    'CircleWindow.e[54]', 'CircleWindow.e[56]', 'CircleWindow.e[60]', 
    'CircleWindow.e[63]', 'CircleWindow.e[79]', 'CircleWindow.e[81]', 
    'CircleWindow.e[86]', 'CircleWindow.e[89]', 'CircleWindow.e[90]', 
    'CircleWindow.e[92]', 'CircleWindow.e[96]', 'CircleWindow.e[99]'
]

cmds.select(clear=True)
cmds.select(window_edges)
extrude_edge = cmds.polyExtrudeEdge(
    ch=1, kft=1, pvx=3.01170675, pvy=0, pvz=0, 
    divisions=1, twist=0, taper=1, offset=0, 
    thickness=0, smoothingAngle=30
)

# Get the actual edge extrude node and set attribute
extrude_edge_nodes = cmds.ls(type='polyExtrudeEdge')
if extrude_edge_nodes:
    cmds.setAttr(f"{extrude_edge_nodes[-1]}.localTranslate", 0, 0, -0.1, type="double3")

cmds.select('CircleWindow')
cmds.move(2.05, 5, 0, r=True)
cmds.rotate(0, 0, -90, r=True, os=True, fo=True)

# Pillars
pillar1 = cmds.polyCube(w=0.1, h=4, d=0.1, sx=1, sy=1, sz=1, ax=(0, 1, 0), cuv=4, ch=1)[0]
cmds.rename(pillar1, "Pillar_1")
cmds.move(2, 2, 2, r=True)

pillar2 = cmds.polyCube(w=0.1, h=4, d=0.1, sx=1, sy=1, sz=1, ax=(0, 1, 0), cuv=4, ch=1)[0]
cmds.rename(pillar2, "Pillar_2")
cmds.move(-2, 2, 2, r=True)

pillar3 = cmds.polyCube(w=0.1, h=4, d=0.1, sx=1, sy=1, sz=1, ax=(0, 1, 0), cuv=4, ch=1)[0]
cmds.rename(pillar3, "Pillar_3")
cmds.move(2, 2, -2, r=True)

pillar4 = cmds.polyCube(w=0.1, h=4, d=0.1, sx=1, sy=1, sz=1, ax=(0, 1, 0), cuv=4, ch=1)[0]
cmds.rename(pillar4, "Pillar_4")
cmds.move(-2, 2, -2, r=True)

# Clear selection at the end
cmds.select(clear=True)
print("House created successfully!")