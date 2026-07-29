import canonicalLaneMathlib.AdmissibleClass

/-!
# Wavelet Transform Package
-/

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure WaveletTransformPackage where
  scalingFunction : Type u
  waveletFunction : Type v
  multiresolutionAnalysis : Prop
  decompositionAlgorithm : Prop
  reconstructionAlgorithm : Prop
  perfectReconstruction : Prop

structure WaveletTransformEvidence (W : WaveletTransformPackage) where
  multiresolutionAnalysisClosed : W.multiresolutionAnalysis
  decompositionAlgorithmClosed : W.decompositionAlgorithm
  reconstructionAlgorithmClosed : W.reconstructionAlgorithm
  perfectReconstructionClosed : W.perfectReconstruction

def WaveletTransformClosed (W : WaveletTransformPackage) : Prop :=
  W.multiresolutionAnalysis ∧ W.decompositionAlgorithm ∧ W.reconstructionAlgorithm ∧ W.perfectReconstruction

theorem wavelet_transform_closed_from_evidence (W : WaveletTransformPackage)
    (E : WaveletTransformEvidence W) : WaveletTransformClosed W := by
  exact And.intro E.multiresolutionAnalysisClosed
    (And.intro E.decompositionAlgorithmClosed
      (And.intro E.reconstructionAlgorithmClosed E.perfectReconstructionClosed))

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse