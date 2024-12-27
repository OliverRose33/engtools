classdef Constants
%% SI Base Constants
    properties (Constant)
        CaesiumHyperfineFrequency = 9192631770
        SpeedOfLight = 299792458
        Planck = 6.62607015e-34
        ElementaryCharge = 1.602176634e-19
        Boltzmann = 1.380649e-23
        Avogadro = 6.02214076e23
        LuminousEfficacyOfMonochromaticRadiation = 683
    end

%% Derived Constants
    properties (Constant, Hidden)
        ReducedPlanck = engtools.Constants.h / (2 * pi)
        StefanBoltzmann = pi^2 * engtools.Constants.k^4 ...
            / (60 * engtools.Constants.ReducedPlanck^3 * engtools.Constants.c^2)
        FirstRadiation = 2 * pi * engtools.Constants.h * engtools.Constants.c^2
        FirstRadiationSpectral = ...
            (2 * engtools.Constants.h * engtools.Constants.c^2)
        SecondRadiation = ...
            (engtools.Constants.h * engtools.Constants.c / engtools.Constants.k)
        ConductanceQuantum = 2 * engtools.Constants.e^2 / engtools.Constants.h
        InverseConductanceQuantum = 1 / engtools.Constants.ConductanceQuantum
        VonKlitzing = engtools.Constants.h / engtools.Constants.e^2
        Josephson = 2 * engtools.Constants.e / engtools.Constants.h
        MagneticFluxQuantum = engtools.Constants.h / (2 * engtools.Constants.e)
        MolarGas = engtools.Constants.NA * engtools.Constants.k
        Faraday = engtools.Constants.NA * engtools.Constants.e
        MolarPlanck = engtools.Constants.NA * engtools.Constants.h
    end

%% Abbreviations
    properties (Constant, Hidden)
        % SI Base Constants
        vcs = engtools.Constants.CaesiumHyperfineFrequency
        c = engtools.Constants.SpeedOfLight
        h = engtools.Constants.Planck
        e = engtools.Constants.ElementaryCharge
        k = engtools.Constants.Boltzmann
        kB = engtools.Constants.Boltzmann
        NA = engtools.Constants.Avogadro
        Kcd = engtools.Constants.LuminousEfficacyOfMonochromaticRadiation
        % Derived Constants
        hbar = engtools.Constants.ReducedPlanck
        sigma = engtools.Constants.StefanBoltzmann
        c1 = engtools.Constants.FirstRadiation
        c1L = engtools.Constants.FirstRadiationSpectral
        c2 = engtools.Constants.SecondRadiation
        G0 = engtools.Constants.ConductanceQuantum
        G0_1 = engtools.Constants.InverseConductanceQuantum
        RK = engtools.Constants.VonKlitzing
        KJ = engtools.Constants.Josephson
        Phi0 = engtools.Constants.MagneticFluxQuantum
        R = engtools.Constants.MolarGas
        F = engtools.Constants.Faraday
        NAh = engtools.Constants.MolarPlanck
    end
end