library(aitoaEvaluate);

width <- 6;
height <- 3;
mar <- c(1.6, 1.6, 0.51, 0.15);

for(instance in c("abz7", "la24", "swv15", "yn4")) {
  for(shaded in c(TRUE, FALSE)) {
    for(log in c(FALSE, TRUE)) {
      for(type in c("svg", "pdf")) {

        f <- if(shaded) aitoa.plot.progress.stat.on.instance else aitoa.plot.progress.on.instance

        aitoa.graphic(".",
                      name = paste0("rs_progress_", instance,
                                    if(log) "_log" else "",
                                    if(shaded) "_shaded" else ""),
                      type = type,
                      width = width,
                      height = height,
                      body = {
                        f(
                          results.dir="results",
                          algorithms="rs",
                          instance=instance,
                          time.column = "t",
                          max.time = 180000L,
                          log = if(log) "x" else "",
                          make.time.unique = TRUE
                        )
                      });
      }
    }
  }
}
