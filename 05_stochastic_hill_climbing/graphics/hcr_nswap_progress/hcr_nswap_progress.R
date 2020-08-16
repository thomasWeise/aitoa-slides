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
                      name = paste0("hcr_nswap_progress_", instance,
                                    if(log) "_log" else ""),
                      type = type,
                      width = width,
                      height = height,
                      body = {
                        aitoa.plot.progress.stat.on.instance(
                          results.dir="results",
                          algorithms=list(hc_1swap="hc_1swap",
                                          hc_nswap="hc_nswap",
                                          hcr_16384_1swap="hc_rs_16384_1swap",
                                          hcr_65536_nswap="hc_rs_65536_nswap"),
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
