library(aitoaEvaluate);

files <- c("hc_rs_16384_1swap_abz7_0xa2860de5af8b61d5.txt",
           "hc_rs_16384_1swap_la24_0x07f47389e9e3c9d7.txt",
           "hc_rs_16384_1swap_swv15_0xbb8bf95b4fe182f1.txt",
           "hc_rs_16384_1swap_yn4_0xfdd7e77e3124980b.txt");

makespan.hc <- c(798L, 1086L, 4108L, 1220L);
makespan.hcr <- c(733L, 976L, 3861L, 1115L);

width <- 6;
height <- 3;
mar <- c(1.6, 1.6, 0.51, 0.15);

for(i in seq_along(files)) {
  file <- files[[i]];
  components <- unname(unlist(strsplit(file, "_", fixed=TRUE)));
  name <- paste(c("gantt_hcr", components[3L:5L]), sep="_", collapse="_");

  data <- aitoa.load.result.from.log.file(file);

  gantt <- aitoa.jssp.parse.result(data$best.y);

  for(type in c("svg", "pdf")) {
    aitoa.graphic(name=paste0(name, "_", makespan.hc[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
          center.label = paste0(components[[5L]], " / ", as.integer(data$best.f)), mar=mar,
          xlim=c(0L, makespan.hc[[i]]));
    });
    aitoa.graphic(name=paste0(name, "_", makespan.hcr[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
                                      center.label = paste0(components[[5L]], " / ", as.integer(data$best.f)), mar=mar,
                                      xlim=c(0L, makespan.hcr[[i]]));
    });
  }
}
