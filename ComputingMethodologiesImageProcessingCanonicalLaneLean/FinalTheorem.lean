import canonicalLaneMathlib.AdmissibleClass
import ComputingMethodologiesImageProcessingCanonicalLaneLean.BridgeLemmas
import ComputingMethodologiesImageProcessingCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

def ConstrainedImageProcessingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_image_processing_endgame (A : AdmissibleClass) :
    ConstrainedImageProcessingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse