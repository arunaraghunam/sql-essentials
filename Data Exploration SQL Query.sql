SELECT *      
FROM [Portfolio Project]..CovidDeaths
ORDER BY 3,4

--SELECT *      
--FROM [Portfolio Project]..CovidVaccinations
--ORDER BY 3,4

-- Select Data that we are going to be using

SELECT Location, date, total_cases, new_cases, total_deaths, population
FROM [Portfolio Project]..CovidDeaths
ORDER BY 1,2

-- Looking at Total Cases vs Total Deaths
-- How many deaths per entire cases, filter by location
-- Shows likelihood of dying if you contact covid in your country

--select DISTINCT location from [dbo].[CovidDeaths]
SELECT
    location, 
    date, 
    total_cases, 
    population, 
    CONVERT(DECIMAL(18, 2), (CONVERT(DECIMAL(18, 2), total_cases) / CONVERT(DECIMAL(18, 2), population)))*100 as [DeathPercentage]
from CovidDeaths
--WHERE Location like '%kingd%'
order by 1,2

-- Looking at the Total cases vs Population

SELECT
    location, 
    date, 
	population,
    total_cases, 
      CONVERT(DECIMAL(18, 2), (CONVERT(DECIMAL(18, 2), total_cases) / CONVERT(DECIMAL(18, 2), population)))*100 as [PercentPopulationInfected]
from CovidDeaths
--WHERE Location like '%states%'
order by 1,2

--What countries have highest infection rates compared to populations
SELECT
    location, 
  	population,
    MAX(total_cases) as HighestInfectionCount, 
      CONVERT(DECIMAL(18, 2), (CONVERT(DECIMAL(18, 2), MAX(total_cases)) / CONVERT(DECIMAL(18, 2), population)))*100 as [PercentPopulationInfected]
from CovidDeaths
--WHERE Location like '%states%'
GROUP BY Location, population
order by PercentPopulationInfected DESC


