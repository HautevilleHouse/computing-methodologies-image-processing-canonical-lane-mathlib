import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure SegmentationPackage where
  regionGrowing : Type
  graphCut : Type
  levelSet : Type
  segmentationConsistent : Prop
  boundaryRegularization : Prop
  regionHomogeneity : Prop

structure SegmentationEvidence (S : SegmentationPackage) where
  regionGrowingDefined : Prop
  graphCutDefined : Prop
  levelSetDefined : Prop
  segmentationConsistentClosed : S.segmentationConsistent
  boundaryRegularizationClosed : S.boundaryRegularization
  regionHomogeneityClosed : S.regionHomogeneity

def SegmentationClosed (S : SegmentationPackage) : Prop :=
  S.segmentationConsistent ∧ S.boundaryRegularization ∧ S.regionHomogeneity

theorem segmentation_closed_from_evidence (S : SegmentationPackage)
    (E : SegmentationEvidence S) : SegmentationClosed S := by
  exact And.intro E.segmentationConsistentClosed
    (And.intro E.boundaryRegularizationClosed E.regionHomogeneityClosed)

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse