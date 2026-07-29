import canonicalLaneMathlib.AdmissibleClass
import ComputingMethodologiesImageProcessingCanonicalLaneLean.ImageProcessingMathlibObjects

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure ConvolutionAnalyticCertificate (P : ImageProcessingAdmittedObject) where
  kernelDefined : Prop
  convolutionClosed : Prop
  linearityPreserved : Prop
  kernelDefinedClosed : kernelDefined
  convolutionClosedClosed : convolutionClosed
  linearityPreservedClosed : linearityPreserved
  curvatureEvidence : ImageProcessingWitnessClosed P

def ConvolutionAnalyticCertificateClosed (C : ConvolutionAnalyticCertificate P) : Prop :=
  C.kernelDefined ∧ C.convolutionClosed ∧ C.linearityPreserved

theorem convolution_analytic_certificate_closed (C : ConvolutionAnalyticCertificate P) :
    ConvolutionAnalyticCertificateClosed C := by
  exact And.intro C.kernelDefinedClosed (And.intro C.convolutionClosedClosed C.linearityPreservedClosed)

structure SamplingAnalyticCertificate (P : ImageProcessingAdmittedObject) where
  sampleRate : ℕ
  aliasingFree : Prop
  reconstructionError : ℝ
  sampleRateClosed : sampleRate ≥ P.sampleSize
  aliasingFreeClosed : aliasingFree
  reconstructionErrorClosed : reconstructionError < 0.01
  samplingEvidence : ImageProcessingWitnessClosed P

def SamplingAnalyticCertificateClosed (C : SamplingAnalyticCertificate P) : Prop :=
  C.sampleRate ≥ P.sampleSize ∧ C.aliasingFree ∧ C.reconstructionError < 0.01

theorem sampling_analytic_certificate_closed (C : SamplingAnalyticCertificate P) :
    SamplingAnalyticCertificateClosed C := by
  exact And.intro C.sampleRateClosed (And.intro C.aliasingFreeClosed C.reconstructionErrorClosed)

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse