classdef UnitLibrary < engtools.mixin.utils.Library

    properties (Constant)

%% SI Base Units

        Second = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Time, ...
            "Name", "second", ...
            "Abbreviation", "s", ...
            "AbbreviationAlias", "sec")

        Metre = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Length, ...
            "Name", "metre", ...
            "Alias", "meter", ...
            "Abbreviation", "m")

        Kilogram = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Mass, ...
            "Name", "kilogram", ...
            "Abbreviation", "kg")

        Kelvin = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Temperature, ...
            "Name", "kelvin", ...
            "Abbreviation", "K")

        Ampere = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Current, ...
            "Name", "ampere", ...
            "Alias", "amp", ...
            "Abbreviation", "A")

        Candela = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.LuminousIntensity, ...
            "Name", "candela", ...
            "Abbreviation", "cd")

        Mole = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.AmountOfSubstance, ...
            "Name", "mole", ...
            "Abbreviation", "mol")

%% SI Derived Units
        % https://en.wikipedia.org/wiki/SI_derived_unit

        Hertz = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Frequency, ...
            "Name", "hertz", ...
            "Abbreviation", "Hz")

        Radian = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Angle, ...
            "Name", "radian", ...
            "Abbreviation", "rad")

        Steradian = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.SolidAngle, ...
            "Name", "steradian", ...
            "Abbreviation", "sr")

        Newton = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Force, ...
            "Name", "newton", ...
            "Abbreviation", "N")

        Pascal = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Pressure, ...
            "Name", "pascal", ...
            "Abbreviation", "Pa")

        Joule = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Energy, ...
            "Name", "joule", ...
            "Abbreviation", "J")

        Watt = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Power, ...
            "Name", "watt", ...
            "Abbreviation", "W")

        Coulomb = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.ElectricalCharge, ...
            "Name", "coulomb", ...
            "Abbreviation", "C")

        Volt = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.ElectricalPotential, ...
            "Name", "volt", ...
            "Abbreviation", "V")

        Farad = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Capacitance, ...
            "Name", "farad", ...
            "Abbreviation", "F")

        Ohm = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.ElectricalResistance, ...
            "Name", "ohm", ...
            "Abbreviation", "Ω")

        Siemens = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.ElectricalConductance, ...
            "Name", "siemens", ...
            "Abbreviation", "S")

        Weber = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.MagneticFlux, ...
            "Name", "weber", ...
            "Abbreviation", "Wb")

        Tesla = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.MagneticFluxDensity, ...
            "Name", "tesla", ...
            "Abbreviation", "T")

        Henry = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Inductance, ...
            "Name", "henry", ...
            "Abbreviation", "H")

        Celsius = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Temperature, ...
            "Name", "celsius", ...
            "Abbreviation", "°C", ...
            "AffineConversionFactor", 273.15)

        Lumen = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.LuminousFlux, ...
            "Name", "lumen", ...
            "Abbreviation", "lm")

        Lux = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Illuminance, ...
            "Name", "lux", ...
            "Abbreviation", "lx")

        Becquerel = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Radioactivity, ...
            "Name", "becquerel", ...
            "Abbreviation", "Bq")

        Gray = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.Dose, ...
            "Name", "gray", ...
            "Abbreviation", "Gy")

        Sievert = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.DoseEquivalent, ...
            "Name", "sievert", ...
            "Abbreviation", "Sv")

        Katal = engtools.units.Unit( ...
            "Quantity", engtools.units.QuantityLibrary.CatalyticActivity, ...
            "Name", "katal", ...
            "Abbreviation", "kat")
    
    end

end