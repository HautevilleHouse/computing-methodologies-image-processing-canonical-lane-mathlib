import canonicalLaneMathlib.AdmissibleClass

/-!
# Image Denoising Closure Package
-/

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure ImageDenoisingPackage where
  imageDomain : Type u
  pixelValues : Type v
  noiseModel : Prop
  denoisingOperator : Type w
  fidelityTerm : Prop
  regularizationTerm : Prop
  edgePreservation : Prop

structure ImageDenoisingEvidence (D : ImageDenoisingPackage) where
  noiseModelClosed : D.noiseModel
  fidelityTermClosed : D.fidelityTerm
  regularizationTermClosed : D.regularizationTerm
  edgePreservationClosed : D.edgePreservation

def ImageDenoisingClosed (D : ImageDenoisingPackage) : Prop :=
  D.noiseModel ∧ D.fidelityTerm ∧ D.regularizationTerm ∧ D.edgePreservation

theorem image_denoising_closed_from_evidence (D : ImageDenoisingPackage)
    (E : ImageDenoisingEvidence D) : ImageDenoisingClosed D := by
  exact And.intro E.noiseModelClosed
    (And.intro E.fidelityTermClosed
      (And.intro E.regularizationTermClosed E.edgePreservationClosed))

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse