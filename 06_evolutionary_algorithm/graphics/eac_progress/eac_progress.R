library(aitoaEvaluate);

width <- 6;
height <- 3;
mar <- c(1.6, 1.6, 0.51, 0.15);
mar.abz <- mar;
mar.abz[[3L]] <- mar.abz[[3L]]+0.4;

for(instance in c("abz7", "la24", "swv15", "yn4")) {
    for(log in c(FALSE, TRUE)) {
      for(type in c("svg", "pdf")) {

        aitoa.graphic(".",
                      name = paste0("eac_progress_", instance,
                                    if(log) "_log" else ""),
                      type = type,
                      width = width,
                      height = height,
                      body = {
                        aitoa.plot.progress.stat.on.instance(
                          results.dir="results",
                          algorithms=list(hcr_65536_nswap="hc_rs_65536_nswap",
                                          ea_16384_nswap="ea_16384+16384@0d0_nswap_sequence",
                                          `ea_8192_5%_nswap`="ea_8192+8192@0d05_nswap_sequence",
                                          `eac_4_5%_nswap`="eac_4+4@0d05_nswap_sequence"),
                          instance=instance,
                          time.column = "t",
                          max.time = 180000L,
                          log = if(log) "x" else "",
                          make.time.unique = TRUE,
                          mar=if(instance=="abz7") mar.abz else mar
                        )
                      });
      }
  }
}
