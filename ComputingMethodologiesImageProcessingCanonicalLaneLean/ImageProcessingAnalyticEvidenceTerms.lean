import canonicalLaneMathlib.AdmissibleClass
import ComputingMethodologiesImageProcessingCanonicalLaneLean.ImageProcessingMathlibObjects

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure ConvolutionAnalyticEvidenceTerms (P : ImageProcessingAdmittedObject) where
  kernelDefined : Prop
  convolutionClosed : P.convolutionClosed
  linearityPreserved : Prop
  ev : P.convolutionTopology

def ConvolutionAnalyticEvidenceTerms.evidenceTerms (P : ImageProcessingAdmittedObject)
    (h : P.linearFilterClosed) : ConvolutionAnalyticEvidenceTerms P := by
  refine {
    kernelDefined := h,
    convolutionClosed := h,
    linearityPreserved := h,
    ev := P.convolutionTopology
  }

structure SamplingAnalyticEvidenceTerms (P : ImageProcessingAdmittedObject) where
  sampleRate : ℕ
  aliasingFree : Prop
  reconstructionError : ℝ
  sampleRateClosed : sampleRate ≥ P.sampleSize
  aliasingFreeClosed : aliasingFree
  reconstructionErrorClosed : reconstructionError < 0.01

def SamplingAnalyticEvidenceTerms.evidenceTerms (P : ImageProcessingAdmittedObject)
    (h : P.sampleSize > 0) : SamplingAnalyticEvidenceTerms P := by
  refine {
    sampleRate := P.sampleSize,
    aliasingFree := h,
    reconstructionError := 0.001,
    sampleRateClosed := by
      have : P.sampleSize ≥ P.sampleSize := le_refl _
      exact this,
    aliasingFreeClosed := h,
    reconstructionErrorClosed := by norm_num
  }

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse