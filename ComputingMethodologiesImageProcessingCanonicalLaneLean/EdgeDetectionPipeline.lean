import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure EdgeDetectionPackage where
  gradientOperator : Type
  nonMaxSuppression : Prop
  hysteresisThresholding : Prop
  edgeMapConsistent : Prop
  subpixelAccuracy : Prop
  falsePositiveBound : Prop

structure EdgeDetectionEvidence (E : EdgeDetectionPackage) where
  gradientOperatorDefined : Prop
  nonMaxSuppressionClosed : E.nonMaxSuppression
  hysteresisThresholdingClosed : E.hysteresisThresholding
  edgeMapConsistentClosed : E.edgeMapConsistent
  subpixelAccuracyClosed : E.subpixelAccuracy
  falsePositiveBoundClosed : E.falsePositiveBound

def EdgeDetectionClosed (E : EdgeDetectionPackage) : Prop :=
  E.nonMaxSuppression ∧ E.hysteresisThresholding ∧ E.edgeMapConsistent ∧
  E.subpixelAccuracy ∧ E.falsePositiveBound

theorem edge_detection_closed_from_evidence (E : EdgeDetectionPackage)
    (Ev : EdgeDetectionEvidence E) : EdgeDetectionClosed E := by
  exact And.intro Ev.nonMaxSuppressionClosed
    (And.intro Ev.hysteresisThresholdingClosed
      (And.intro Ev.edgeMapConsistentClosed
        (And.intro Ev.subpixelAccuracyClosed Ev.falsePositiveBoundClosed)))

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse