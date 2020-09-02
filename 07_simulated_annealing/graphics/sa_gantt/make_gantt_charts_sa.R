library(aitoaEvaluate);

files <- c("sa_exp_20_0d0000002_1swap_abz7_0xc5cbcf2ad309798b.txt",
           "sa_exp_20_0d0000002_1swap_la24_0x4853b61319c6979b.txt",
           "sa_exp_20_0d0000002_1swap_swv15_0xa2e387c08c82dad4.txt",
           "sa_exp_20_0d0000002_1swap_yn4_0x4e5e0d065979762d.txt");

makespan.eac  <- c(690L, 961L, 3224L, 1037L);
makespan.sa   <- c(673L, 946L, 2994L,  985L);

width <- 6;
height <- 3;
mar <- c(1.6, 1.6, 0.51, 0.15);

for(i in seq_along(files)) {
  file <- files[[i]];
  components <- unname(unlist(strsplit(file, "_", fixed=TRUE)));
  name <- paste(c("gantt_sa_20_2em7_", components[[6L]]), sep="_", collapse="_");

  data <- aitoa.load.result.from.log.file(file);

  gantt <- aitoa.jssp.parse.result(data$best.y);

  for(type in c("svg", "pdf")) {
    aitoa.graphic(name=paste0(name, "_", makespan.eac[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
          center.label = paste0(components[[6L]], " / ", as.integer(data$best.f)), mar=mar,
          xlim=c(0L, makespan.eac[[i]]));
    });
    aitoa.graphic(name=paste0(name, "_", makespan.sa[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
                                      center.label = paste0(components[[6L]], " / ", as.integer(data$best.f)), mar=mar,
                                      xlim=c(0L, makespan.sa[[i]]));
    });
  }
}
