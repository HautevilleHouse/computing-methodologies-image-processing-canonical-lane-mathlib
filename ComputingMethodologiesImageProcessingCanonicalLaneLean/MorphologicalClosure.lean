import canonicalLaneMathlib.AdmissibleClass

/-!
# Morphological Closure Package
-/

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure MorphologicalPackage where
  structuringElement : Type u
  erosionOperation : Prop
  dilationOperation : Prop
  openingOperation : Prop
  closingOperation : Prop
  idempotenceOfClosing : Prop

structure MorphologicalEvidence (M : MorphologicalPackage) where
  erosionOperationClosed : M.erosionOperation
  dilationOperationClosed : M.dilationOperation
  openingOperationClosed : M.openingOperation
  closingOperationClosed : M.closingOperation
  idempotenceOfClosingClosed : M.idempotenceOfClosing

def MorphologicalClosed (M : MorphologicalPackage) : Prop :=
  M.erosionOperation ∧ M.dilationOperation ∧ M.openingOperation ∧ M.closingOperation ∧ M.idempotenceOfClosing

theorem morphological_closed_from_evidence (M : MorphologicalPackage)
    (E : MorphologicalEvidence M) : MorphologicalClosed M := by
  exact And.intro E.erosionOperationClosed
    (And.intro E.dilationOperationClosed
      (And.intro E.openingOperationClosed
        (And.intro E.closingOperationClosed E.idempotenceOfClosingClosed)))

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse