# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
  SELECT
    name
  FROM
    countries
  WHERE
    gdp > (
      SELECT
        max(gdp)
      FROM
        countries
      WHERE
        continent LIKE 'Europe'
    )
  ;
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
  SELECT
    continent, name, area
  FROM
    countries 
  WHERE
    area in (
      SELECT
        max(area)
      FROM
        countries
      GROUP BY
        continent
    )
    ORDER BY continent ASC
    ;
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
  SELECT
    a3.name, a3.continent
  FROM
    countries a3
  WHERE
    a3.population > 3 * (
                      select 
                         a1.population
                      from countries a1
                      where 
                        a1.population = ( 
                                    select 
                                      a2.population
                                    from countries a2
                                    where a1.continent = a2.continent
                                    order by population desc
                                    limit 1 
                                    offset 1
                          )
                          AND 
                          a3.continent = a1.continent
                        )

  ;
  SQL
end

# select  a1.continent, a1.name, a1.area
# from countries a1
# where 
# a1.area = ( select max(a2.area) 
# from countries a2
# group by a2.continent
# having a2.continent = a1.continent
# );

