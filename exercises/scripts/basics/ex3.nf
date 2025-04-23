/*
* Let's create the channel `my_files`
* using the method fromFilePairs
*/
params.inputdir = "${projectDir}/../../test_data/tifs"	

Channel
    .fromFilePairs( "${params.inputdir}/*{_Hoechst,_FM4-64}.tif" )
    .set {my_files}

my_files.view()
