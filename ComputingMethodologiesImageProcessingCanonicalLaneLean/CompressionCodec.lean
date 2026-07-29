import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputingMethodologiesImageProcessingCanonicalLaneLean

structure CompressionCodecPackage where
  transformCoding : Type
  quantization : Type
  entropyCoding : Type
  lossyReconstruction : Prop
  losslessBound : Prop
  compressionRatioAchieved : Prop
  fidelityCriteria : Prop

structure CompressionCodecEvidence (C : CompressionCodecPackage) where
  transformCodingDefined : Prop
  quantizationDefined : Prop
  entropyCodingDefined : Prop
  lossyReconstructionClosed : C.lossyReconstruction
  losslessBoundClosed : C.losslessBound
  compressionRatioAchievedClosed : C.compressionRatioAchieved
  fidelityCriteriaClosed : C.fidelityCriteria

def CompressionCodecClosed (C : CompressionCodecPackage) : Prop :=
  C.lossyReconstruction ∧ C.losslessBound ∧ C.compressionRatioAchieved ∧ C.fidelityCriteria

theorem compression_codec_closed_from_evidence (C : CompressionCodecPackage)
    (E : CompressionCodecEvidence C) : CompressionCodecClosed C := by
  exact And.intro E.lossyReconstructionClosed
    (And.intro E.losslessBoundClosed
      (And.intro E.compressionRatioAchievedClosed E.fidelityCriteriaClosed))

end ComputingMethodologiesImageProcessingCanonicalLaneLean
end HautevilleHouse