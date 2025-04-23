/*
* Let's create the channel `my_files`
* using the method fromPath
*/
params.inputdir = "${projectDir}/../../test_data/txts"	

Channel
    .fromPath( "${params.inputdir}/*.txt" )
    .set {my_files}

// We can use the view() operator again to see the content of channel "my_files"

my_files.view()
