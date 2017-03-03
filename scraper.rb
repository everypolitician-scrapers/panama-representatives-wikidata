#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

en = WikiData::Category.new('Category:Members of the National Assembly (Panama)', 'en').member_titles |
     WikiData::Category.new('Category:Presidents of the National Assembly (Panama)', 'en').member_titles |
     WikiData::Category.new('Category:Panamanian politicians', 'en').member_titles |
     WikiData::Category.new('Category:Panamanian women in politics', 'en').member_titles

es = WikiData::Category.new('Categoría:Políticos de Panamá', 'es').member_titles |
     WikiData::Category.new('Categoría:Diputados de Panamá', 'es').member_titles

EveryPolitician::Wikidata.scrape_wikidata(names: { en: en, es: es })

