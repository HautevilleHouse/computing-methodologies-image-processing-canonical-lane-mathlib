import canonicalLaneMathlib.AdmissibleClass
import ComputingMethodologiesImageProcessingCanonicalLaneLean.ImageProcessingMathlibObjects

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure ImageCompressionPackage where
  compressionRatio : ℝ
  distortionBound : ℝ
  entropyPreserved : Prop
  compressionRatioClosed : compressionRatio > 0
  distortionBoundClosed : distortionBound < 1
  entropyPreservedClosed : entropyPreserved

structure ImageCompressionEvidence (P : ImageCompressionPackage) where
  compressionRatioClosed : P.compressionRatioClosed
  distortionBoundClosed : P.distortionBoundClosed
  entropyPreservedClosed : P.entropyPreservedClosed

def ImageCompressionClosed (P : ImageCompressionPackage) : Prop :=
  P.compressionRatio > 0 ∧ P.distortionBound < 1 ∧ P.entropyPreserved

theorem image_compression_closed_from_evidence (P : ImageCompressionPackage)
    (E : ImageCompressionEvidence P) : ImageCompressionClosed P := by
  exact And.intro E.compressionRatioClosed (And.intro E.distortionBoundClosed E.entropyPreservedClosed)

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse