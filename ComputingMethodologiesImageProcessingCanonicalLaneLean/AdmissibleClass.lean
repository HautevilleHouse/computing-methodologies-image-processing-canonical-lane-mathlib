import ComputingMethodologiesImageProcessingCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure AdmissibleClass where
  object : ImageProcessingAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ImageProcessingWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse
