# Extract a subset of loci from a VCF file using bcftools

# Workflow represents the wrapper for the given task. For this simple task, we have
# a single task we'll perform, extract() 

workflow aggregate_vcfs {
	  # We'll have two arguments, loci_of_interest and the VCF, which we'll provide a 
	  # default value. Eventually, this would be an array of VCFs
	  # be extracted
		File loci_of_interest
		
		File vcf_file = "gs://fc-f863c5a2-db68-4521-9f30-03debe9e49ab/data/emerge_rc_200.vcf.gz"

		# We'll call our task with the input from the user assigned to function's argument, loci_of_interest
    call extract{input: loci_of_interest=loci_of_interest, vcf_file=vcf_file}
}


# The singular task of extracting data
task extract {
	  # We don't have the entire dataset right now, so we'll assume a single VCF file for 
	  # simplicities sake
		File vcf_file

		# This will be the file containing the loci to be extracted from the vcf(s)
		File loci_of_interest
	
		# We'll need to grab the index file, so we use text substitution to determine the name
    File vcf_index = sub(vcf_file, ".vcf.gz", ".vcf.gz.tbi")
        # = "gs://fc-f863c5a2-db68-4521-9f30-03debe9e49ab/data/emerge_rc_200.vcf.gz"

	  # Since we have only one vcf, we use that to create our output file. 
		String file_prefix = sub(basename(vcf_file), ".vcf.gz", "-loi")

    
    # command is bash
    command{	
    	cd /cromwell_root
      echo "-> bcftools view -R ${loci_of_interest} ${vcf_file} -o ${file_prefix}.vcf"
    	bcftools view -R ${loci_of_interest} ${vcf_file} -o ${file_prefix}.vcf
			linecount = `wc -l ${file_prefix}.vcf`
      echo "Job completed. Length of ${file_prefix}? $linecount" 
    }



		# define the output files. These files MUST exist for the job to succeed. 
		# They will be copied up to the run directory
    output {
        File out="${file_prefix}.vcf"
    }

		# The runtime describes job details which include those parameters required by
		# the cloud to create and run the job. 

		# I've no clue how much temp space is used by bcftools. I do hope that it won't attempt top copy 
		# the dataset VCF files locally when running...I'm starting with 100 for local disk and a minimal 
		# amount of ram and a single CPU. 
		# 
		# preemptible=1 probably makes it cheaper?
    runtime {
        docker: "tmajarian/bcftools_htslib:v0.1"
        cpu: "1"
        memory: "512MB"
        disks: "local-disk 100 HDD"
        preemptible: "1"
    }

    meta {
        author: "Eric Torstenson"
    }
}
