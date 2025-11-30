import maya.cmds as cmds

def create_control_groups():
    """
    Creates parent groups for selected controls with matching transformations
    and renames them with '_Grp' suffix
    """
    
    # Get current selection
    selection = cmds.ls(selection=True)
    
    # Check if anything is selected
    if not selection:
        cmds.warning("Please select one or more objects to create control groups.")
        return
    
    # List to store newly created groups
    created_groups = []
    
    # Process each selected object
    for obj in selection:
        try:
            # Get object's transformation values
            translation = cmds.xform(obj, query=True, worldSpace=True, translation=True)
            rotation = cmds.xform(obj, query=True, worldSpace=True, rotation=True)
            
            # Create a new group
            group_name = "{}_Grp".format(obj)
            group = cmds.group(empty=True, name=group_name)
            
            # Set group's transformation to match the object
            cmds.xform(group, worldSpace=True, translation=translation)
            cmds.xform(group, worldSpace=True, rotation=rotation)
            
            # Parent the object under the group
            cmds.parent(obj, group)
            
            created_groups.append(group)
            
            print("Created group '{}' for control '{}'".format(group_name, obj))
            
        except Exception as e:
            cmds.warning("Failed to process object '{}': {}".format(obj, str(e)))
    
    # Select the newly created groups
    if created_groups:
        cmds.select(created_groups)
        print("Successfully created {} group(s)".format(len(created_groups)))
    else:
        cmds.warning("No groups were created.")

# Run the function
create_control_groups()