import canonicalLaneMathlib.AdmissibleClass
import ComputingMethodologiesImageProcessingCanonicalLaneLean.ImageProcessingMathlibObjects

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure EdgeDetectionPackage where
  gradientMethod : Type
  threshold : ℝ
  edgeMapProduced : Prop
  nonMaxSuppression : Prop
  gradientMethodDefined : Nonempty gradientMethod
  thresholdPositive : threshold > 0
  edgeMapProducedClosed : edgeMapProduced
  nonMaxSuppressionClosed : nonMaxSuppression

structure EdgeDetectionEvidence (E : EdgeDetectionPackage) where
  gradientMethodDefinedClosed : E.gradientMethodDefined
  thresholdPositiveClosed : E.thresholdPositive
  edgeMapProducedClosed : E.edgeMapProducedClosed
  nonMaxSuppressionClosed : E.nonMaxSuppressionClosed

def EdgeDetectionClosed (E : EdgeDetectionPackage) : Prop :=
  Nonempty E.gradientMethod ∧ E.threshold > 0 ∧ E.edgeMapProduced ∧ E.nonMaxSuppression

theorem edge_detection_closed_from_evidence (E : EdgeDetectionPackage)
    (Ev : EdgeDetectionEvidence E) : EdgeDetectionClosed E := by
  exact And.intro Ev.gradientMethodDefinedClosed
    (And.intro Ev.thresholdPositiveClosed (And.intro Ev.edgeMapProducedClosed Ev.nonMaxSuppressionClosed))

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse