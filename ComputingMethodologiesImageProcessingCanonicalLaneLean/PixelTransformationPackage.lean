import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure PixelTransformationPackage where
  spatialFilter : Type
  intensityMapping : Type
  convolutionKernel : Type
  transformationLawful : Prop
  invertibleIfNonSingular : Prop
  preservationOfImageStructure : Prop

structure PixelTransformationEvidence (P : PixelTransformationPackage) where
  transformationLawfulClosed : P.transformationLawful
  invertibleIfNonSingularClosed : P.invertibleIfNonSingular
  preservationOfImageStructureClosed : P.preservationOfImageStructure

def PixelTransformationClosed (P : PixelTransformationPackage) : Prop :=
  P.transformationLawful ∧ P.invertibleIfNonSingular ∧ P.preservationOfImageStructure

theorem pixel_transformation_closed_from_evidence (P : PixelTransformationPackage)
    (E : PixelTransformationEvidence P) : PixelTransformationClosed P := by
  exact And.intro E.transformationLawfulClosed
    (And.intro E.invertibleIfNonSingularClosed E.preservationOfImageStructureClosed)

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse