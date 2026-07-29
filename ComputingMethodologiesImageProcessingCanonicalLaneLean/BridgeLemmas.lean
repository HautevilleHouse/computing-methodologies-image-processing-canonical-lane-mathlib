import ComputingMethodologiesImageProcessingCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ImageProcessingWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse
