classdef QuantityLibrary < engtools.units.quantity.Quantity ...
    & engtools.mixin.utils.Library


    % properties (SetAccess = immutable)

    %     time
    %     length
    %     mass
    %     temperature
    %     current
    %     amountOfSubstance
    %     luminousIntensity

    % end

    enumeration

        Dimensionless
        Time ("time", 1)
        Length ("length", 1)
        Mass ("mass", 1)
        Temperature ("temperature", 1)
        Current ("current", 1)
        AmountOfSubstance ("amountOfSubstance", 1)
        LuminousIntensity ("luminousIntensity", 1)
        Angle
        Abasement ("time", 1, "length", 1)
        AbsorbedDoseRate ("time", -3, "length", 2)
        Acceleration ("time", -2, "length", 1)
        Action ("time", -1, "length", 2, "mass", 1)
        AngularAcceleration ("time", -2)
        AngularMomentum ("time", -1, "length", 2, "mass", 1)
        AngularVelocity ("time", -1)
        Area ("length", 2)
        AreaDensity ("length", -2, "mass", 1)
        Capacitance ("time", 4, "length", -2, "mass", -1, "current", 2)
        CatalyticActivityConcentration ("time", -1, "length", -3, "amountOfSubstance", 1)
        CentrifugalForce ("time", -2, "length", 1, "mass", 1)
        ChemicalPotential ("time", -2, "length", 2, "mass", 1, "amountOfSubstance", 1)
        Crackle ("time", -5, "length", 1)
        CurrentDensity ("length", -2, "current", 1)
        DoseEquivalent ("time", -2, "length", 2)
        ElectricalConductivity ("time", 4, "length", -3, "mass", -1, "current", 2)
        ElectricalResistance ("time", -3, "length", 2, "mass", 1, "current", -2)
        ElectricalResistivity ("time", -3, "length", 3, "mass", 1, "current", -2)
        Energy ("time", -2, "length", 2, "mass", 1)
        EnergyDensity ("time", 2, "length", -1, "mass", 1)
        Force ("time", -2, "length", 1, "mass", 1)
        Frequency ("time", -1)
        HalfLife ("time", 1)
        Heat ("time", -2, "length", 2, "mass", 1)
        HeatCapacity ("time", -2, "length", 2, "mass", 1, "temperature", -1)
        HeatFluxDensity ("time", -3, "mass", 1)
        Illuminance ("length", -2, "luminousIntensity", 1)
        Impedance ("time", -3, "length", 2, "mass", 1, "current", -2)
        Impulse ("time", -1, "length", 1, "mass", 1)
        Inductance ("time", -2, "length", 2, "mass", 1, "current", -2)
        Irradiance ("time", -3, "mass", 1)
        Intensity ("time", -3, "mass", 1)
        Jerk ("time", -3, "length", 1)
        Jounce ("time", -4, "length", 1)
        LinearDensity ("length", -1, "mass", 1)
        LuminousFlux ("luminousIntensity", 1)
        MachNumber
        MagneticFieldStrength ("length", -1, "current", 1)
        MagneticFlux ("time", -2, "length", 2, "mass", 1, "current", -1)
        MagneticFluxDensity ("time", -2, "mass", 1, "current", -1)
        MagneticMoment ("length", 2, "current", 1)
        Magnetization ("length", -1, "current", 1)
        MassFraction
        Density ("length", -3, "mass", 1)
        MeanLifetime ("time", 1)
        MolarConcentration ("length", -3, "amountOfSubstance", 1)
        MolarEnergy ("time", -2, "length", 2, "mass", 1, "amountOfSubstance", -1)
        MolarEntropy ("time", -2, "length", 2, "mass", 1, "temperature", -1, "amountOfSubstance", -1)
        MolarHeatCapacity ("time", -2, "length", 2, "mass", 1, "temperature", -1, "amountOfSubstance", -1)
        MomentOfInertia ("length", 2, "mass", 1)
        Momentum ("time", -1, "length", 1, "mass", 1)
        OpticalPower ("length", -1)
        Permeability ("time", -2, "length", 1, "mass", 1, "current", -2)
        Permittivity ("time", 4, "length", -3, "mass", -1, "current", 2)
        PlaneAngle
        Pop ("time", -6, "length", 1)
        Power ("time", -3, "length", 2, "mass", 1)
        Pressure ("time", -2, "length", -1, "mass", 1)
        PressureGradient ("time", -2, "length", -2, "mass", 1)
        Activity ("time", -1)
        Dose ("time", -2, "length", 2)
        Radiance ("time", -3, "mass", 1)
        RadiantIntensity ("time", -3, "length", 2, "mass", 1)
        ReactionRate ("time", -1, "length", -3, "amountOfSubstance", 1)
        Reluctance ("time", 2, "length", -2, "mass", -1, "current", 2)
        SolidAngle
        SpecificEnergy ("time", -2, "length", 2)
        SpecificHeatCapacity ("time", -2, "length", 2, "temperature", -1)
        SpecificVolume ("length", 3, "mass", -1)
        Spin ("time", -1, "length", 2, "mass", 1)
        Strain
        Stress ("time", -2, "length", -1, "mass", 1)
        SurfaceTension ("time", -2, "mass", 1)
        TemperatureGradient ("length", -1, "temperature", 1)
        ThermalConductance ("time", -3, "length", 2, "mass", 1, "temperature", -1)
        ThermalConductivity ("time", -3, "length", 1, "mass", 1, "temperature", -1)
        ThermalResistance ("time", 3, "length", -2, "mass", -1, "temperature", 1)
        ThermalResistivity ("time", 3, "length", -1, "mass", -1, "temperature", 1)
        Torque ("time", -2, "length", 2, "mass", 1)
        Velocity ("time", -1, "length", 1)
        Volume ("length", 3)
        VolumetricFlowRate ("time", -1, "length", 3)
        Wavelength ("length", 1)
        Wavenumber ("length", -1)
        Wavevector ("length", -1)
        Weight ("time", -2, "length", 1, "mass", 1)
        Work ("time", -2, "length", 2, "mass", 1)
        YoungsModulus ("time", -2, "length", -1, "mass", 1)
        SpringConstant ("time", -2, "mass", 1)

    end

end