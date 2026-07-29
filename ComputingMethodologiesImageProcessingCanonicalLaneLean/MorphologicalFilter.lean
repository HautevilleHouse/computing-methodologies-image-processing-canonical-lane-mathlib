import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure MorphologicalFilterPackage where
  structuringElement : Type
  erosion : Type
  dilation : Type
  opening : Type
  closing : Type
  morphologicalLawful : Prop
  decompositionValid : Prop

structure MorphologicalFilterEvidence (M : MorphologicalFilterPackage) where
  erosionDefined : Prop
  dilationDefined : Prop
  openingDefined : Prop
  closingDefined : Prop
  morphologicalLawfulClosed : M.morphologicalLawful
  decompositionValidClosed : M.decompositionValid

def MorphologicalFilterClosed (M : MorphologicalFilterPackage) : Prop :=
  M.morphologicalLawful ∧ M.decompositionValid

theorem morphological_filter_closed_from_evidence (M : MorphologicalFilterPackage)
    (E : MorphologicalFilterEvidence M) : MorphologicalFilterClosed M := by
  exact And.intro E.morphologicalLawfulClosed E.decompositionValidClosed

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse