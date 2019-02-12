#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

en = WikiData::Category.new('Category:Members of the National Assembly (Panama)', 'en').member_titles |
     WikiData::Category.new('Category:Presidents of the National Assembly (Panama)', 'en').member_titles |
     WikiData::Category.new('Category:Panamanian politicians', 'en').member_titles |
     WikiData::Category.new('Category:Panamanian women in politics', 'en').member_titles

es = WikiData::Category.new('Categoría:Políticos de Panamá', 'es').member_titles |
     WikiData::Category.new('Categoría:Diputados de Panamá', 'es').member_titles

query = 'SELECT DISTINCT ?item { ?item wdt:P39 wd:Q21295996 }'
ids = EveryPolitician::Wikidata.sparql(query)

EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { en: en, es: es })

