library(aitoaEvaluate);

files <- c("hc_1swap_abz7_0x4d76e0390b366999.txt",
           "hc_1swap_la24_0x2b7c6a3ef60c5ec3.txt",
           "hc_1swap_swv15_0x700a1d35338970bc.txt",
           "hc_1swap_yn4_0xe061e588cbb077ff.txt");
makespan.rs <- c(949L, 1208L, 5172L, 1499L);

width <- 6;
height <- 3;
mar <- c(1.6, 1.6, 0.51, 0.15);

for(i in seq_along(files)) {
  file <- files[[i]];
  components <- unname(unlist(strsplit(file, "_", fixed=TRUE)));
  name <- paste(c("gantt", components[1L:3L]), sep="_", collapse="_");

  data <- aitoa.load.result.from.log.file(file);

  gantt <- aitoa.jssp.parse.result(data$best.y);

  for(type in c("svg", "pdf")) {
    aitoa.graphic(name=paste0(name, "_", makespan.rs[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
          center.label = paste0(components[[2L]], " / ", as.integer(data$best.f)), mar=mar,
          xlim=c(0L, makespan.rs[[i]]));
    });
  }
}
