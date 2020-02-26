# Extract Loci (from VCF)
This is a very simple example WDL file used to learn how to create (very simple) workflows. There are a number of tutorials, but I'll try to distill the key aspects into 2 files: this README and the WDL script itself. 

To use the example below, the user will need a functional account at terra.bio and a workspace to which the user has write permission.

## Creating the workflow
From within one of the user's workspaces inside their Terra dashboard, the user must navigate to the "Workflows" tab. 

Clicking the "+" beneath "Find a Workflow" which brings up the "Suggested Workflows" dialog. 

The tutorials recommended choosing "Broad Methods Repository", but it may not matter if you are creating a workfrom from "scratch". The "Broad Methods" link will take you to a firecloud portal where you can search for existing workflows.

To create a workfrom, instead of searching, choose the "Create New Method" on the far right above the list of methods. 

Provide a meaningful "Namespace" and "Name". One can think of the Namespace as a sort of "Library" containing workflows, and the Name is a unique name within that library.

Either write the WDL file within the large middle section, copy/paste the contents from elsewhere or load them from a file. 

Documentation can be extracted from comments (lines preceeded by the "#" sign before any definitions) or simply typed directly into the web form. 

If there are no errors, the user will be redirected to the method's summary view. 

To export the method to their workspace, the user should click the large blue button on the right of the page, "Export to Workspace". 

Choose "Use Blank Configuration"

Root Entity Type is only relevant if you are interacting with datasets loaded into terra itself (as opposed to the user's google bucket). Just leave it as it is for now. Choose the appropriate workspace and click "Export to Workspace". 

It may be useful to choose "No, Stay here" if the user anticipates edits will be required. 

## Running the Workflow
Inside the Workflows tab of the workspace the user exported to, there should now be the new workflow. To use this workflow, the user will click on it. For loci_of_interest, they must click on the folder icon and choose an appropriate file (my example was named data/positions-subset.txt...prefixed by the google bucket ID) User's can optionally provide a VCF (the default is hardcoded into the WDL file)

Click save and then "Run Analysis"


