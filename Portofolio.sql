SELECT * 
FROM [Portofolio Project]..CovidDeaths$
WHERE continent is not null
order by 3,4

----SELECT * 
----FROM [Portofolio Project]..CovidVaccinations$
----order by 3,4

--Select Data that we are going to be using

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM [Portofolio Project]..CovidDeaths$
WHERE continent is not null
order by 1,2

--Looking at Total Cases vs Total Deaths
--Show likelihood of dying if you contract the covid in Indonesia

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM [Portofolio Project]..CovidDeaths$
WHERE location = 'Indonesia'
order by 1,2

--Looking at Total Cases vs Population
--Show what percentage of population got Covid in Indonesia

SELECT location, date, total_cases, population, (total_cases/population)*100 as CasesPercentage
FROM [Portofolio Project]..CovidDeaths$
WHERE location = 'Indonesia'
order by 1,2

--Looking at Countries with highest infection rate compared to population
SELECT location,population, MAX(total_cases) as HighestInfectionCountry, MAX(total_cases/population)*100 as PercentPopulationInfected
FROM [Portofolio Project]..CovidDeaths$
GROUP by location, population
--WHERE location = 'Indonesia'
order by PercentPopulationInfected desc

--Looking at Countries with highest Death Count per population
SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM [Portofolio Project]..CovidDeaths$
WHERE continent is not null
GROUP by location
--WHERE location = 'Indonesia'
order by TotalDeathCount desc

-- Looking at Total Population vs Vaccinations
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
FROM [Portofolio Project]..CovidDeaths$ dea
Join [Portofolio Project]..CovidVaccinations$ vac
On dea.location = vac.location
and dea.date = vac.date
WHERE dea.continent is not null
order by 2,3

