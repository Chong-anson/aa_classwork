# == Schema Information
#
# Table name: stops
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: routes
#
#  num         :string       not null, primary key
#  company     :string       not null, primary key
#  pos         :integer      not null, primary key
#  stop_id     :integer

require_relative './sqlzoo.rb'

def num_stops
  # How many stops are in the database?
  execute(<<-SQL)
  SELECT 
    count(stops.name)
  FROM 
    stops ;
  SQL
end

def craiglockhart_id
  # Find the id value for the stop 'Craiglockhart'.
  execute(<<-SQL)
  SELECT 
    stops.id 
  FROM 
    stops 
  WHERE 
    stops.name = 'Craiglockhart'; 
  SQL
end

def lrt_stops
  # Give the id and the name for the stops on the '4' 'LRT' service.
  execute(<<-SQL)
  SELECT 
    stops.id, stops.name 
  FROM 
    stops 
  JOIN 
    routes ON routes.stop_id = stops.id 
  WHERE 
    routes.num = '4'
  AND 
    company = 'LRT';
  SQL
end

def connecting_routes
  # Consider the following query:
  #
  # SELECT
  #   company,
  #   num,
  #   COUNT(*)
  # FROM
  #   routes
  # WHERE
  #   stop_id = 149 OR stop_id = 53
  # GROUP BY
  #   company, num
  #
  # The query gives the number of routes that visit either London Road
  # (149) or Craiglockhart (53). Run the query and notice the two services
  # that link these stops have a count of 2. Add a HAVING clause to restrict
  # the output to these two routes.
  execute(<<-SQL)
  SELECT
    company,
    num,
    COUNT(*)
  FROM
    routes
  WHERE
    stop_id = 149 OR stop_id = 53
  GROUP BY
    company, num
  HAVING COUNT(*) >= 2;
  SQL
end

def cl_to_lr
  # Consider the query:
  #
  # SELECT
  #   a.company,
  #   a.num,
  #   a.stop_id,
  #   b.stop_id
  # FROM
  #   routes a
  # JOIN
  #   routes b ON (a.company = b.company AND a.num = b.num)
  # WHERE
  #   a.stop_id = 53
  #
  # Observe that b.stop_id gives all the places you can get to from
  # Craiglockhart, without changing routes. Change the query so that it
  # shows the services from Craiglockhart to London Road.
  execute(<<-SQL)
  SELECT 
    a.company,
    a.num, 
    a.stop_id,
    b.stop_id
  FROM 
    routes a 
  JOIN 
    routes b on (a.company = b.company AND a.num = b.num) 
  JOIN 
    stops c ON c.id = a.stop_id
  JOIN 
    stops d ON d.id = b.stop_id 
  WHERE 
    c.name LIKE 'Craiglockhart' 
  AND 
    d.name LIKE 'London Road';
  SQL
end

def cl_to_lr_by_name
  # Consider the query:
  #
  # SELECT
  #   a.company,
  #   a.num,
  #   stopa.name,
  #   stopb.name
  # FROM
  #   routes a
  # JOIN
  #   routes b ON (a.company = b.company AND a.num = b.num)
  # JOIN
  #   stops stopa ON (a.stop_id = stopa.id)
  # JOIN
  #   stops stopb ON (b.stop_id = stopb.id)
  # WHERE
  #   stopa.name = 'Craiglockhart'
  #
  # The query shown is similar to the previous one, however by joining two
  # copies of the stops table we can refer to stops by name rather than by
  # number. Change the query so that the services between 'Craiglockhart' and
  # 'London Road' are shown.
  execute(<<-SQL)
  SELECT 
    a.company,
    a.num, 
    c.name,
    d.name
  FROM 
    routes a 
  JOIN 
    routes b on (a.company = b.company AND a.num = b.num) 
  JOIN 
    stops c ON c.id = a.stop_id
  JOIN 
    stops d ON d.id = b.stop_id 
  WHERE 
    c.name LIKE 'Craiglockhart' 
  AND 
    d.name LIKE 'London Road';

  SQL
end

def haymarket_and_leith
  # Give the company and num of the services that connect stops
  # 115 and 137 ('Haymarket' and 'Leith')
  execute(<<-SQL)
  SELECT DISTINCT
    routes_a.company, 
    routes_a.num
  FROM 
    routes routes_a
  JOIN 
    routes b on (routes_a.company = b.company AND routes_a.num = b.num) 
  JOIN 
    stops c ON c.id = routes_a.stop_id
  JOIN 
    stops d ON d.id = b.stop_id 
  WHERE 
    c.name = 'Haymarket'
  AND 
    d.name = 'Leith';
  SQL
end

def craiglockhart_and_tollcross
  # Give the company and num of the services that connect stops
  # 'Craiglockhart' and 'Tollcross'
  execute(<<-SQL)
  SELECT DISTINCT
    routes_a.company, 
    routes_a.num
  FROM 
    routes routes_a
  JOIN 
    routes b on (routes_a.company = b.company AND routes_a.num = b.num) 
  JOIN 
    stops c ON c.id = routes_a.stop_id
  JOIN 
    stops d ON d.id = b.stop_id 
  WHERE 
    c.name = 'Craiglockhart'
  AND 
    d.name = 'Tollcross';
  SQL
end

def start_at_craiglockhart
  # Give a distinct list of the stops that can be reached from 'Craiglockhart'
  # by taking one bus, including 'Craiglockhart' itself. Include the stop name,
  # as well as the company and bus no. of the relevant service.
  execute(<<-SQL)
  SELECT 
    d.name,
    routes_a.company, 
    routes_a.num
  FROM 
    routes routes_a
  JOIN 
    routes b on (routes_a.company = b.company AND routes_a.num = b.num) 
  JOIN 
    stops c ON c.id = routes_a.stop_id
  JOIN 
    stops d ON d.id = b.stop_id 
  WHERE 
    c.name = 'Craiglockhart';
  SQL
end

def craiglockhart_to_sighthill
  # Find the routes involving two buses that can go from Craiglockhart to
  # Sighthill. Show the bus no. and company for the first bus, the name of the
  # stop for the transfer, and the bus no. and company for the second bus.
  execute(<<-SQL)
  SELECT DISTINCT
    first_bus.start_num,
    first_bus.start_company, 
    second_bus.trans_name, 
    second_bus.new_num,
    second_bus.new_company 
  FROM 
  (
  SELECT 
    routes_a.num AS start_num,
    routes_a.company AS start_company, 
    d.name AS trans_name
    FROM 
    routes routes_a
  JOIN 
    routes b on (routes_a.company = b.company AND routes_a.num = b.num) 
  JOIN 
    stops c ON c.id = routes_a.stop_id
  JOIN 
    stops d ON d.id = b.stop_id 
  WHERE 
    c.name = 'Craiglockhart'
  ) first_bus 
  JOIN 
  (
      SELECT 
        stop_c.name AS trans_name, 
        stop_c.id AS second_bus_id, 
        routes_new.num AS new_num,
        routes_new.company as new_company
      FROM 
        routes routes_new
      JOIN 
        routes routes_b on (routes_new.company = routes_b.company AND routes_new.num = routes_b.num)
      JOIN
        stops stop_c ON stop_c.id = routes_new.stop_id
      JOIN 
        stops stop_d ON stop_d.id = routes_b.stop_id 
      WHERE
        stop_d.name = 'Sighthill' 
    ) second_bus ON second_bus.trans_name = first_bus.trans_name
    ;
  SQL
end
