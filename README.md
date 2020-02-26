# Extract Loci (from VCF)
This is a very simple example WDL file used to learn how to create (very simple) workflows. There are a number of tutorials, but I'll try to distill the key aspects into 2 files: this README and the WDL script itself. 

To use the example below, you will need a functional account at terra.bio and a workspace to which you have write permission.

## Creating the workflow
From within one of your workspaces inside the Terra dashboard, you must navigate to the "Workflows" tab. 

Clicking the "+" beneath "Find a Workflow" which brings up the "Suggested Workflows" dialog. 

The tutorials recommended choosing "Broad Methods Repository", but it may not matter if you are creating a workfrom from "scratch". The "Broad Methods" link will take you to a firecloud portal where you can search for existing workflows.

To create a workfrom, instead of searching, choose the "Create New Method" on the far right above the list of methods. 

Provide a meaningful "Namespace" and "Name". You can think of the Namespace as a sort of "Library" containing workflows, and the Name is a unique name within that library. Please note that the "Name" is what you will see within your Workflows listing. So, keep that in mind and use a reasonably descriptive one. I used "extract-loci-from-vcf"

Either write the WDL file within the large middle section, copy/paste the contents from elsewhere or load them from a file. For this example, simply copy the contents of the extract-loci.wdl file or upload it from your computer's local disk.

Documentation can be extracted from comments (lines preceeded by the "#" sign before any definitions) or simply typed directly into the web form. 

If there are no errors, you will be redirected to the method's summary view. 

To export the method to their workspace, you should click the large blue button on the right of the page, "Export to Workspace". 

Choose "Use Blank Configuration"

"Root Entity Type" is only relevant if you are interacting with datasets loaded into terra itself (as opposed to files from your group's google bucket). Just leave it as it is for now. Choose the appropriate workspace and click "Export to Workspace". 

From my experience, unless you test your workflows using a local copy of cromwell (i.e. on a local server or your desktop), you almost certainly have something wrong with your script. So, maybe choosing "No, Stay here" is the best choice for normal situations.

## Running the Workflow
Inside the Workflows tab of the workspace you exported the newly minted workflow, it should be listed inside the workflows tab. To use this workflow, you simply click on it. For loci_of_interest, you must click on the folder icon and choose an appropriate file (my example was named 'data/positions-subset.txt', prefixed by the google bucket ID) You can optionally provide a VCF (the default is hardcoded into the WDL file)

Click save and then "Run Analysis"


