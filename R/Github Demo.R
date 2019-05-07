ROR1.processed.data<-preprocess_querydata(cell.tissue.data = ROR1.data, exp.cutoff.th = 1.8)

ROR1.active.pathway<-identify_active_pathway_path(pathway.path = pathway.path, processed.query.data = ROR1.processed.data)

unlist(ROR1.active.pathway$ROR1_LEC, recursive = F, use.names = F)

ROR1.active.pathway.ranking.metric<-get_pathway_ranking_metric(active.pathway.path = ROR1.active.pathway, processed.query.data = ROR1.processed.data, high.exp.th = 7)
