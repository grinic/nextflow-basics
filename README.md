# nextflow-basics
 My example script for a quick start in Nextflow with Python scripting.

 Largely based on the material from the 2025 CRG course:

- https://biocorecrg.github.io/nextflow-course-2025-spring/about.html
- https://github.com/biocorecrg/nextflow-course-2025-spring


## Add in gitignore:
*nextflow.log*
.nextflow/
work/

## To run with params file:
`nextflow run ex0.nf -params-file params.yaml`

## To run in WSL

First, update to WSL2, then install java (openJDK) and nextflow.

Add nextflow to $PATH, or move/copy in a location that appears in $PATH.
E.g. `cp /mnt/c/Users/nicola/nextflow /usr/local/bin`

Map network drive first. Follow [here](https://www.google.com/search?q=wsl2+find+network+drive&sca_esv=613adaf9b5e05094&rlz=1C1CHBF_enUS847US847&ei=RXUUaOXUB-KYkdUPgfucwQg&ved=0ahUKEwili5jTooSNAxViTKQEHYE9J4gQ4dUDCBA&uact=5&oq=wsl2+find+network+drive&gs_lp=Egxnd3Mtd2l6LXNlcnAiF3dzbDIgZmluZCBuZXR3b3JrIGRyaXZlMgUQIRigATIFECEYoAEyBRAhGJ8FSNEbUI8HWMIZcAJ4AZABAJgBogGgAZkKqgEDOC41uAEDyAEA-AEBmAIPoAKhC8ICChAAGLADGNYEGEfCAgYQABgWGB7CAgsQABiABBiGAxiKBcICCBAAGIAEGKIEwgIFEAAY7wXCAgcQIRigARgKmAMAiAYBkAYIkgcDOC43oAfLS7IHAzYuN7gHmAs&sclient=gws-wiz-serp).

