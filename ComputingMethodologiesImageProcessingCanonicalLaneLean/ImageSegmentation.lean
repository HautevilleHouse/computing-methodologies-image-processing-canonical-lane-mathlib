import canonicalLaneMathlib.AdmissibleClass
import ComputingMethodologiesImageProcessingCanonicalLaneLean.ImageProcessingMathlibObjects

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure ImageSegmentationPackage where
  method : Type
  numSegments : ℕ
  segments : Prop
  boundaries : Prop
  methodDefined : Nonempty method
  numSegmentsPositive : numSegments > 0
  segmentsClosed : segments
  boundariesClosed : boundaries

structure ImageSegmentationEvidence (S : ImageSegmentationPackage) where
  methodDefinedClosed : S.methodDefined
  numSegmentsPositiveClosed : S.numSegmentsPositive
  segmentsClosed : S.segmentsClosed
  boundariesClosed : S.boundariesClosed

def ImageSegmentationClosed (S : ImageSegmentationPackage) : Prop :=
  Nonempty S.method ∧ S.numSegments > 0 ∧ S.segments ∧ S.boundaries

theorem image_segmentation_closed_from_evidence (S : ImageSegmentationPackage)
    (Ev : ImageSegmentationEvidence S) : ImageSegmentationClosed S := by
  exact And.intro Ev.methodDefinedClosed
    (And.intro Ev.numSegmentsPositiveClosed (And.intro Ev.segmentsClosed Ev.boundariesClosed))

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse