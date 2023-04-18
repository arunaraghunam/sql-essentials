/*Cleaning data in SQL Queries */


SELECT *
FROM [Portfolio Project].dbo.NashvilleHousing

--Standardise Date Format

SELECT SaleDateConverted, CONVERT(Date, SaleDate)
FROM [Portfolio Project].dbo.NashvilleHousing

Update NashvilleHousing
SET SaleDate = CONVERT(Date, SaleDate)

ALTER TABLE NashvilleHousing
ADD SaleDateConverted Date;

Update NashvilleHousing
SET SaleDateConverted = CONVERT(Date, SaleDate)