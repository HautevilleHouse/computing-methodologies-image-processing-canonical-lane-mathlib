import canonicalLaneMathlib.AdmissibleClass

/-!
# Segmentation Energy Package
-/

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure SegmentationEnergyPackage where
  imageSpace : Type u
  regionModel : Type v
  contourModel : Type w
  regionHomogeneity : Prop
  boundaryRegularity : Prop
  energyFunctional : Prop
  optimizationConvergence : Prop

structure SegmentationEnergyEvidence (S : SegmentationEnergyPackage) where
  regionHomogeneityClosed : S.regionHomogeneity
  boundaryRegularityClosed : S.boundaryRegularity
  energyFunctionalClosed : S.energyFunctional
  optimizationConvergenceClosed : S.optimizationConvergence

def SegmentationEnergyClosed (S : SegmentationEnergyPackage) : Prop :=
  S.regionHomogeneity ∧ S.boundaryRegularity ∧ S.energyFunctional ∧ S.optimizationConvergence

theorem segmentation_energy_closed_from_evidence (S : SegmentationEnergyPackage)
    (E : SegmentationEnergyEvidence S) : SegmentationEnergyClosed S := by
  exact And.intro E.regionHomogeneityClosed
    (And.intro E.boundaryRegularityClosed
      (And.intro E.energyFunctionalClosed E.optimizationConvergenceClosed))

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse