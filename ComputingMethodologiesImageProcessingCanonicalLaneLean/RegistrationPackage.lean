import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure RegistrationPackage where
  featureDetection : Type
  matchingStrategy : Type
  transformationModel : Type
  registrationConsistent : Prop
  convergenceGuarantee : Prop
  outlierRejection : Prop

structure RegistrationEvidence (R : RegistrationPackage) where
  featureDetectionDefined : Prop
  matchingStrategyDefined : Prop
  transformationModelDefined : Prop
  registrationConsistentClosed : R.registrationConsistent
  convergenceGuaranteeClosed : R.convergenceGuarantee
  outlierRejectionClosed : R.outlierRejection

def RegistrationClosed (R : RegistrationPackage) : Prop :=
  R.registrationConsistent ∧ R.convergenceGuarantee ∧ R.outlierRejection

theorem registration_closed_from_evidence (R : RegistrationPackage)
    (E : RegistrationEvidence R) : RegistrationClosed R := by
  exact And.intro E.registrationConsistentClosed
    (And.intro E.convergenceGuaranteeClosed E.outlierRejectionClosed)

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse