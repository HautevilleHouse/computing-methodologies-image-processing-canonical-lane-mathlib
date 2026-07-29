import canonicalLaneMathlib.AdmissibleClass

/-!
# Total Variation Package
-/

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure TotalVariationPackage where
  imageGradient : Type u
  l1NormOfGradient : Prop
  regularizationParameter : Prop
  rofModel : Prop
  primalDualAlgorithm : Prop
  edgePreservationTheorem : Prop

structure TotalVariationEvidence (T : TotalVariationPackage) where
  l1NormOfGradientClosed : T.l1NormOfGradient
  regularizationParameterClosed : T.regularizationParameter
  rofModelClosed : T.rofModel
  primalDualAlgorithmClosed : T.primalDualAlgorithm
  edgePreservationTheoremClosed : T.edgePreservationTheorem

def TotalVariationClosed (T : TotalVariationPackage) : Prop :=
  T.l1NormOfGradient ∧ T.regularizationParameter ∧ T.rofModel ∧ T.primalDualAlgorithm ∧ T.edgePreservationTheorem

theorem total_variation_closed_from_evidence (T : TotalVariationPackage)
    (E : TotalVariationEvidence T) : TotalVariationClosed T := by
  exact And.intro E.l1NormOfGradientClosed
    (And.intro E.regularizationParameterClosed
      (And.intro E.rofModelClosed
        (And.intro E.primalDualAlgorithmClosed E.edgePreservationTheoremClosed)))

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse